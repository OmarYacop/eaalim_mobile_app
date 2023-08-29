import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

import '../../../api/data/fetched_user_data.dart';
import '../../../constants/core/theme/app_colors.dart';
import '../../../constants/widgets/avatar.dart';
import '../../../constants/widgets/beauty_container.dart';
import '../../../controllers/schedule_bloc/days_of_week_bloc.dart';
import '../../../controllers/schedule_bloc/days_of_week_event.dart';
import '../../../controllers/schedule_bloc/days_of_week_state.dart';
import '../../../controllers/session_cubit/session_cubit.dart';
import '../../../global.dart';
import '../../home/widgets/home_card.dart';
import 'days_of_week_manager.dart';

Widget buildAppBarWidget(BuildContext context, double width, double height) {
  return Padding(
    padding: EdgeInsets.only(
      left: width * 0.04,
      right: width * 0.04,
      top: height * 0.077,
    ),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            avatar(width * 0.062, 25),
            const DaysManager(),
          ],
        ),
        SizedBox(
          height: height * 0.03,
        ),
      ],
    ),
  );
}

Widget buildSchedule(BuildContext context, double width, double height) {
  Map? data;
  List<Map> todaySessions = [];

  return Expanded(
      child: beautyContainer(null,
          allCircular: false,
          topLeft: 15,
          topRight: 15,
          backgroundColor: Global.darkMode!
              ? const Color.fromARGB(255, 33, 33, 33)
              : const Color.fromARGB(255, 255, 255, 255),
          width: width, child:
              BlocBuilder<LoadBloc, LoadState>(builder: (context, loadState) {
    return FutureBuilder(
        future: Future.delayed(Duration.zero, () async {
          data = await context
              .read<SessionCubit>()
              .getSessions(context, UserData.isTeacher!, 'schedule');
        }),
        builder: (context, snapshot) =>
            snapshot.connectionState == ConnectionState.done
                ? LiquidPullToRefresh(
                    animSpeedFactor: 5,
                    height: height * 0.1,
                    color: AppColors.primary,
                    backgroundColor: Global.darkMode!
                        ? const Color.fromARGB(255, 33, 33, 33)
                        : const Color.fromARGB(255, 255, 255, 255),
                    onRefresh: () async {
                      context
                          .read<LoadBloc>()
                          .add(const LoadEvent(isLoading: true));
                    },
                    child: BlocBuilder<DaysBloc, DaysState>(
                        builder: (context, daysState) {
                      todaySessions.clear();
                      String today = daysState.days;
                      if (data![today.substring(0, 3)] != null) {
                        if (data![today.substring(0, 3)].isNotEmpty) {
                          for (Map session in data![today.substring(0, 3)]) {
                            todaySessions.add({
                              'course_name': session['course_name'],
                              'client_name': session[!UserData.isTeacher!
                                  ? 'teacher_name'
                                  : 'student_name'],
                              'class_duration': session['class_duration'],
                              'class_time': session['class_time'],
                            });
                          }
                        }
                      }
                      return todaySessions.isNotEmpty
                          ? ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: todaySessions.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.only(
                                      bottom: index == todaySessions.length - 1
                                          ? height * 0.1
                                          : height * 0.02,
                                      left: width * 0.04,
                                      right: width * 0.032),
                                  child: buildCardOfSession(
                                    context,
                                    width,
                                    height,
                                    todaySessions[index]['course_name'],
                                    todaySessions[index]['client_name'],
                                    int.parse(
                                        todaySessions[index]['class_duration']),
                                    todaySessions[index]['class_time'],
                                    null,
                                    UserData.isTeacher!,
                                    null,
                                  ),
                                );
                              })
                          : ListView.builder(
                              itemCount: 1,
                              itemBuilder: (_, __) => Padding(
                                padding: EdgeInsets.only(
                                  top: height * 0.3,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'You Have No Sessions On ${daysState.days}',
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
                              ),
                            );
                    }))
                : Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.transparent,
                      color: AppColors.primary,
                    ),
                  ));
  })));
}
