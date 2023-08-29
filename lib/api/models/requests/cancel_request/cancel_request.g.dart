// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cancel_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CancelRequest _$$_CancelRequestFromJson(Map<String, dynamic> json) =>
    _$_CancelRequest(
      token: json['access_token'] as String?,
      type: json['type'] as String?,
      class_id: json['class_id'] as String?,
      date: json['date'] as String?,
      time: json['time'] as String?,
      user_id: json['user_id'] as int?,
    );

Map<String, dynamic> _$$_CancelRequestToJson(_$_CancelRequest instance) =>
    <String, dynamic>{
      'access_token': instance.token,
      'type': instance.type,
      'class_id': instance.class_id,
      'date': instance.date,
      'time': instance.time,
      'user_id': instance.user_id,
    };
