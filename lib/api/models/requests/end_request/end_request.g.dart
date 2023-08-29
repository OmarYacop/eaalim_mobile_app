// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'end_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_EndRequest _$$_EndRequestFromJson(Map<String, dynamic> json) =>
    _$_EndRequest(
      token: json['access_token'] as String?,
      class_id: json['class_id'] as int?,
      homework: json['homework'] as String?,
      summary: json['summary'] as String?,
      notes: json['notes'] as String?,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$_EndRequestToJson(_$_EndRequest instance) =>
    <String, dynamic>{
      'access_token': instance.token,
      'class_id': instance.class_id,
      'homework': instance.homework,
      'summary': instance.summary,
      'notes': instance.notes,
      'images': instance.images,
    };
