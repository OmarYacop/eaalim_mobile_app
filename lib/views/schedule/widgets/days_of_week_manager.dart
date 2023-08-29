import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constants/core/theme/app_colors.dart';
import '../../../constants/widgets/days_manger.dart';
import '../../../controllers/schedule_bloc/days_of_week_bloc.dart';
import '../../../controllers/schedule_bloc/days_of_week_event.dart';
import '../../../controllers/schedule_bloc/days_of_week_state.dart';
import '../../../global.dart';

class DaysManager extends StatelessWidget {
  const DaysManager({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DaysBloc, DaysState>(
      builder: (context, state) => ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          alignment: Alignment.center,
          backgroundColor: AppColors.secondary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          animationDuration: const Duration(milliseconds: 5),
          enabledMouseCursor: MouseCursor.uncontrolled,
        ),
        autofocus: true,
        child: Row(
          children: [
            Text(
              state.days,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.white,
              ),
            ),
            Icon(
              Icons.more_vert,
              color: AppColors.white,
            ),
          ],
        ),
        onPressed: () {
          showMenu(
            context: context,
            color: Global.darkMode!
                ? const Color.fromARGB(255, 33, 33, 33)
                : Colors.white,
            position: const RelativeRect.fromLTRB(100, 100, 0, 0),
            items: DaysOfWeeks.daysInWeek.map(
              (String days) {
                return PopupMenuItem(
                  onTap: () async {
                    context.read<DaysBloc>().add(SelectDayEvent(days));
                  },
                  height: 40,
                  mouseCursor: SystemMouseCursors.alias,
                  child: Text(
                    days,
                    style: TextStyle(
                      color: Global.darkMode! ? Colors.white : Colors.black,
                    ),
                  ),
                );
              },
            ).toList(),
          );
        },
      ),
    );
  }
}
