import '../../models/requests/requests.dart';

abstract class BaseSessionsRepo {
  Future<dynamic> getNotifications(NotificationRequest request);
  Future<dynamic> setNotificationRead(
      NotificationRequest request);
}
