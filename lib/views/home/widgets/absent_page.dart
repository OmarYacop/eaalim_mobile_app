import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constants/core/theme/app_colors.dart';
import '../../../constants/widgets/base_btn.dart';
import '../../../constants/widgets/input_field.dart';
import '../../../controllers/session_actions_bloc/bloc/session_actions_bloc.dart';
import '../../../global.dart';

Widget absentPage(
  void Function()? submit,
  TextEditingController notes,
  int index,
) {
  return LayoutBuilder(builder: (context, constraints) {
    double height = constraints.maxHeight;
    double width = constraints.maxWidth;
    return ListView(
        padding: EdgeInsets.only(
            right: width * 0.04, left: width * 0.04, top: height * 0.25),
        scrollDirection: Axis.vertical,
        children: [
          inputField(Icons.note_add, width, 'Notes', notes,
              maxLines: 4,
              textInputAction: TextInputAction.newline,
              bg: Global.darkMode! ? Colors.white : Colors.grey[200]),
          SizedBox(height: height * 0.04),
          BlocBuilder<AbsentBloc, EndState>(
            builder: (context, state) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BlocBuilder<EndBloc, EndState>(
                    builder: (context, state) {
                      return ActionBTN(
                          function: () async {
                            var result = await _pickFile();
                            if (result != null) {
                              Future.delayed(Duration.zero, () {
                                context
                                    .read<AbsentBloc>()
                                    .add(UploadEvent(result));
                              });
                            }
                          },
                          prefixIcon: Icon(
                            Icons.upload,
                            color: AppColors.black,
                          ),
                          text: context
                                  .read<AbsentBloc>()
                                  .state
                                  .filesPaths
                                  .isEmpty
                              ? 'Upload video (.mp4 only)'
                              : context
                                  .read<AbsentBloc>()
                                  .state
                                  .filesPaths
                                  .first
                                  .split('/')
                                  .last,
                          textColor: AppColors.primary,
                          width: width * 7.222 / 10,
                          height: null,
                          bg: Global.darkMode!
                              ? Colors.white
                              : Colors.grey[200],
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                          shadowless: false,
                          iconPadding: width * 0.028);
                    },
                  ),
                  ActionBTN(
                      function: () =>
                          context.read<AbsentBloc>().add(UploadEvent([])),
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
              );
            },
          ),
          SizedBox(height: height * 0.04),
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
                      text: 'Make Student Absent',
                      textColor: AppColors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      height: null,
                      iconPadding: width * 0.16,
                      shadowless: false,
                      width: null,
                      bg: AppColors.primary);
            },
          ),
        ]);
  });
}

Future<dynamic> _pickFile() async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowedExtensions: ['mp4'],
  );

  if (result != null) {
    List<String> filePaths = [];
    for (String? path in result.paths) {
      if (path != null) {
        filePaths.add(path);
      }
    }
    return filePaths;
  } else {
    // User canceled the picker
  }
}
