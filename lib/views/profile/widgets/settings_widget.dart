import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../common/services/secure_storage.dart';
import '../../../constants/widgets/base_btn.dart';
import '../../../constants/widgets/flutter_toast.dart';
import '../../../controllers/them_bloc/theme_bloc.dart';
import '../../../controllers/them_bloc/theme_event.dart';
import '../../../global.dart';
import 'about.dart';

Widget settings(BuildContext context, double width) {
  return Container(
      width: width,
      margin: EdgeInsets.only(
        right: width * 0.04,
        left: width * 0.04,
      ),
      decoration: BoxDecoration(
          color: Global.darkMode!
              ? const Color.fromARGB(255, 33, 33, 33)
              : const Color.fromARGB(255, 255, 255, 255),
          borderRadius: const BorderRadius.all(Radius.circular(15))),
      child: Column(
        children: [
          settingsItem(
            () {
              Global.darkMode = !Global.darkMode!;
              UserSecureStorage.saveVariable(
                  'darkMode', Global.darkMode.toString());
              context.read<ThemeBloc>().add(BrightnessEvent(Global.darkMode!));
            },
            'Dark Mode',
            Icons.nightlight_round,
            width,
            Switch(
                activeColor: Colors.white,
                activeTrackColor: Colors.grey[850],
                inactiveThumbColor: Colors.blueGrey.shade600,
                inactiveTrackColor: Colors.grey.shade400,
                splashRadius: 50.0,
                value: Global.darkMode!,
                onChanged: (value) {
                  Global.darkMode = !Global.darkMode!;
                  UserSecureStorage.saveVariable('darkMode', value.toString());
                  context.read<ThemeBloc>().add(BrightnessEvent(value));
                }),
          ),
          settingsItem(() async {
            if (await launchUrl(Uri.parse('https://demo.egensolve.com'))) {
            } else {
              throw toastInfo(msg: 'Check Your Internet');
              //  Exception('Could not launch');
            }
          }, 'Privacy & Policy', FontAwesomeIcons.linesLeaning, width, null),
          settingsItem(() {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const AboutPage()));
          }, 'About Us', Icons.info, width, null),
        ],
      ));
}

Widget settingsItem(void Function()? function, String text, IconData icon,
    double width, Widget? toggle) {
  return ActionBTN(
    function: function,
    shadowless: true,
    text: text,
    fontSize: 18,
    fontWeight: FontWeight.w600,
    prefixIcon: Icon(
      icon,
      color: Global.darkMode!
          ? const Color.fromARGB(255, 255, 255, 255)
          : const Color.fromARGB(255, 33, 33, 33),
    ),
    bg: Global.darkMode!
        ? const Color.fromARGB(255, 33, 33, 33)
        : const Color.fromARGB(255, 255, 255, 255),
    textColor: Global.darkMode!
        ? const Color.fromARGB(255, 255, 255, 255)
        : const Color.fromARGB(255, 33, 33, 33),
    iconPadding: width * 0.05,
    width: width,
    toggle: toggle,
  );
}
