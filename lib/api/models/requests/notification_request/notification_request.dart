import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_request.freezed.dart';
part 'notification_request.g.dart';

@freezed
class NotificationRequest with _$NotificationRequest {
  factory NotificationRequest({
    @JsonKey(name: 'user_id') required int? userId,
    @JsonKey(name: 'id') required int? id,
    @JsonKey(name: 'access_token') required String? token,
  }) = _NotificationRequest;

  factory NotificationRequest.fromJson(Map<String, dynamic> json) =>
      _$NotificationRequestFromJson(json);
}
