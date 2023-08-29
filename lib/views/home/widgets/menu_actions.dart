import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../api/data/fetched_user_data.dart';
import '../../../constants/core/theme/app_colors.dart';
import '../../../constants/widgets/base_btn.dart';
import '../../../constants/widgets/flutter_toast.dart';
import '../../../controllers/session_cubit/session_cubit.dart';
import '../../../global.dart';
import 'home_sessions.dart';
import 'session_actions.dart';

class MenuActions {
  final BuildContext context;
  final String sessionState;
  final bool isTeacher;
  final double btnWidth;
  final int? index;
  late Color primaryColor;
  late FaIcon prefixIcon;
  TextEditingController notes = TextEditingController();

  MenuActions(
    this.context,
    this.sessionState,
    this.isTeacher,
    this.btnWidth,
    this.index,
  );

  List<Widget> buildActionBTNS() {
    if (isTeacher) {
      if (sessionState == 'Pending' || sessionState == 'Make-Up') {
        return [
          Padding(
            padding: EdgeInsets.only(bottom: btnWidth * 0.04),
            child: customBaseBTN('Enter Class'),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: btnWidth * 0.04),
            child: customBaseBTN('Absent Student'),
          ),
          customBaseBTN('Request Cancel'),
        ];
      } else if (sessionState == 'Waiting') {
        return [
          Padding(
            padding: EdgeInsets.only(bottom: btnWidth * 0.04),
            child: customBaseBTN('End Class'),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: btnWidth * 0.04),
            child: customBaseBTN('Absent Student'),
          ),
          customBaseBTN('Request Cancel'),
        ];
      } else if (sessionState == 'Running') {
        return [
          Padding(
            padding: EdgeInsets.only(bottom: btnWidth * 0.04),
            child: customBaseBTN('End Class'),
          ),
          customBaseBTN('Absent Student'),
        ];
      }
    } else {
      if (sessionState == 'Waiting' || sessionState == 'Pending') {
        return [
          Padding(
            padding: EdgeInsets.only(bottom: btnWidth * 0.04),
            child: customBaseBTN('Enter Class'),
          ),
          customBaseBTN('Request Cancel'),
        ];
      } else if (sessionState == 'Running') {
        return [customBaseBTN('Enter Class')];
      }
    }
    return [];
  }

  Widget customBaseBTN(final String actionTYPE,
      {prefixIcon = const Icon(Icons.question_mark)}) {
    void Function()? function;
    switch (actionTYPE) {
      case 'Enter Class':
        primaryColor = AppColors.lightGreen;
        prefixIcon = FaIcon(
          FontAwesomeIcons.rightToBracket,
          color: primaryColor,
        );
        function = () async {
          String url = await context
              .read<SessionCubit>()
              .enterClass(context, homeSessions[index!].id.toString());
          if (isTeacher) {
            if (await canLaunchUrl(Uri.parse(UserData.zoomLink!))) {
              launchUrl(Uri.parse(UserData.zoomLink!));
            } else {
              toastInfo(msg: 'Can\'t launch meeting URL');
            }
          } else {
            if (await canLaunchUrl(Uri.parse(url))) {
              launchUrl(Uri.parse(url));
            } else {
              toastInfo(msg: 'Can\'t launch meeting URL');
            }
          }
        };
        break;
      case 'End Class':
        primaryColor = AppColors.error;
        prefixIcon = FaIcon(
          FontAwesomeIcons.arrowRightFromBracket,
          size: 17,
          color: primaryColor,
        );
        function = () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SessionActions(
                      type: 'End Class',
                      index: index!,
                    )));
        break;
      case 'Request Cancel':
        primaryColor = AppColors.error;
        prefixIcon = FaIcon(
          FontAwesomeIcons.ban,
          size: 17,
          color: primaryColor,
        );
        function = () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SessionActions(
                      type: 'Request Cancel',
                      index: index!,
                    )));
        break;
      case 'Absent Student':
        primaryColor = AppColors.darkGrey;
        prefixIcon = FaIcon(
          FontAwesomeIcons.minus,
          size: 17,
          color: primaryColor,
        );
        function = () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    SessionActions(type: 'Absent Page', index: index!)));
        break;
    }
    return ActionBTN(
      function: function,
      prefixIcon: prefixIcon,
      text: actionTYPE,
      textColor: primaryColor,
      height: null,
      bg: Global.darkMode!
          ? Colors.white
          : const Color.fromARGB(255, 232, 232, 232),
      fontSize: 17,
      fontWeight: FontWeight.normal,
      iconPadding: null,
      shadowless: false,
      width: null,
    );
  }
}
