import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controllers/them_bloc/theme_bloc.dart';
import '../../constants/core/theme/app_colors.dart';
import 'widgets/schedule_page_widgets.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) =>
            LayoutBuilder(builder: (context, constraints) {
              double width = constraints.maxWidth;
              double height = constraints.maxHeight;

              return Container(
                color: AppColors.primary,
                child: Column(
                  children: [
                    buildAppBarWidget(context, width, height),
                    buildSchedule(context, width, height),
                  ],
                ),
              );
            }));
  }

  @override
  bool get wantKeepAlive => true;
}
