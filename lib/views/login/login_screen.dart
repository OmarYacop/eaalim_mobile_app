import 'package:flutter/material.dart';

import '../../constants/core/theme/images.dart';
import '../../global.dart';
import 'widgets/credentials_widget.dart';
import 'widgets/teacher_student.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      double width = constraints.maxWidth;
      double height = constraints.maxHeight;

      return Scaffold(
        backgroundColor: Global.darkMode!
            ? const Color.fromARGB(255, 33, 33, 33)
            : const Color.fromARGB(255, 255, 255, 255),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.only(top: height * 5 / 72),
                child: Column(
                  children: [
                    Center(
                      child: Image(
                        image: const AssetImage(AppImages.logo),
                        fit: BoxFit.scaleDown,
                        width: width * 0.3,
                      ),
                    ),
                    SizedBox(height: height * 26 / 720),
                    TeacherAndStudentWidget(width: width, height: height),
                    const LogInScreenWidget()
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
