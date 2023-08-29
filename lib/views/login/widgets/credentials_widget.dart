import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../api/data/fetched_user_data.dart';
import '../../../constants/core/theme/app_colors.dart';
import '../../../constants/widgets/base_btn.dart';
import '../../../constants/widgets/base_text_widget.dart';
import '../../../constants/widgets/flutter_toast.dart';
import '../../../constants/widgets/input_field.dart';
import '../../../controllers/guest_cubit/guest_cubit.dart';
import '../../../controllers/login_bloc/user_bloc.dart';
import '../../../controllers/login_bloc/user_event.dart';
import '../../../controllers/login_bloc/user_state.dart';
import '../../../global.dart';
import '../../app/application_page.dart';

class LogInScreenWidget extends StatelessWidget {
  const LogInScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    TextEditingController usernameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(top: height * 0.05),
            child: SizedBox(
              height: height * 0.26,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  inputField(Icons.person, width * 0.85, 'Username',
                      usernameController,
                      bg: Global.darkMode!
                          ? Colors.white
                          : const Color.fromARGB(255, 239, 239, 239)),
                  inputField(Icons.lock_outline_rounded, width * 0.85,
                      'Password', passwordController,
                      hideText: true,
                      bg: Global.darkMode!
                          ? Colors.white
                          : const Color.fromARGB(255, 239, 239, 239)),
                ],
              ),
            ),
          ),
          BlocBuilder<CredsBloc, CredsState>(builder: (context, credsState) {
            return credsState.isCredsFalse
                ? Padding(
                    padding: EdgeInsets.only(
                        top: height * 0.01, bottom: height * 0.03),
                    child: textBox(
                        null, null, '* Username or password is wrong.',
                        fontSize: 12,
                        color: Colors.red,
                        alignment: Alignment.center),
                  )
                : SizedBox(
                    height: height * 0.05,
                  );
          }),
          BlocBuilder<LoginBloc, LogInState>(
              builder: (context, logInState) =>
                  BlocBuilder<TeacherStudentBlocs, TeacherStudentState>(
                      builder: (context, teacherStudentstate) {
                    return !logInState.isLogging
                        ? ActionBTN(
                            fontSize: 15,
                            function: () async {
                              SystemChannels.textInput
                                  .invokeMethod('TextInput.hide');
                              context.read<LoginBloc>().add(LogInEvent.toggle);
                              usernameController.text != '' &&
                                      passwordController.text != ''
                                  ? await context.read<GuestCubit>().signIn(
                                      context,
                                      usernameController.text,
                                      passwordController.text,
                                      teacherStudentstate.isTeacher)
                                  : toastInfo(
                                      msg: 'Please fill the required fields');
                              UserData.accessToken != null
                                  ? Future.delayed(
                                      Duration.zero,
                                      () => Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const ApplicationPage())))
                                  : null;
                              Future.delayed(
                                  Duration.zero,
                                  () => context
                                      .read<LoginBloc>()
                                      .add(LogInEvent.toggle));
                            },
                            shadowless: true,
                            height: height * 0.08,
                            text: teacherStudentstate.isTeacher
                                ? "Login As Teacher"
                                : "Login As Student",
                            textColor: !Global.darkMode!
                                ? AppColors.lightBlack
                                : AppColors.white,
                            bg: AppColors.primary,
                            width: width * 0.65,
                            fontWeight: FontWeight.bold)
                        : CircularProgressIndicator(
                            color: AppColors.primary,
                          );
                  }))
        ],
      ),
    );
  }
}
