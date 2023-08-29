// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SessionEntity _$$_SessionEntityFromJson(Map<String, dynamic> json) =>
    _$_SessionEntity(
      id: json['id'] as int?,
      teacherName: json['teacherName'] as String?,
      studentName: json['studentName'] as String?,
      courseName: json['courseName'] as String?,
      classDate: json['classDate'] as String?,
      classDuration: json['classDuration'] as int?,
      classTime: json['classTime'] as String?,
      sessionState: json['sessionState'] as String?,
    );

Map<String, dynamic> _$$_SessionEntityToJson(_$_SessionEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'teacherName': instance.teacherName,
      'studentName': instance.studentName,
      'courseName': instance.courseName,
      'classDate': instance.classDate,
      'classDuration': instance.classDuration,
      'classTime': instance.classTime,
      'sessionState': instance.sessionState,
    };
