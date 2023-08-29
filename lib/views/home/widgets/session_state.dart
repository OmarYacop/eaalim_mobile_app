import 'package:flutter/material.dart';

import '../../../constants/core/theme/app_colors.dart';

class SessionState {
  late Color? color;
  late String sessionState;

  void checkState(int state) {
    /// Check State Of Session
    switch (state) {
      case 1:
        sessionState = 'Pending';
        color = const Color.fromARGB(255, 193, 193, 185);
        break;
      case 2:
        sessionState = 'Waiting';
        color = const Color.fromARGB(255, 250, 123, 55);
        break;
      case 3:
        sessionState = 'Teacher Absent';
        color = AppColors.error.withRed(200).withBlue(50).withOpacity(0.7);

        break;
      case 4:
        sessionState = 'Student Absent';
        color = AppColors.error.withRed(200).withBlue(50).withOpacity(0.7);

        break;
      case 5:
        sessionState = 'Student Cancelled';
        color = AppColors.error.withAlpha(230);
        break;
      case 6:
        sessionState = 'Teacher Cancelled';
        color = AppColors.error;
        break;
      case 7:
        sessionState = 'Admin Cancelled';
        color = AppColors.error;
        break;
      case 8:
        sessionState = 'Attended';
        color = AppColors.green;
        break;
      case 9:
        sessionState = 'Rescheduled';
        color = AppColors.darkBlue;
        break;
      case 10:
        sessionState = 'Running';
        color = const Color.fromARGB(255, 255, 183, 74);
        break;
      case 11:
        sessionState = 'Make-Up';
        color = Colors.lightBlueAccent[700];
    }
  }
}
