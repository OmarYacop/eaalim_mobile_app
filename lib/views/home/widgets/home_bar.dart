import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constants/core/app_strings.dart';
import '../../../constants/widgets/avatar.dart';
import '../../../controllers/notifications_bloc/notifications_bloc.dart';
import '../../../global.dart';
import '../../notifications/notification_page.dart';

Widget buildAppBarHomePage(BuildContext context, double width, double height) {
  return Padding(
    padding: EdgeInsets.only(
      left: width * 0.04,
      right: width * 0.04,
      top: height * 0.077,
    ),
    child: SizedBox(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              avatar(width * 0.062, 25),
              const Text(
                AppString.titleHomePage,
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 255, 255, 255)),
              ),
              IconButton(
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const NotificationPage())),
                icon: BlocBuilder<NotificationsCounterBloc, CounterState>(
                  builder: (context, state) {
                    return Column(
                      children: [
                        const Icon(
                          Icons.notifications,
                          color: Colors.white,
                          size: 30,
                        ),
                        if (Global.unreadNotifications >
                            0) // Display the bubble if there are unread notifications
                          Container(
                            decoration: BoxDecoration(
                                color: Global.darkMode!
                                    ? Colors.grey[850]
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(5)),
                            width: width * 0.08,
                            alignment: Alignment.center,
                            child: Text(
                              Global.unreadNotifications <= 99
                                  ? Global.unreadNotifications.toString()
                                  : '99+',
                              style: TextStyle(
                                color: Global.darkMode!
                                    ? Colors.white
                                    : Colors.grey[850],
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
          SizedBox(
            height: height * 0.03,
          ),
        ],
      ),
    ),
  );
}
