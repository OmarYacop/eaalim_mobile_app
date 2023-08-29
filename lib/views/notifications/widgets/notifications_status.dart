import 'package:flutter/material.dart';

class NotificationStatus {
  late Color? color;
  late String notificationState;

  void checkNotificationState(int status) {
    /// Check State Of Session
    switch (status) {
      case 0:
        notificationState = 'Pending';
        color = const Color.fromARGB(255, 193, 193, 185);
        break;
      case 1:
        notificationState = 'Accepted';
        color = const Color.fromARGB(255, 149, 255, 149);
        break;
      case 2:
        notificationState = 'Rejected';
        color = const Color.fromARGB(255, 250, 123, 55);
        break;
    }
  }
}
