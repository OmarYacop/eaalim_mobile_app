// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enter_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_EnterRequest _$$_EnterRequestFromJson(Map<String, dynamic> json) =>
    _$_EnterRequest(
      token: json['access_token'] as String?,
      class_id: json['class_id'] as String?,
    );

Map<String, dynamic> _$$_EnterRequestToJson(_$_EnterRequest instance) =>
    <String, dynamic>{
      'access_token': instance.token,
      'class_id': instance.class_id,
    };
