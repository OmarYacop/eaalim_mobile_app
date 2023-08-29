import 'package:freezed_annotation/freezed_annotation.dart';

part 'session.freezed.dart';
part 'session.g.dart';

@freezed
class SessionEntity with _$SessionEntity {
  factory SessionEntity({
    required int? id,
    required String? teacherName,
    required String? studentName,
    required String? courseName,
    required String? classDate,
    required int? classDuration,
    required String? classTime,
    required String? sessionState,
  }) = _SessionEntity;

  factory SessionEntity.fromJson(Map<String, dynamic> json) =>
      _$SessionEntityFromJson(json);
}
