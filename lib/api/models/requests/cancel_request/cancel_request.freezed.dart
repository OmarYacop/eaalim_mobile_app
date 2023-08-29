// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cancel_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CancelRequest _$CancelRequestFromJson(Map<String, dynamic> json) {
  return _CancelRequest.fromJson(json);
}

/// @nodoc
mixin _$CancelRequest {
  @JsonKey(name: 'access_token')
  String? get token => throw _privateConstructorUsedError;
  @JsonKey(name: 'type')
  String? get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'class_id')
  String? get class_id => throw _privateConstructorUsedError;
  @JsonKey(name: 'date')
  String? get date => throw _privateConstructorUsedError;
  @JsonKey(name: 'time')
  String? get time => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  int? get user_id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CancelRequestCopyWith<CancelRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CancelRequestCopyWith<$Res> {
  factory $CancelRequestCopyWith(
          CancelRequest value, $Res Function(CancelRequest) then) =
      _$CancelRequestCopyWithImpl<$Res, CancelRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: 'access_token') String? token,
      @JsonKey(name: 'type') String? type,
      @JsonKey(name: 'class_id') String? class_id,
      @JsonKey(name: 'date') String? date,
      @JsonKey(name: 'time') String? time,
      @JsonKey(name: 'user_id') int? user_id});
}

/// @nodoc
class _$CancelRequestCopyWithImpl<$Res, $Val extends CancelRequest>
    implements $CancelRequestCopyWith<$Res> {
  _$CancelRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = freezed,
    Object? type = freezed,
    Object? class_id = freezed,
    Object? date = freezed,
    Object? time = freezed,
    Object? user_id = freezed,
  }) {
    return _then(_value.copyWith(
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      class_id: freezed == class_id
          ? _value.class_id
          : class_id // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String?,
      user_id: freezed == user_id
          ? _value.user_id
          : user_id // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CancelRequestCopyWith<$Res>
    implements $CancelRequestCopyWith<$Res> {
  factory _$$_CancelRequestCopyWith(
          _$_CancelRequest value, $Res Function(_$_CancelRequest) then) =
      __$$_CancelRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'access_token') String? token,
      @JsonKey(name: 'type') String? type,
      @JsonKey(name: 'class_id') String? class_id,
      @JsonKey(name: 'date') String? date,
      @JsonKey(name: 'time') String? time,
      @JsonKey(name: 'user_id') int? user_id});
}

/// @nodoc
class __$$_CancelRequestCopyWithImpl<$Res>
    extends _$CancelRequestCopyWithImpl<$Res, _$_CancelRequest>
    implements _$$_CancelRequestCopyWith<$Res> {
  __$$_CancelRequestCopyWithImpl(
      _$_CancelRequest _value, $Res Function(_$_CancelRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = freezed,
    Object? type = freezed,
    Object? class_id = freezed,
    Object? date = freezed,
    Object? time = freezed,
    Object? user_id = freezed,
  }) {
    return _then(_$_CancelRequest(
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      class_id: freezed == class_id
          ? _value.class_id
          : class_id // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String?,
      user_id: freezed == user_id
          ? _value.user_id
          : user_id // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CancelRequest implements _CancelRequest {
  _$_CancelRequest(
      {@JsonKey(name: 'access_token') required this.token,
      @JsonKey(name: 'type') required this.type,
      @JsonKey(name: 'class_id') required this.class_id,
      @JsonKey(name: 'date') required this.date,
      @JsonKey(name: 'time') required this.time,
      @JsonKey(name: 'user_id') required this.user_id});

  factory _$_CancelRequest.fromJson(Map<String, dynamic> json) =>
      _$$_CancelRequestFromJson(json);

  @override
  @JsonKey(name: 'access_token')
  final String? token;
  @override
  @JsonKey(name: 'type')
  final String? type;
  @override
  @JsonKey(name: 'class_id')
  final String? class_id;
  @override
  @JsonKey(name: 'date')
  final String? date;
  @override
  @JsonKey(name: 'time')
  final String? time;
  @override
  @JsonKey(name: 'user_id')
  final int? user_id;

  @override
  String toString() {
    return 'CancelRequest(token: $token, type: $type, class_id: $class_id, date: $date, time: $time, user_id: $user_id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CancelRequest &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.class_id, class_id) ||
                other.class_id == class_id) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.user_id, user_id) || other.user_id == user_id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, token, type, class_id, date, time, user_id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CancelRequestCopyWith<_$_CancelRequest> get copyWith =>
      __$$_CancelRequestCopyWithImpl<_$_CancelRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CancelRequestToJson(
      this,
    );
  }
}

abstract class _CancelRequest implements CancelRequest {
  factory _CancelRequest(
          {@JsonKey(name: 'access_token') required final String? token,
          @JsonKey(name: 'type') required final String? type,
          @JsonKey(name: 'class_id') required final String? class_id,
          @JsonKey(name: 'date') required final String? date,
          @JsonKey(name: 'time') required final String? time,
          @JsonKey(name: 'user_id') required final int? user_id}) =
      _$_CancelRequest;

  factory _CancelRequest.fromJson(Map<String, dynamic> json) =
      _$_CancelRequest.fromJson;

  @override
  @JsonKey(name: 'access_token')
  String? get token;
  @override
  @JsonKey(name: 'type')
  String? get type;
  @override
  @JsonKey(name: 'class_id')
  String? get class_id;
  @override
  @JsonKey(name: 'date')
  String? get date;
  @override
  @JsonKey(name: 'time')
  String? get time;
  @override
  @JsonKey(name: 'user_id')
  int? get user_id;
  @override
  @JsonKey(ignore: true)
  _$$_CancelRequestCopyWith<_$_CancelRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
