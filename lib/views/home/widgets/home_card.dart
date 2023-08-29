import 'package:flutter/material.dart';

import '../../../constants/core/theme/app_colors.dart';
import '../../../constants/widgets/base_text_widget.dart';
import '../../../constants/widgets/beauty_container.dart';
import '../../../global.dart';

import 'menu_actions.dart';
import 'session_state.dart';

Widget buildCardOfSession(
  BuildContext context,
  double width,
  double height,
  String courseTitle,
  String clientName,
  int sessionDuration,
  String sessionTime,
  int? sessionState,
  bool isTeacher,
  int? index,
) {
  SessionState sState = SessionState();
  sessionState != null ? sState.checkState(sessionState) : null;
  return Padding(
    padding: EdgeInsets.only(bottom: width * 0.02),
    child: beautyContainer(height * 0.12,
        width: width,
        allCircular: false,
        topLeft: 15,
        topRight: 15,
        bottomLeft: 15,
        bottomRight: 15,
        boxShadowValue: 0.15,
        backgroundColor: Global.darkMode!
            ? Colors.grey[850]
            : const Color.fromARGB(255, 238, 238, 238),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              sessionState != null
                  ? Tooltip(
                      message: sState.sessionState,
                      triggerMode: TooltipTriggerMode.tap,
                      child: CircleAvatar(
                          radius: width * 0.05,
                          backgroundColor: sState.color!,
                          child: textBox(null, null, sState.sessionState[0],
                              alignment: Alignment.center,
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w600)),
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        textBox(
                          height * 0.03,
                          width * 0.28,
                          clientName,
                          color: Global.darkMode! ? Colors.white : Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        textBox(null, width * 0.42, courseTitle,
                            color: Global.darkMode!
                                ? const Color.fromARGB(255, 255, 255, 255)
                                : const Color.fromARGB(255, 0, 0, 0),
                            fontWeight: FontWeight.normal),
                      ],
                    ),
              sessionState != null
                  ? Tooltip(
                      message: sState.sessionState,
                      triggerMode: TooltipTriggerMode.tap,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          textBox(
                            height * 0.03,
                            width * 0.28,
                            clientName,
                            color:
                                Global.darkMode! ? Colors.white : Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          textBox(null, width * 0.42, courseTitle,
                              color: Global.darkMode!
                                  ? const Color.fromARGB(255, 255, 255, 255)
                                  : const Color.fromARGB(255, 0, 0, 0),
                              fontWeight: FontWeight.normal),
                        ],
                      ))
                  : const SizedBox(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  textBox(
                    null,
                    null,
                    sessionTime,
                    color: AppColors.green,
                  ),
                  textBox(null, null, '($sessionDuration) mins',
                      color: Global.darkMode!
                          ? const Color.fromRGBO(255, 255, 255, 1)
                          : const Color.fromRGBO(0, 0, 0, 1),
                      fontSize: 13),
                ],
              ),
              SizedBox(
                  width: width / 10,
                  height: height * 0.07,
                  child: sessionState != null
                      ? sessionState <= 2 || sessionState >= 10 && isTeacher
                          ? IconButton(
                              onPressed: () {
                                showModalBottomSheet<void>(
                                  backgroundColor: Global.darkMode!
                                      ? const Color.fromARGB(255, 33, 33, 33)
                                      : const Color.fromARGB(
                                          255, 255, 255, 255),
                                  shape: const RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8))),
                                  context: context,
                                  builder: (BuildContext context) {
                                    return SizedBox(
                                      width: width,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            left: width * 0.14,
                                            top: height * 0.05,
                                            bottom: height * 0.05),
                                        child: Wrap(
                                          children: MenuActions(
                                            context,
                                            sState.sessionState,
                                            isTeacher,
                                            width,
                                            index,
                                          ).buildActionBTNS(),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                              icon: Icon(
                                Icons.more_vert,
                                color: Global.darkMode!
                                    ? const Color.fromARGB(255, 255, 255, 255)
                                    : const Color.fromARGB(255, 0, 0, 0),
                              ),
                            )
                          : const SizedBox()
                      : const SizedBox())
            ])),
  );
}
