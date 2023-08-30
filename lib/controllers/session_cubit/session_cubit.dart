import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../api/data/fetched_user_data.dart';
import '../../api/models/requests/requests.dart';
import '../../api/models/session_model/session.dart';
import '../../api/repository/sessions/sessions_repo.dart';
import '../../constants/widgets/flutter_toast.dart';
import '../../views/home/widgets/home_sessions.dart';
import '../guest_cubit/guest_cubit.dart';

part 'session_state.dart';
part 'session_cubit.freezed.dart';

class SessionCubit extends Cubit<SessionState> {
  final SessionsRepository _sessionsRepository;

  SessionCubit({required SessionsRepository sessionsRepository})
      : _sessionsRepository = sessionsRepository,
        super(
          const SessionState.initial(),
        );

  Future<dynamic> getSessions(
      BuildContext context, bool isTeacher, String referredPage) async {
    final response = await _sessionsRepository.getSessions(
        SessionsRequest(token: UserData.accessToken), isTeacher, referredPage);
    if (response['message'].toString().contains('Unauthenticated')) {
      UserData.accessToken = await Future.delayed(Duration.zero, () {
        context.read<GuestCubit>().refresh(UserData.accessToken!);
        return null;
      });
      return getSessions(context, isTeacher, referredPage);
    } else if (response['data'] != null) {
      switch (response['status']) {
        case 200:
          var courses = response['data']['courses'];
          if (referredPage == 'home') {
            homeSessions.clear();
            for (var course in courses) {
              homeSessions.add(SessionEntity(
                  id: course['id'],
                  teacherName: course['teacher_name'],
                  studentName: course['student_name'],
                  courseName: course['course_name'],
                  classDate: course['class_date'],
                  classDuration: course['class_duration'],
                  classTime: course['class_time'],
                  sessionState: course['class_status']));
            }
            return null;
          } else if (referredPage == 'schedule') {
            return courses;
          }
          return null;
        case 400:
          toastInfo(msg: 'Bad request, couldn\'t load sessions');
        case 500:
          toastInfo(msg: 'Server is experiencing some issues');
        default:
          toastInfo(msg: 'Unknown error, contact support');
      }
    } else {
      toastInfo(msg: 'Check your internet connection');
    }

    return null;
  }

  Future<dynamic> cancelSession(
      BuildContext context, bool isTeacher, Map data) async {
    final response = await _sessionsRepository.cancelSession(
        CancelRequest(
            token: UserData.accessToken,
            date: data['date'],
            class_id: data['class_id'].toString(),
            time: data['time'],
            type: data['type'].toString(),
            user_id: UserData.id),
        isTeacher);
    if (response['message'].toString().contains('Unauthenticated')) {
      UserData.accessToken = await Future.delayed(Duration.zero, () {
        context.read<GuestCubit>().refresh(UserData.accessToken!);
        return null;
      });
      return cancelSession(context, isTeacher, data);
    } else if (response['msg'] != null) {
      toastInfo(msg: response['msg']);
    } else {
      toastInfo(msg: 'Check your internet connection');
    }
  }

  Future<dynamic> enterClass(BuildContext context, String classId) async {
    final response = await _sessionsRepository.enterSession(
        EnterRequest(token: UserData.accessToken, class_id: classId),
        UserData.isTeacher!);
    if (response['msg'] != null) {
      if (response['msg']
          .toString()
          .toLowerCase()
          .contains('unauthenticated')) {
        UserData.accessToken = await Future.delayed(Duration.zero, () {
          context.read<GuestCubit>().refresh(UserData.accessToken!);
          return null;
        });
        return enterClass(context, classId);
      } else {
        switch (response['status']) {
          case 1:
            return response['msg'];
          case 0:
            toastInfo(msg: 'Something went wrong, contact support');
          case 400:
            toastInfo(msg: 'Bad request, couldn\'t enter class');
          case 500:
            toastInfo(msg: 'Server is experiencing some issues');
          default:
            toastInfo(msg: 'Unknown error, contact support');
        }
      }
    } else {
      toastInfo(msg: 'Check your internet connection');
    }
  }

  Future<dynamic> absentStudent(BuildContext context, Map data) async {
    final response = await _sessionsRepository.absentStudent(
      AbsentRequest(
          token: UserData.accessToken,
          class_id: data['class_id'].toString(),
          note: data['note'],
          video: data['video'].first),
    );
    if (response.toString().toLowerCase().contains('too large')) {
      toastInfo(msg: 'Selected File Is Too Large');
    } else if (response['msg'] != null) {
      if (response['msg']
          .toString()
          .toLowerCase()
          .contains('unauthenticated')) {
        UserData.accessToken = await Future.delayed(Duration.zero, () {
          context.read<GuestCubit>().refresh(UserData.accessToken!);
          return null;
        });
        return absentStudent(context, data);
      } else {
        switch (response['status']) {
          case 1:
            toastInfo(msg: 'Student Is Marked As Asbent Successfully');
            return response['msg'];
          case 0:
            toastInfo(msg: 'Something went wrong, contact support');
          case 400:
            toastInfo(msg: 'Bad request, couldn\'t enter class');
          case 500:
            toastInfo(msg: 'Server is experiencing some issues');
          default:
            toastInfo(msg: response.toString());
        }
      }
    } else {
      toastInfo(msg: 'Check Your Internet Connection');
    }
  }

  Future<dynamic> endClass(BuildContext context, Map data) async {
    final response = await _sessionsRepository.endClass(
      EndRequest(
          token: UserData.accessToken,
          class_id: data['class_id'],
          homework: data['homework'],
          summary: data['summary'],
          notes: data['notes'],
          images: data['images']),
    );
    if (response['msg'] != null) {
      if (response['msg']
          .toString()
          .toLowerCase()
          .contains('unauthenticated')) {
        UserData.accessToken = await Future.delayed(Duration.zero, () {
          context.read<GuestCubit>().refresh(UserData.accessToken!);
          return null;
        });
        return endClass(context, data);
      } else {
        switch (response['status']) {
          case 1:
            return response['msg'];
          case 0:
            toastInfo(msg: 'Something went wrong, contact support');
          case 400:
            toastInfo(msg: 'Bad request, couldn\'t enter class');
          case 500:
            toastInfo(msg: 'Server is experiencing some issues');
          default:
            toastInfo(msg: 'Unknown error, contact support');
        }
      }
    } else {
      toastInfo(msg: 'Check your internet connection');
    }
  }
}
