// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'absent_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AbsentRequest _$AbsentRequestFromJson(Map<String, dynamic> json) {
  return _AbsentRequest.fromJson(json);
}

/// @nodoc
mixin _$AbsentRequest {
  @JsonKey(name: 'access_token')
  String? get token => throw _privateConstructorUsedError;
  @JsonKey(name: 'class_id')
  String? get class_id => throw _privateConstructorUsedError;
  @JsonKey(name: 'note')
  String? get note => throw _privateConstructorUsedError;
  @JsonKey(name: 'video')
  String? get video => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AbsentRequestCopyWith<AbsentRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AbsentRequestCopyWith<$Res> {
  factory $AbsentRequestCopyWith(
          AbsentRequest value, $Res Function(AbsentRequest) then) =
      _$AbsentRequestCopyWithImpl<$Res, AbsentRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: 'access_token') String? token,
      @JsonKey(name: 'class_id') String? class_id,
      @JsonKey(name: 'note') String? note,
      @JsonKey(name: 'video') String? video});
}

/// @nodoc
class _$AbsentRequestCopyWithImpl<$Res, $Val extends AbsentRequest>
    implements $AbsentRequestCopyWith<$Res> {
  _$AbsentRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = freezed,
    Object? class_id = freezed,
    Object? note = freezed,
    Object? video = freezed,
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
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      video: freezed == video
          ? _value.video
          : video // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AbsentRequestCopyWith<$Res>
    implements $AbsentRequestCopyWith<$Res> {
  factory _$$_AbsentRequestCopyWith(
          _$_AbsentRequest value, $Res Function(_$_AbsentRequest) then) =
      __$$_AbsentRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'access_token') String? token,
      @JsonKey(name: 'class_id') String? class_id,
      @JsonKey(name: 'note') String? note,
      @JsonKey(name: 'video') String? video});
}

/// @nodoc
class __$$_AbsentRequestCopyWithImpl<$Res>
    extends _$AbsentRequestCopyWithImpl<$Res, _$_AbsentRequest>
    implements _$$_AbsentRequestCopyWith<$Res> {
  __$$_AbsentRequestCopyWithImpl(
      _$_AbsentRequest _value, $Res Function(_$_AbsentRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = freezed,
    Object? class_id = freezed,
    Object? note = freezed,
    Object? video = freezed,
  }) {
    return _then(_$_AbsentRequest(
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      class_id: freezed == class_id
          ? _value.class_id
          : class_id // ignore: cast_nullable_to_non_nullable
              as String?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      video: freezed == video
          ? _value.video
          : video // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AbsentRequest implements _AbsentRequest {
  _$_AbsentRequest(
      {@JsonKey(name: 'access_token') required this.token,
      @JsonKey(name: 'class_id') required this.class_id,
      @JsonKey(name: 'note') required this.note,
      @JsonKey(name: 'video') required this.video});

  factory _$_AbsentRequest.fromJson(Map<String, dynamic> json) =>
      _$$_AbsentRequestFromJson(json);

  @override
  @JsonKey(name: 'access_token')
  final String? token;
  @override
  @JsonKey(name: 'class_id')
  final String? class_id;
  @override
  @JsonKey(name: 'note')
  final String? note;
  @override
  @JsonKey(name: 'video')
  final String? video;

  @override
  String toString() {
    return 'AbsentRequest(token: $token, class_id: $class_id, note: $note, video: $video)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AbsentRequest &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.class_id, class_id) ||
                other.class_id == class_id) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.video, video) || other.video == video));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, token, class_id, note, video);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AbsentRequestCopyWith<_$_AbsentRequest> get copyWith =>
      __$$_AbsentRequestCopyWithImpl<_$_AbsentRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AbsentRequestToJson(
      this,
    );
  }
}

abstract class _AbsentRequest implements AbsentRequest {
  factory _AbsentRequest(
      {@JsonKey(name: 'access_token') required final String? token,
      @JsonKey(name: 'class_id') required final String? class_id,
      @JsonKey(name: 'note') required final String? note,
      @JsonKey(name: 'video') required final String? video}) = _$_AbsentRequest;

  factory _AbsentRequest.fromJson(Map<String, dynamic> json) =
      _$_AbsentRequest.fromJson;

  @override
  @JsonKey(name: 'access_token')
  String? get token;
  @override
  @JsonKey(name: 'class_id')
  String? get class_id;
  @override
  @JsonKey(name: 'note')
  String? get note;
  @override
  @JsonKey(name: 'video')
  String? get video;
  @override
  @JsonKey(ignore: true)
  _$$_AbsentRequestCopyWith<_$_AbsentRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
