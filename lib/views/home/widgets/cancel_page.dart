import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../constants/core/theme/app_colors.dart';
import '../../../constants/widgets/base_btn.dart';
import '../../../constants/widgets/base_text_widget.dart';
import '../../../controllers/session_actions_bloc/bloc/session_actions_bloc.dart';
import '../../../global.dart';

Widget cancelClass(
    double height,
    double width,
    void Function()? chooseDateFun,
    void Function()? addToEndFun,
    int selectedOption,
    DateTime? dateTime,
    void Function()? submit) {
  return SizedBox(
    width: width,
    height: height,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: height / 7.2),
        ActionBTN(
            function: chooseDateFun,
            width: width * 0.8,
            shadowless: false,
            iconPadding: width * 0.07,
            height: null,
            fontSize: 15,
            fontWeight: FontWeight.normal,
            prefixIcon: selectedOption == 1
                ? const Icon(Icons.radio_button_on)
                : const Icon(Icons.radio_button_off),
            text: 'Choose date and time',
            textColor:
                selectedOption == 1 ? AppColors.lightBlack : AppColors.primary,
            bg: selectedOption == 1
                ? AppColors.primary
                : const Color(0xfff0f0f2)),
        SizedBox(height: height / 20),
        ActionBTN(
            function: addToEndFun,
            prefixIcon: selectedOption == 2
                ? const Icon(Icons.radio_button_on)
                : const Icon(Icons.radio_button_off),
            text: 'Add to end of course',
            fontSize: 15,
            fontWeight: FontWeight.normal,
            height: null,
            shadowless: false,
            width: width * 0.8,
            iconPadding: width * 0.07,
            textColor:
                selectedOption == 2 ? AppColors.lightBlack : AppColors.primary,
            bg: selectedOption == 2
                ? AppColors.primary
                : const Color(0xfff0f0f2)),
        selectedOption == 1
            ? Padding(
                padding:
                    EdgeInsets.only(top: height / 25, left: width * 4 / 40),
                child: SizedBox(
                  child: textBox(
                      null,
                      null,
                      dateTime != null
                          ? 'Chosen date and time : ${DateFormat('dd/MM/yyyy  HH:mm').format(dateTime)} \n\n -Note that a cancel request will be sent and must be approved by the admin'
                          : '',
                      fontSize: 13,
                      color: Global.darkMode! ? Colors.white : Colors.black),
                ),
              )
            : const SizedBox(height: 0),
        selectedOption == 1
            ? Padding(
                padding: EdgeInsets.only(
                    top: height / 50, left: width / 10, right: width / 10),
                child: SizedBox(
                  child: textBox(
                      null,
                      null,
                      dateTime != null
                          ? '- Note that a cancel request will be sent and must be approved by the admin'
                          : '',
                      fontSize: 13,
                      color: Global.darkMode! ? Colors.white : Colors.black),
                ),
              )
            : const SizedBox(height: 0),
        SizedBox(
          height: height / 3.6,
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
                    prefixIcon: Icon(
                      Icons.send,
                      color: AppColors.white,
                    ),
                    text: 'Send Request',
                    textColor: AppColors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    height: null,
                    iconPadding: null,
                    shadowless: false,
                    width: null,
                    bg: AppColors.primary);
          },
        )
      ],
    ),
  );
}
