// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NotificationRequest _$$_NotificationRequestFromJson(
        Map<String, dynamic> json) =>
    _$_NotificationRequest(
      userId: json['user_id'] as int?,
      id: json['id'] as int?,
      token: json['access_token'] as String?,
    );

Map<String, dynamic> _$$_NotificationRequestToJson(
        _$_NotificationRequest instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'id': instance.id,
      'access_token': instance.token,
    };
