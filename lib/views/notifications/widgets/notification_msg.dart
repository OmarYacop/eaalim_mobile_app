import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../api/data/fetched_user_data.dart';
import '../../../constants/widgets/base_text_widget.dart';
import '../../../controllers/notifications_bloc/notifications_bloc.dart';
import '../../../controllers/notifications_cubit/notifications_cubit.dart';
import '../../../global.dart';
import 'notifications_status.dart';

class NotificationMessage extends StatefulWidget {
  final double width;
  final double height;
  final int status;
  final String message;
  final String studentName;
  final String teacherName;
  final String date;
  final int id;
  bool seen;

  NotificationMessage({
    super.key,
    required this.width,
    required this.height,
    required this.status,
    required this.message,
    required this.studentName,
    required this.teacherName,
    required this.date,
    required this.id,
    required this.seen,
  });

  @override
  _NotificationMessageState createState() => _NotificationMessageState();
}

class _NotificationMessageState extends State<NotificationMessage> {
  NotificationStatus sState = NotificationStatus();

  @override
  void initState() {
    super.initState();
    sState.checkNotificationState(widget.status);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Global.darkMode!
            ? Colors.grey[850]
            : const Color.fromARGB(255, 238, 238, 238),
      ),
      margin: EdgeInsets.only(top: widget.height * 0.02),
      child: ListTile(
        onTap: () {
          if (!widget.seen) {
            setState(() {
              widget.seen = true;
              Global.unreadNotifications = Global.unreadNotifications == 0
                  ? 0
                  : Global.unreadNotifications - 1;
              context
                  .read<NotificationsCubit>()
                  .setNotificationSeen(context, widget.id);
            });
            context.read<NotificationsCounterBloc>().add(CounterEvent(
                unreadNotifications: Global.unreadNotifications - 1));
          }
          showModalBottomSheet<void>(
            backgroundColor: Global.darkMode!
                ? const Color.fromARGB(255, 33, 33, 33)
                : Colors.white,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8))),
            context: context,
            builder: (BuildContext context) {
              return Padding(
                padding: EdgeInsets.only(
                    top: widget.height * 0.02, bottom: widget.height * 0.02),
                child: Wrap(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        textBox(
                          null,
                          null,
                          sState.notificationState,
                          color: Global.darkMode! ? Colors.white : Colors.black,
                        ),
                        textBox(
                          null,
                          null,
                          widget.date,
                          fontSize: 13,
                          color: Global.darkMode! ? Colors.white : Colors.black,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: widget.height * 0.07,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        widget.message,
                        textAlign: TextAlign.justify,
                        overflow: TextOverflow.visible,
                        style: TextStyle(
                          color: Global.darkMode!
                              ? Colors.white
                              : const Color.fromARGB(255, 33, 33, 33),
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
        title: textBox(
            null,
            null,
            color: Global.darkMode! ? Colors.white : Colors.black,
            sState.notificationState,
            fontSize: 18),
        subtitle: textBox(
          null,
          null,
          color: Colors.grey,
          UserData.isTeacher! ? widget.studentName : widget.teacherName,
        ),
        trailing: SizedBox(
          width: widget.width * 0.25,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                textBox(null, null, widget.date,
                    color: Colors.grey,
                    fontSize: 13,
                    alignment: Alignment.center),
                CircleAvatar(
                  backgroundColor:
                      widget.seen ? Colors.transparent : Colors.red,
                  radius: widget.width * 0.015,
                ),
              ]),
        ),
      ),
    );
  }
}
