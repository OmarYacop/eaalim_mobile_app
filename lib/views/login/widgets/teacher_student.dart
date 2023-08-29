import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constants/core/theme/app_colors.dart';
import '../../../constants/widgets/base_text_widget.dart';
import '../../../controllers/login_bloc/user_bloc.dart';
import '../../../controllers/login_bloc/user_event.dart';
import '../../../controllers/login_bloc/user_state.dart';
import '../../../global.dart';

class TeacherAndStudentWidget extends StatelessWidget {
  final double width;
  final double height;
  const TeacherAndStudentWidget(
      {super.key, required this.width, required this.height});

  @override
  build(BuildContext context) {
    return BlocBuilder<TeacherStudentBlocs, TeacherStudentState>(
      builder: (context, state) => Container(
        width: width * 0.8,
        height: height * 1.5 / 18,
        decoration: BoxDecoration(
            color: Global.darkMode! ? Colors.grey[600] : Colors.grey[300],
            borderRadius: const BorderRadius.all(Radius.circular(15))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
                width: width * 3 / 8,
                height: height / 16,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    color: state.isTeacher
                        ? AppColors.primary
                        : Colors.transparent),
                child: ElevatedButton(
                  style: ButtonStyle(
                      elevation: MaterialStateProperty.all(0),
                      shape: MaterialStateProperty.all(
                          const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ))),
                      backgroundColor:
                          MaterialStateProperty.all(Colors.transparent)),
                  onPressed: () {
                    state.isTeacher == false
                        ? BlocProvider.of<TeacherStudentBlocs>(context)
                            .add(TeacherStudentEvent.toggle)
                        : null;
                  },
                  child: textBox(null, null, 'Teacher',
                      fontWeight: FontWeight.bold,
                      color: Global.darkMode! ? Colors.white : Colors.black,
                      alignment: Alignment.center),
                )),
            Container(
                width: width * 3 / 8,
                height: height / 16,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  color: !state.isTeacher //Choose Student Color
                      ? AppColors.primary
                      : Colors.transparent,
                ),
                child: ElevatedButton(
                    style: ButtonStyle(
                        elevation: MaterialStateProperty.all(0),
                        shape: MaterialStateProperty.all(
                            const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ))),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.transparent)),
                    onPressed: () {
                      state.isTeacher == true
                          ? BlocProvider.of<TeacherStudentBlocs>(context)
                              .add(TeacherStudentEvent.toggle)
                          : null;
                    },
                    child: textBox(null, null, 'Student',
                        fontWeight: FontWeight.bold,
                        color: Global.darkMode! ? Colors.white : Colors.black,
                        alignment: Alignment.center))),
          ],
        ),
      ),
    );
  }
}
