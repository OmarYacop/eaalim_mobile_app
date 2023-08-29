// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SessionEntity _$SessionEntityFromJson(Map<String, dynamic> json) {
  return _SessionEntity.fromJson(json);
}

/// @nodoc
mixin _$SessionEntity {
  int? get id => throw _privateConstructorUsedError;
  String? get teacherName => throw _privateConstructorUsedError;
  String? get studentName => throw _privateConstructorUsedError;
  String? get courseName => throw _privateConstructorUsedError;
  String? get classDate => throw _privateConstructorUsedError;
  int? get classDuration => throw _privateConstructorUsedError;
  String? get classTime => throw _privateConstructorUsedError;
  String? get sessionState => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SessionEntityCopyWith<SessionEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SessionEntityCopyWith<$Res> {
  factory $SessionEntityCopyWith(
          SessionEntity value, $Res Function(SessionEntity) then) =
      _$SessionEntityCopyWithImpl<$Res, SessionEntity>;
  @useResult
  $Res call(
      {int? id,
      String? teacherName,
      String? studentName,
      String? courseName,
      String? classDate,
      int? classDuration,
      String? classTime,
      String? sessionState});
}

/// @nodoc
class _$SessionEntityCopyWithImpl<$Res, $Val extends SessionEntity>
    implements $SessionEntityCopyWith<$Res> {
  _$SessionEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? teacherName = freezed,
    Object? studentName = freezed,
    Object? courseName = freezed,
    Object? classDate = freezed,
    Object? classDuration = freezed,
    Object? classTime = freezed,
    Object? sessionState = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      teacherName: freezed == teacherName
          ? _value.teacherName
          : teacherName // ignore: cast_nullable_to_non_nullable
              as String?,
      studentName: freezed == studentName
          ? _value.studentName
          : studentName // ignore: cast_nullable_to_non_nullable
              as String?,
      courseName: freezed == courseName
          ? _value.courseName
          : courseName // ignore: cast_nullable_to_non_nullable
              as String?,
      classDate: freezed == classDate
          ? _value.classDate
          : classDate // ignore: cast_nullable_to_non_nullable
              as String?,
      classDuration: freezed == classDuration
          ? _value.classDuration
          : classDuration // ignore: cast_nullable_to_non_nullable
              as int?,
      classTime: freezed == classTime
          ? _value.classTime
          : classTime // ignore: cast_nullable_to_non_nullable
              as String?,
      sessionState: freezed == sessionState
          ? _value.sessionState
          : sessionState // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SessionEntityCopyWith<$Res>
    implements $SessionEntityCopyWith<$Res> {
  factory _$$_SessionEntityCopyWith(
          _$_SessionEntity value, $Res Function(_$_SessionEntity) then) =
      __$$_SessionEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? teacherName,
      String? studentName,
      String? courseName,
      String? classDate,
      int? classDuration,
      String? classTime,
      String? sessionState});
}

/// @nodoc
class __$$_SessionEntityCopyWithImpl<$Res>
    extends _$SessionEntityCopyWithImpl<$Res, _$_SessionEntity>
    implements _$$_SessionEntityCopyWith<$Res> {
  __$$_SessionEntityCopyWithImpl(
      _$_SessionEntity _value, $Res Function(_$_SessionEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? teacherName = freezed,
    Object? studentName = freezed,
    Object? courseName = freezed,
    Object? classDate = freezed,
    Object? classDuration = freezed,
    Object? classTime = freezed,
    Object? sessionState = freezed,
  }) {
    return _then(_$_SessionEntity(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      teacherName: freezed == teacherName
          ? _value.teacherName
          : teacherName // ignore: cast_nullable_to_non_nullable
              as String?,
      studentName: freezed == studentName
          ? _value.studentName
          : studentName // ignore: cast_nullable_to_non_nullable
              as String?,
      courseName: freezed == courseName
          ? _value.courseName
          : courseName // ignore: cast_nullable_to_non_nullable
              as String?,
      classDate: freezed == classDate
          ? _value.classDate
          : classDate // ignore: cast_nullable_to_non_nullable
              as String?,
      classDuration: freezed == classDuration
          ? _value.classDuration
          : classDuration // ignore: cast_nullable_to_non_nullable
              as int?,
      classTime: freezed == classTime
          ? _value.classTime
          : classTime // ignore: cast_nullable_to_non_nullable
              as String?,
      sessionState: freezed == sessionState
          ? _value.sessionState
          : sessionState // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SessionEntity implements _SessionEntity {
  _$_SessionEntity(
      {required this.id,
      required this.teacherName,
      required this.studentName,
      required this.courseName,
      required this.classDate,
      required this.classDuration,
      required this.classTime,
      required this.sessionState});

  factory _$_SessionEntity.fromJson(Map<String, dynamic> json) =>
      _$$_SessionEntityFromJson(json);

  @override
  final int? id;
  @override
  final String? teacherName;
  @override
  final String? studentName;
  @override
  final String? courseName;
  @override
  final String? classDate;
  @override
  final int? classDuration;
  @override
  final String? classTime;
  @override
  final String? sessionState;

  @override
  String toString() {
    return 'SessionEntity(id: $id, teacherName: $teacherName, studentName: $studentName, courseName: $courseName, classDate: $classDate, classDuration: $classDuration, classTime: $classTime, sessionState: $sessionState)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SessionEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.teacherName, teacherName) ||
                other.teacherName == teacherName) &&
            (identical(other.studentName, studentName) ||
                other.studentName == studentName) &&
            (identical(other.courseName, courseName) ||
                other.courseName == courseName) &&
            (identical(other.classDate, classDate) ||
                other.classDate == classDate) &&
            (identical(other.classDuration, classDuration) ||
                other.classDuration == classDuration) &&
            (identical(other.classTime, classTime) ||
                other.classTime == classTime) &&
            (identical(other.sessionState, sessionState) ||
                other.sessionState == sessionState));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, teacherName, studentName,
      courseName, classDate, classDuration, classTime, sessionState);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SessionEntityCopyWith<_$_SessionEntity> get copyWith =>
      __$$_SessionEntityCopyWithImpl<_$_SessionEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SessionEntityToJson(
      this,
    );
  }
}

abstract class _SessionEntity implements SessionEntity {
  factory _SessionEntity(
      {required final int? id,
      required final String? teacherName,
      required final String? studentName,
      required final String? courseName,
      required final String? classDate,
      required final int? classDuration,
      required final String? classTime,
      required final String? sessionState}) = _$_SessionEntity;

  factory _SessionEntity.fromJson(Map<String, dynamic> json) =
      _$_SessionEntity.fromJson;

  @override
  int? get id;
  @override
  String? get teacherName;
  @override
  String? get studentName;
  @override
  String? get courseName;
  @override
  String? get classDate;
  @override
  int? get classDuration;
  @override
  String? get classTime;
  @override
  String? get sessionState;
  @override
  @JsonKey(ignore: true)
  _$$_SessionEntityCopyWith<_$_SessionEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
