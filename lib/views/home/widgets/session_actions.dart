import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:omni_datetime_picker/omni_datetime_picker.dart';

import '../../../api/data/fetched_user_data.dart';
import '../../../constants/core/theme/app_colors.dart';
import '../../../constants/widgets/flutter_toast.dart';
import '../../../controllers/home_bloc/home_bloc.dart';
import '../../../controllers/notifications_bloc/notifications_bloc.dart';
import '../../../controllers/session_actions_bloc/bloc/session_actions_bloc.dart';
import '../../../controllers/session_cubit/session_cubit.dart';
import '../../../global.dart';
import 'absent_page.dart';
import 'cancel_page.dart';
import 'end_class_page.dart';
import 'home_sessions.dart';

class SessionActions extends StatefulWidget {
  final String type;
  final int? index;
  const SessionActions({Key? key, required this.type, required this.index})
      : super(key: key);

  @override
  State<SessionActions> createState() => _SessionActionsState();
}

class _SessionActionsState extends State<SessionActions> {
  TextEditingController notes = TextEditingController();
  TextEditingController homework = TextEditingController();
  TextEditingController summary = TextEditingController();
  DateTime? dateTime;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return WillPopScope(
      onWillPop: () {
        return Future.delayed(Duration.zero, () async {
          return await submit(() {
            Future.delayed(Duration.zero,
                () => context.read<EndBloc>().add(UploadEvent([])));
            Future.delayed(Duration.zero,
                () => context.read<CancelBloc>().add(CancelEvent(2)));
            Navigator.pop(context);
          });
        });
      },
      child: Scaffold(
          backgroundColor: Global.darkMode! ? Colors.grey[850] : Colors.white,
          appBar: AppBar(
            centerTitle: true,
            elevation: 0,
            automaticallyImplyLeading: false,
            backgroundColor: AppColors.primary,
            title: Text(
              widget.type == 'End Class'
                  ? 'Class Overview'
                  : widget.type == 'Request Cancel'
                      ? 'Cancel Request'
                      : 'Absent Student',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: !Global.darkMode! ? Colors.white : Colors.grey[850]),
            ),
          ),
          body: widget.type == 'End Class'
              ? GestureDetector(
                  onTap: () {
                    FocusScope.of(context).requestFocus(FocusNode());
                  },
                  child: endClass(
                      height,
                      width,
                      notes,
                      homework,
                      summary,
                      () => _pickFile(),
                      () => context.read<EndBloc>().add(UploadEvent([])),
                      () => submit(() async {
                            if (summary.text.isEmpty || homework.text.isEmpty) {
                              toastInfo(msg: "Fill the rquired fields");
                            } else {
                              context.read<SendBloc>().add(SendEvent(true));
                              final response = await context
                                  .read<SessionCubit>()
                                  .endClass(context, {
                                'class_id': homeSessions[widget.index!].id,
                                'homework': homework.text,
                                'images':
                                    context.read<EndBloc>().state.filesPaths,
                                'summary': summary.text,
                                'notes': notes.text
                              });
                              Future.delayed(
                                  Duration.zero,
                                  () => context
                                      .read<SendBloc>()
                                      .add(SendEvent(false)));
                              if (response
                                  .toString()
                                  .toLowerCase()
                                  .contains('success')) {
                                Future.delayed(Duration.zero, () {
                                  Navigator.pop(context);
                                });
                                Future.delayed(Duration.zero, () {
                                  Navigator.pop(context);
                                });
                                homeSessions.clear();
                                Future.delayed(Duration.zero, () {
                                  context
                                      .read<HomeBloc>()
                                      .add(const HomeEvent(isLoading: true));
                                });
                              }
                              toastInfo(msg: response);
                            }
                          })))
              : widget.type == 'Request Cancel'
                  ? BlocBuilder<CancelBloc, CancelState>(
                      builder: (context, state) {
                        return cancelClass(height, width, () async {
                          dateTime = await chooseDateTime();
                          if (dateTime != null) {
                            Future.delayed(
                                Duration.zero,
                                () => context
                                    .read<CancelBloc>()
                                    .add(CancelEvent(1)));
                          }
                        },
                            () async => Future.delayed(
                                Duration.zero,
                                () => context
                                    .read<CancelBloc>()
                                    .add(CancelEvent(2))),
                            context.read<CancelBloc>().state.selectedOption,
                            dateTime,
                            () => submit(
                                  () async {
                                    context
                                        .read<SendBloc>()
                                        .add(SendEvent(true));
                                    await context
                                        .read<SessionCubit>()
                                        .cancelSession(
                                            context, UserData.isTeacher!, {
                                      'date': DateFormat('yyyy-MM-dd')
                                          .format(dateTime!),
                                      'time':
                                          DateFormat('HH:mm').format(dateTime!),
                                      'class_id':
                                          homeSessions[widget.index!].id,
                                      'type': context
                                          .read<CancelBloc>()
                                          .state
                                          .selectedOption,
                                    });
                                    Future.delayed(Duration.zero, () {
                                      Navigator.pop(context);
                                    });
                                    Future.delayed(Duration.zero, () {
                                      Navigator.pop(context);
                                    });
                                    homeSessions.clear();
                                    Future.delayed(Duration.zero, () {
                                      context.read<HomeBloc>().add(
                                          const HomeEvent(isLoading: true));
                                    });
                                    Global.unreadNotifications =
                                        Global.unreadNotifications + 1;
                                    Future.delayed(
                                        Duration.zero,
                                        () => context
                                            .read<NotificationsCounterBloc>()
                                            .add(CounterEvent(
                                                unreadNotifications: Global
                                                    .unreadNotifications)));
                                    Future.delayed(
                                        Duration.zero,
                                        () => context
                                            .read<CancelBloc>()
                                            .add(CancelEvent(2)));
                                    Future.delayed(
                                        Duration.zero,
                                        () => context
                                            .read<SendBloc>()
                                            .add(SendEvent(false)));
                                  },
                                ));
                      },
                    )
                  : GestureDetector(
                      onTap: () {
                        FocusScope.of(context).requestFocus(FocusNode());
                      },
                      child: absentPage(
                          () => submit(() async {
                                context.read<SendBloc>().add(SendEvent(true));
                                if (context
                                    .read<AbsentBloc>()
                                    .state
                                    .filesPaths
                                    .isNotEmpty) {
                                  final response = await context
                                      .read<SessionCubit>()
                                      .absentStudent(context, {
                                    'class_id': homeSessions[widget.index!].id,
                                    'note': notes.text,
                                    'video': context
                                        .read<AbsentBloc>()
                                        .state
                                        .filesPaths
                                  });
                                  if (response
                                      .toString()
                                      .toLowerCase()
                                      .contains('success')) {
                                    Future.delayed(
                                        Duration.zero,
                                        () => context
                                            .read<AbsentBloc>()
                                            .add(UploadEvent([])));
                                    Future.delayed(Duration.zero, () {
                                      Navigator.pop(context);
                                    });
                                    Future.delayed(Duration.zero, () {
                                      Navigator.pop(context);
                                    });
                                    homeSessions.clear();
                                    Future.delayed(Duration.zero, () {
                                      context.read<HomeBloc>().add(
                                          const HomeEvent(isLoading: true));
                                    });
                                  }
                                } else {
                                  toastInfo(msg: 'Please upload a video');
                                }
                                Future.delayed(
                                    Duration.zero,
                                    () => context
                                        .read<SendBloc>()
                                        .add(SendEvent(false)));
                              }),
                          notes,
                          widget.index!),
                    )),
    );
  }

  void _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: true,
        allowedExtensions: ['pdf', 'jpg', 'png'],
        type: FileType.custom);
    if (result != null) {
      List<String> filePaths = [];
      for (String? path in result.paths) {
        if (path != null) {
          filePaths.add(path);
        }
      }
      Future.delayed(Duration.zero,
          () => context.read<EndBloc>().add(UploadEvent(filePaths)));
    }
  }

  Future submit(
    void Function()? okPressed,
  ) async {
    AwesomeDialog(
      dialogBackgroundColor: Global.darkMode! ? Colors.grey[850] : Colors.white,
      context: context,
      dialogType: DialogType.warning,
      title: 'Are You Sure ?',
      titleTextStyle:
          TextStyle(color: Global.darkMode! ? Colors.white : Colors.grey[850]),
      btnCancelOnPress: () {},
      btnOkText: 'Yes',
      btnOkOnPress: okPressed,
    ).show();
  }

  Future<DateTime?> chooseDateTime() async {
    return await showOmniDateTimePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(
        const Duration(days: 3652),
      ),
      is24HourMode: false,
      minutesInterval: 1,
      borderRadius: const BorderRadius.all(Radius.circular(16)),
      transitionBuilder: (context, anim1, anim2, child) {
        return FadeTransition(
          opacity: anim1.drive(
            Tween(
              begin: 0,
              end: 1,
            ),
          ),
          child: child,
        );
      },
      transitionDuration: const Duration(milliseconds: 200),
      barrierDismissible: true,
    );
  }
}
