import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

import '../../constants/core/theme/app_colors.dart';

import '../../constants/widgets/base_text_widget.dart';
import '../../constants/widgets/beauty_container.dart';
import '../../controllers/notifications_bloc/notifications_bloc.dart';
import '../../controllers/notifications_cubit/notifications_cubit.dart';
import '../../global.dart';
import 'widgets/notification_msg.dart';
import 'widgets/notifications.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      double width = constraints.maxWidth;
      double height = constraints.maxHeight;
      notifications.clear();

      return Scaffold(
        backgroundColor: AppColors.primary,
        body: Column(
          children: [
            SizedBox(
              height: height * 0.18,
              child: Padding(
                padding:
                    EdgeInsets.only(top: height * 0.04, left: width * 0.01),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    BackButton(
                      color: Colors.white,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: height * 0.053, left: width * 0.18),
                      child: textBox(
                        null,
                        null,
                        'Notifications',
                        fontSize: 21,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: beautyContainer(null,
                  width: width,
                  allCircular: false,
                  topLeft: 15,
                  topRight: 15,
                  shadowless: true,
                  backgroundColor: Global.darkMode!
                      ? const Color.fromARGB(255, 33, 33, 33)
                      : const Color.fromARGB(255, 255, 255, 255),
                  child: BlocBuilder<NotificationsBloc, NotificationState>(
                builder: (context, state) {
                  return FutureBuilder(
                    future: Future.delayed(Duration.zero, () async {
                      await context
                          .read<NotificationsCubit>()
                          .getNotifications(context);
                    }),
                    builder: (context, snapshot) => snapshot.connectionState ==
                            ConnectionState.done
                        ? LiquidPullToRefresh(
                            animSpeedFactor: 5,
                            height: height * 0.1,
                            color: AppColors.primary,
                            backgroundColor: Global.darkMode!
                                ? const Color.fromARGB(255, 33, 33, 33)
                                : const Color.fromARGB(255, 255, 255, 255),
                            onRefresh: () async {
                              notifications.clear();
                              context.read<NotificationsBloc>().add(
                                  const NotificationsEvent(isLoading: true));
                              notifications.clear();
                            },
                            child: notifications.isNotEmpty
                                ? ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    itemCount: notifications.length,
                                    padding: EdgeInsets.only(
                                        bottom: height * 0.1,
                                        left: width * 0.032,
                                        top: height * 0.02,
                                        right: width * 0.032),
                                    itemBuilder: (context, index) {
                                      return NotificationMessage(
                                        width: width,
                                        height: height,
                                        status: int.parse(
                                            notifications[index].status!),
                                        message: notifications[index].message ??
                                            'No Message Was Sent With This Notification',
                                        studentName:
                                            notifications[index].studentName ??
                                                '',
                                        teacherName:
                                            notifications[index].teacherName ??
                                                '',
                                        date: notifications[index].date!,
                                        seen: notifications[index].seen == '1',
                                        id: notifications[index].id!,
                                      );
                                    })
                                : ListView.builder(
                                    itemCount: 1,
                                    padding: EdgeInsets.only(
                                      top: height * 0.3,
                                    ),
                                    itemBuilder: (_, __) => Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'There are no notifications for now',
                                          style: TextStyle(
                                              color: Global.darkMode!
                                                  ? Colors.white
                                                  : Colors.grey[850]),
                                        ),
                                        Text(
                                          'Pull to refresh',
                                          style: TextStyle(
                                              color: Global.darkMode!
                                                  ? Colors.white
                                                  : Colors.grey[850]),
                                        )
                                      ],
                                    ),
                                  ))
                        : Center(
                            child: CircularProgressIndicator(
                              backgroundColor: Colors.transparent,
                              color: AppColors.primary,
                            ),
                          ),
                  );
                },
              )),
            )
          ],
        ),
      );
    });
  }
}
