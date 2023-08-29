// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'enter_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EnterRequest _$EnterRequestFromJson(Map<String, dynamic> json) {
  return _EnterRequest.fromJson(json);
}

/// @nodoc
mixin _$EnterRequest {
  @JsonKey(name: 'access_token')
  String? get token => throw _privateConstructorUsedError;
  @JsonKey(name: 'class_id')
  String? get class_id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EnterRequestCopyWith<EnterRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EnterRequestCopyWith<$Res> {
  factory $EnterRequestCopyWith(
          EnterRequest value, $Res Function(EnterRequest) then) =
      _$EnterRequestCopyWithImpl<$Res, EnterRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: 'access_token') String? token,
      @JsonKey(name: 'class_id') String? class_id});
}

/// @nodoc
class _$EnterRequestCopyWithImpl<$Res, $Val extends EnterRequest>
    implements $EnterRequestCopyWith<$Res> {
  _$EnterRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = freezed,
    Object? class_id = freezed,
  }) {
    return _then(_value.copyWith(
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      class_id: freezed == class_id
          ? _value.class_id
          : class_id // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EnterRequestCopyWith<$Res>
    implements $EnterRequestCopyWith<$Res> {
  factory _$$_EnterRequestCopyWith(
          _$_EnterRequest value, $Res Function(_$_EnterRequest) then) =
      __$$_EnterRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'access_token') String? token,
      @JsonKey(name: 'class_id') String? class_id});
}

/// @nodoc
class __$$_EnterRequestCopyWithImpl<$Res>
    extends _$EnterRequestCopyWithImpl<$Res, _$_EnterRequest>
    implements _$$_EnterRequestCopyWith<$Res> {
  __$$_EnterRequestCopyWithImpl(
      _$_EnterRequest _value, $Res Function(_$_EnterRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = freezed,
    Object? class_id = freezed,
  }) {
    return _then(_$_EnterRequest(
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      class_id: freezed == class_id
          ? _value.class_id
          : class_id // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_EnterRequest implements _EnterRequest {
  _$_EnterRequest(
      {@JsonKey(name: 'access_token') required this.token,
      @JsonKey(name: 'class_id') required this.class_id});

  factory _$_EnterRequest.fromJson(Map<String, dynamic> json) =>
      _$$_EnterRequestFromJson(json);

  @override
  @JsonKey(name: 'access_token')
  final String? token;
  @override
  @JsonKey(name: 'class_id')
  final String? class_id;

  @override
  String toString() {
    return 'EnterRequest(token: $token, class_id: $class_id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EnterRequest &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.class_id, class_id) ||
                other.class_id == class_id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, token, class_id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EnterRequestCopyWith<_$_EnterRequest> get copyWith =>
      __$$_EnterRequestCopyWithImpl<_$_EnterRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EnterRequestToJson(
      this,
    );
  }
}

abstract class _EnterRequest implements EnterRequest {
  factory _EnterRequest(
          {@JsonKey(name: 'access_token') required final String? token,
          @JsonKey(name: 'class_id') required final String? class_id}) =
      _$_EnterRequest;

  factory _EnterRequest.fromJson(Map<String, dynamic> json) =
      _$_EnterRequest.fromJson;

  @override
  @JsonKey(name: 'access_token')
  String? get token;
  @override
  @JsonKey(name: 'class_id')
  String? get class_id;
  @override
  @JsonKey(ignore: true)
  _$$_EnterRequestCopyWith<_$_EnterRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
