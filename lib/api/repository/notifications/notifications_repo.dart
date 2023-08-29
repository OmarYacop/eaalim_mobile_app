import 'package:dio/dio.dart';

import '../../data/fetched_user_data.dart';
import '../../models/requests/notification_request/notification_request.dart';
import '../../utils/dio_client/dio_client.dart';
import '../core/endpoints.dart';
import 'base_notifications_repo.dart';

class NotificationsRepo extends BaseSessionsRepo {
  NotificationsRepo({
    Dio? dioClient,
  }) : _dioClient = dioClient ?? DioClient().instance;

  final Dio _dioClient;

  @override
  Future getNotifications(NotificationRequest request) async {
    final response = await _dioClient.post(
        UserData.isTeacher!
            ? Endpoints.teacherNotifications
            : Endpoints.studentNotifications,
        data: request.toJson(),
        options:
            Options(headers: {'Authorization': 'Bearer ${request.token}'}));
    return response.data;
  }

  @override
  Future setNotificationRead(NotificationRequest request) async {
    final response = await _dioClient.post(
        UserData.isTeacher!
            ? Endpoints.teacherNotificationSeen
            : Endpoints.studentNotificationsSeen,
        data: request.toJson(),
        options:
            Options(headers: {'Authorization': 'Bearer ${request.token}'}));
    return response.data;
  }
}
