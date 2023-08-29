import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../api/data/fetched_user_data.dart';
import '../../../constants/widgets/base_btn.dart';
import '../../../constants/widgets/flutter_toast.dart';
import '../../../global.dart';

Widget buildProfileHeader(double height, double width) {
  return Container(
    color: Colors.transparent,
    alignment: Alignment.center,
    height: height * 0.1,
    width: width,
    child: Text(
      '${UserData.firstName} ${UserData.lastName}',
      style: const TextStyle(fontSize: 25),
    ),
  );
}

Widget profileDetails(double width, double height) {
  return Container(
    margin: EdgeInsets.only(
        right: width * 0.04, left: width * 0.04, bottom: height * 0.02),
    decoration: BoxDecoration(
        color: Global.darkMode!
            ? const Color.fromARGB(255, 33, 33, 33)
            : const Color.fromARGB(255, 255, 255, 255),
        borderRadius: const BorderRadius.all(Radius.circular(15))),
    child: Wrap(
      children: [
        profileItem(width, Icons.person, UserData.userName!, 'Username'),
        profileItem(width, Icons.email_rounded, UserData.email!, 'Email'),
        profileItem(
            width, Icons.lock_outline_rounded, Global.password!, 'Password'),
        profileItem(width, Icons.phone_android, UserData.phone!, 'Number'),
        profileItem(width, Icons.flag, UserData.country!, 'Country'),
        profileItem(
            width, FontAwesomeIcons.globe, UserData.timezone!, 'Timezone'),
        UserData.totalHours != null
            ? profileItem(
                width, Icons.person, UserData.totalHours!, 'Total hours')
            : const SizedBox(height: 0),
        UserData.age != null
            ? profileItem(width, Icons.timer_rounded, UserData.age!, 'Age')
            : const SizedBox(height: 0),
      ],
    ),
  );
}

Widget profileItem(double width, IconData icon, String text, String type) {
  return ActionBTN(
    iconPadding: width * 0.05,
    prefixIcon: FaIcon(
      icon,
      color: Global.darkMode! ? Colors.white : Colors.black,
    ),
    text: text,
    fontSize: 18,
    width: width,
    fontWeight: FontWeight.w600,
    shadowless: true,
    textColor: Global.darkMode! ? Colors.white : Colors.black,
    bg: Colors.transparent,
    longPress: () {
      toastInfo(msg: '$type Copied!');
      Clipboard.setData(ClipboardData(text: text));
    },
  );
}
