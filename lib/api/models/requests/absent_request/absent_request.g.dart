// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'absent_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AbsentRequest _$$_AbsentRequestFromJson(Map<String, dynamic> json) =>
    _$_AbsentRequest(
      token: json['access_token'] as String?,
      class_id: json['class_id'] as String?,
      note: json['note'] as String?,
      video: json['video'] as String?,
    );

Map<String, dynamic> _$$_AbsentRequestToJson(_$_AbsentRequest instance) =>
    <String, dynamic>{
      'access_token': instance.token,
      'class_id': instance.class_id,
      'note': instance.note,
      'video': instance.video,
    };
