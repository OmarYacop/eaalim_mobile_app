// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'refresh_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RefreshRequest _$RefreshRequestFromJson(Map<String, dynamic> json) {
  return _RefreshRequest.fromJson(json);
}

/// @nodoc
mixin _$RefreshRequest {
  @JsonKey(name: 'access_token')
  String? get token => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RefreshRequestCopyWith<RefreshRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RefreshRequestCopyWith<$Res> {
  factory $RefreshRequestCopyWith(
          RefreshRequest value, $Res Function(RefreshRequest) then) =
      _$RefreshRequestCopyWithImpl<$Res, RefreshRequest>;
  @useResult
  $Res call({@JsonKey(name: 'access_token') String? token});
}

/// @nodoc
class _$RefreshRequestCopyWithImpl<$Res, $Val extends RefreshRequest>
    implements $RefreshRequestCopyWith<$Res> {
  _$RefreshRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = freezed,
  }) {
    return _then(_value.copyWith(
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RefreshRequestCopyWith<$Res>
    implements $RefreshRequestCopyWith<$Res> {
  factory _$$_RefreshRequestCopyWith(
          _$_RefreshRequest value, $Res Function(_$_RefreshRequest) then) =
      __$$_RefreshRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'access_token') String? token});
}

/// @nodoc
class __$$_RefreshRequestCopyWithImpl<$Res>
    extends _$RefreshRequestCopyWithImpl<$Res, _$_RefreshRequest>
    implements _$$_RefreshRequestCopyWith<$Res> {
  __$$_RefreshRequestCopyWithImpl(
      _$_RefreshRequest _value, $Res Function(_$_RefreshRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = freezed,
  }) {
    return _then(_$_RefreshRequest(
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RefreshRequest implements _RefreshRequest {
  _$_RefreshRequest({@JsonKey(name: 'access_token') required this.token});

  factory _$_RefreshRequest.fromJson(Map<String, dynamic> json) =>
      _$$_RefreshRequestFromJson(json);

  @override
  @JsonKey(name: 'access_token')
  final String? token;

  @override
  String toString() {
    return 'RefreshRequest(token: $token)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RefreshRequest &&
            (identical(other.token, token) || other.token == token));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, token);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RefreshRequestCopyWith<_$_RefreshRequest> get copyWith =>
      __$$_RefreshRequestCopyWithImpl<_$_RefreshRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RefreshRequestToJson(
      this,
    );
  }
}

abstract class _RefreshRequest implements RefreshRequest {
  factory _RefreshRequest(
          {@JsonKey(name: 'access_token') required final String? token}) =
      _$_RefreshRequest;

  factory _RefreshRequest.fromJson(Map<String, dynamic> json) =
      _$_RefreshRequest.fromJson;

  @override
  @JsonKey(name: 'access_token')
  String? get token;
  @override
  @JsonKey(ignore: true)
  _$$_RefreshRequestCopyWith<_$_RefreshRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
