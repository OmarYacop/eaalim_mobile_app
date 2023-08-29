import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constants/core/theme/app_colors.dart';
import '../../../constants/widgets/base_btn.dart';
import '../../../constants/widgets/input_field.dart';
import '../../../controllers/session_actions_bloc/bloc/session_actions_bloc.dart';
import '../../../global.dart';

Widget endClass(
  double height,
  double width,
  TextEditingController notes,
  TextEditingController homework,
  TextEditingController summary,
  void Function()? upload,
  void Function()? cancelUpload,
  void Function()? submit,
) {
  return SizedBox(
    width: width,
    height: height,
    child: ListView(
      padding: EdgeInsets.only(
          right: width * 0.04, left: width * 0.04, top: height * 0.03),
      scrollDirection: Axis.vertical,
      children: [
        inputField(Icons.summarize, width * 4.5 / 5, 'Summary*', summary,
            maxLines: 10,
            textInputAction: TextInputAction.newline,
            bg: Global.darkMode! ? Colors.white : Colors.grey[200],
            hintColor: AppColors.primary),
        SizedBox(
          height: height * 0.02,
        ),
        inputField(Icons.home_work, width * 4.5 / 5, 'Homework*', homework,
            maxLines: 6,
            textInputAction: TextInputAction.newline,
            bg: Global.darkMode! ? Colors.white : Colors.grey[200],
            hintColor: AppColors.primary),
        SizedBox(
          height: height * 0.02,
        ),
        inputField(
          Icons.note_add,
          width * 4.5 / 5,
          'notes',
          notes,
          maxLines: 5,
          textInputAction: TextInputAction.newline,
          bg: Global.darkMode! ? Colors.white : Colors.grey[200],
          hintColor: AppColors.primary,
        ),
        SizedBox(
          height: height * 0.02,
        ),
        SizedBox(
          width: width * 4.4445 / 5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BlocBuilder<EndBloc, EndState>(
                builder: (context, state) {
                  return ActionBTN(
                      function: upload,
                      prefixIcon: Icon(
                        Icons.upload,
                        color: AppColors.black,
                      ),
                      text: context.read<EndBloc>().state.filesPaths.isEmpty
                          ? 'Upload'
                          : '${context.read<EndBloc>().state.filesPaths.length} file(s) will be uploaded',
                      textColor: AppColors.primary,
                      width: width * 7.222 / 10,
                      height: null,
                      bg: Global.darkMode! ? Colors.white : Colors.grey[200],
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      shadowless: false,
                      iconPadding: width * 0.1);
                },
              ),
              ActionBTN(
                  function: cancelUpload,
                  prefixIcon: const Icon(Icons.cancel_outlined),
                  text: '',
                  textColor: AppColors.error,
                  bg: Global.darkMode! ? Colors.white : Colors.grey[200],
                  fontSize: 15,
                  shadowless: false,
                  fontWeight: FontWeight.normal,
                  height: null,
                  width: width / 7.2,
                  iconPadding: width * 0.04),
            ],
          ),
        ),
        SizedBox(
          height: height * 0.02,
        ),
        BlocBuilder<SendBloc, SendState>(
          builder: (context, state) {
            return state.isLoading
                ? SizedBox(
                    width: width,
                    child: Center(
                        child: CircularProgressIndicator(
                      color: AppColors.primary,
                    )))
                : ActionBTN(
                    function: submit,
                    prefixIcon: Icon(Icons.send, color: AppColors.black),
                    text: 'Send',
                    textColor: AppColors.primary,
                    bg: Global.darkMode! ? Colors.white : Colors.grey[200],
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    height: null,
                    shadowless: false,
                    width: width * 4.4445 / 5,
                    iconPadding: width * 0.25);
          },
        ),
        SizedBox(
          height: height * 0.02,
        ),
      ],
    ),
  );
}
