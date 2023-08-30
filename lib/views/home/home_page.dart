import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

import '../../api/data/fetched_user_data.dart';
import '../../constants/widgets/beauty_container.dart';
import '../../controllers/home_bloc/home_bloc.dart';
import '../../controllers/session_cubit/session_cubit.dart';
import '../../controllers/them_bloc/theme_bloc.dart';
import '../../constants/core/theme/app_colors.dart';
import '../../global.dart';
import 'widgets/home_bar.dart';
import 'widgets/home_card.dart';
import 'widgets/home_sessions.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocBuilder<ThemeBloc, ThemeState>(
        builder: (__, _) => LayoutBuilder(builder: (context, constraints) {
              double width = constraints.maxWidth;
              double height = constraints.maxHeight;
              homeSessions.clear;
              return Column(
                children: [
                  buildAppBarHomePage(context, width, height),
                  Expanded(
                    child: beautyContainer(
                      null,
                      width: width,
                      allCircular: false,
                      topLeft: 15,
                      topRight: 15,
                      shadowless: true,
                      backgroundColor: Global.darkMode!
                          ? const Color.fromARGB(255, 33, 33, 33)
                          : const Color.fromARGB(255, 255, 255, 255),
                      child: BlocBuilder<HomeBloc, HomeState>(
                          builder: (homeContext, homeState) {
                        return FutureBuilder(
                          future: Future.delayed(Duration.zero, () async {
                            await context.read<SessionCubit>().getSessions(
                                context, UserData.isTeacher!, 'home');
                          }),
                          builder: (context, snapshot) => snapshot
                                      .connectionState ==
                                  ConnectionState.done
                              ? LiquidPullToRefresh(
                                  animSpeedFactor: 5,
                                  height: height * 0.1,
                                  color: AppColors.primary,
                                  backgroundColor: Global.darkMode!
                                      ? const Color.fromARGB(255, 33, 33, 33)
                                      : const Color.fromARGB(
                                          255, 255, 255, 255),
                                  onRefresh: () async {
                                    context
                                        .read<HomeBloc>()
                                        .add(const HomeEvent(isLoading: true));
                                  },
                                  child: homeSessions.isNotEmpty
                                      ? ListView.builder(
                                          scrollDirection: Axis.vertical,
                                          itemCount: homeSessions.length,
                                          padding: EdgeInsets.only(
                                              bottom: height * 0.1,
                                              left: width * 0.032,
                                              top: height * 0.02,
                                              right: width * 0.032),
                                          itemBuilder: (context, index) {
                                            return buildCardOfSession(
                                              context,
                                              width,
                                              height,
                                              homeSessions[index].courseName!,
                                              UserData.isTeacher!
                                                  ? homeSessions[index]
                                                      .studentName!
                                                  : homeSessions[index]
                                                      .teacherName!,
                                              homeSessions[index]
                                                  .classDuration!,
                                              DateFormat('h:mm a').format(
                                                  DateFormat('HH:mm:ss').parse(
                                                      homeSessions[index]
                                                          .classTime
                                                          .toString())),
                                              int.parse(homeSessions[index]
                                                  .sessionState!),
                                              UserData.isTeacher!,
                                              index,
                                            );
                                          })
                                      : ListView.builder(
                                          itemCount: 1,
                                          itemBuilder: (_, __) => Padding(
                                            padding: EdgeInsets.only(
                                              top: height * 0.3,
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'There are no sessions for now',
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
                                        ))
                              : Center(
                                  child: CircularProgressIndicator(
                                    backgroundColor: Colors.transparent,
                                    color: AppColors.primary,
                                  ),
                                ),
                        );
                      }),
                    ),
                  ),
                ],
              );
            }));
  }

  @override
  bool get wantKeepAlive => true;
}
