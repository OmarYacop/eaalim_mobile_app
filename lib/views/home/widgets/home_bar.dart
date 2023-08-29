import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                'Eaalim',
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
                    return Stack(
                      children: [
                        const Icon(
                          Icons.notifications,
                          color: Colors.white,
                          size: 30,
                        ),
                        if (Global.unreadNotifications>
                            0) // Display the bubble if there are unread notifications
                          Positioned(
                              top: 0,
                              right: 0,
                              child: SizedBox(
                                height: height / 36,
                                child: FittedBox(
                                  child: CircleAvatar(
                                    backgroundColor: Colors.red,
                                    radius: 7,
                                    child: Text(
                                      Global.unreadNotifications <= 99
                                          ? Global.unreadNotifications
                                              .toString()
                                          : '99+',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ))
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
