import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../api/data/fetched_user_data.dart';
import '../../api/models/notification_model/notification_model.dart';
import '../../api/models/requests/notification_request/notification_request.dart';
import '../../api/repository/notifications/notifications_repo.dart';
import '../../constants/widgets/flutter_toast.dart';
import '../../views/notifications/widgets/notifications.dart';
import '../guest_cubit/guest_cubit.dart';

part 'notifications_state.dart';
part 'notifications_cubit.freezed.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  final NotificationsRepo _notificationsRepo;

  NotificationsCubit({
    required NotificationsRepo notificationsRepo,
  })  : _notificationsRepo = notificationsRepo,
        super(
          const NotificationsState.initial(),
        );

  Future<dynamic> getNotifications(BuildContext context) async {
    final response = await _notificationsRepo.getNotifications(
        NotificationRequest(
            userId: UserData.id, id: null, token: UserData.accessToken));
    if (response['msg'].isNotEmpty) {
      switch (response['status']) {
        case 1:
          for (var element in response['msg']) {
            notifications.add(NotificationEntity(
                id: element.first['id'],
                status: element.first['status'],
                date: element.first['date'],
                seen: element.first['seen'],
                message: element.first['message'],
                teacherName: element.first['teacher_name'],
                studentName: element.first['student_name']));
          }
          return response['msg'];
        case 400:
          toastInfo(msg: 'Bad request, couldn\'t load notifications');
        case 500:
          toastInfo(msg: 'Server is experiencing some issues');
        default:
          toastInfo(msg: 'Unknown error, contact support');
      }
    } else if (response['msg']
        .toString()
        .toLowerCase()
        .contains('unauthenticated')) {
      UserData.accessToken = await Future.delayed(Duration.zero, () {
        context.read<GuestCubit>().refresh(UserData.accessToken!);
        return null;
      });
      return getNotifications(context);
    } else {
      toastInfo(msg: 'Check your internet connection');
    }
    return [];
  }

  Future<dynamic> setNotificationSeen(BuildContext context, int id) async {
    final response = await _notificationsRepo.setNotificationRead(
        NotificationRequest(userId: null, id: id, token: UserData.accessToken));
    if (response['msg'].isNotEmpty) {
      switch (response['status']) {
        case 1:
          return null;
        case 0:
          toastInfo(msg: 'Something went wrong, try again later');
        case 400:
          toastInfo(msg: 'Bad request, couldn\'t load notifications');
        case 500:
          toastInfo(msg: 'Server is experiencing some issues');
        default:
          toastInfo(msg: 'Unknown error, contact support');
      }
    } else if (response['message'].toString().contains('Unauthenticated')) {
      UserData.accessToken = await Future.delayed(Duration.zero, () {
        context.read<GuestCubit>().refresh(UserData.accessToken!);
        return null;
      });
      return setNotificationSeen(context, id);
    } else {
      toastInfo(msg: 'Check your internet connection');
    }
    return [];
  }
}
