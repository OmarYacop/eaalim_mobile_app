// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NotificationRequest _$NotificationRequestFromJson(Map<String, dynamic> json) {
  return _NotificationRequest.fromJson(json);
}

/// @nodoc
mixin _$NotificationRequest {
  @JsonKey(name: 'user_id')
  int? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'access_token')
  String? get token => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotificationRequestCopyWith<NotificationRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationRequestCopyWith<$Res> {
  factory $NotificationRequestCopyWith(
          NotificationRequest value, $Res Function(NotificationRequest) then) =
      _$NotificationRequestCopyWithImpl<$Res, NotificationRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: 'user_id') int? userId,
      @JsonKey(name: 'id') int? id,
      @JsonKey(name: 'access_token') String? token});
}

/// @nodoc
class _$NotificationRequestCopyWithImpl<$Res, $Val extends NotificationRequest>
    implements $NotificationRequestCopyWith<$Res> {
  _$NotificationRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? id = freezed,
    Object? token = freezed,
  }) {
    return _then(_value.copyWith(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NotificationRequestCopyWith<$Res>
    implements $NotificationRequestCopyWith<$Res> {
  factory _$$_NotificationRequestCopyWith(_$_NotificationRequest value,
          $Res Function(_$_NotificationRequest) then) =
      __$$_NotificationRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'user_id') int? userId,
      @JsonKey(name: 'id') int? id,
      @JsonKey(name: 'access_token') String? token});
}

/// @nodoc
class __$$_NotificationRequestCopyWithImpl<$Res>
    extends _$NotificationRequestCopyWithImpl<$Res, _$_NotificationRequest>
    implements _$$_NotificationRequestCopyWith<$Res> {
  __$$_NotificationRequestCopyWithImpl(_$_NotificationRequest _value,
      $Res Function(_$_NotificationRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? id = freezed,
    Object? token = freezed,
  }) {
    return _then(_$_NotificationRequest(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NotificationRequest implements _NotificationRequest {
  _$_NotificationRequest(
      {@JsonKey(name: 'user_id') required this.userId,
      @JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'access_token') required this.token});

  factory _$_NotificationRequest.fromJson(Map<String, dynamic> json) =>
      _$$_NotificationRequestFromJson(json);

  @override
  @JsonKey(name: 'user_id')
  final int? userId;
  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'access_token')
  final String? token;

  @override
  String toString() {
    return 'NotificationRequest(userId: $userId, id: $id, token: $token)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NotificationRequest &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.token, token) || other.token == token));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, userId, id, token);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NotificationRequestCopyWith<_$_NotificationRequest> get copyWith =>
      __$$_NotificationRequestCopyWithImpl<_$_NotificationRequest>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NotificationRequestToJson(
      this,
    );
  }
}

abstract class _NotificationRequest implements NotificationRequest {
  factory _NotificationRequest(
          {@JsonKey(name: 'user_id') required final int? userId,
          @JsonKey(name: 'id') required final int? id,
          @JsonKey(name: 'access_token') required final String? token}) =
      _$_NotificationRequest;

  factory _NotificationRequest.fromJson(Map<String, dynamic> json) =
      _$_NotificationRequest.fromJson;

  @override
  @JsonKey(name: 'user_id')
  int? get userId;
  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'access_token')
  String? get token;
  @override
  @JsonKey(ignore: true)
  _$$_NotificationRequestCopyWith<_$_NotificationRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
