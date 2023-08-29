// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'end_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EndRequest _$EndRequestFromJson(Map<String, dynamic> json) {
  return _EndRequest.fromJson(json);
}

/// @nodoc
mixin _$EndRequest {
  @JsonKey(name: 'access_token')
  String? get token => throw _privateConstructorUsedError;
  @JsonKey(name: 'class_id')
  int? get class_id => throw _privateConstructorUsedError;
  @JsonKey(name: 'homework')
  String? get homework => throw _privateConstructorUsedError;
  @JsonKey(name: 'summary')
  String? get summary => throw _privateConstructorUsedError;
  @JsonKey(name: 'notes')
  String? get notes => throw _privateConstructorUsedError;
  @JsonKey(name: 'images')
  List<String>? get images => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EndRequestCopyWith<EndRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EndRequestCopyWith<$Res> {
  factory $EndRequestCopyWith(
          EndRequest value, $Res Function(EndRequest) then) =
      _$EndRequestCopyWithImpl<$Res, EndRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: 'access_token') String? token,
      @JsonKey(name: 'class_id') int? class_id,
      @JsonKey(name: 'homework') String? homework,
      @JsonKey(name: 'summary') String? summary,
      @JsonKey(name: 'notes') String? notes,
      @JsonKey(name: 'images') List<String>? images});
}

/// @nodoc
class _$EndRequestCopyWithImpl<$Res, $Val extends EndRequest>
    implements $EndRequestCopyWith<$Res> {
  _$EndRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = freezed,
    Object? class_id = freezed,
    Object? homework = freezed,
    Object? summary = freezed,
    Object? notes = freezed,
    Object? images = freezed,
  }) {
    return _then(_value.copyWith(
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      class_id: freezed == class_id
          ? _value.class_id
          : class_id // ignore: cast_nullable_to_non_nullable
              as int?,
      homework: freezed == homework
          ? _value.homework
          : homework // ignore: cast_nullable_to_non_nullable
              as String?,
      summary: freezed == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      images: freezed == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EndRequestCopyWith<$Res>
    implements $EndRequestCopyWith<$Res> {
  factory _$$_EndRequestCopyWith(
          _$_EndRequest value, $Res Function(_$_EndRequest) then) =
      __$$_EndRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'access_token') String? token,
      @JsonKey(name: 'class_id') int? class_id,
      @JsonKey(name: 'homework') String? homework,
      @JsonKey(name: 'summary') String? summary,
      @JsonKey(name: 'notes') String? notes,
      @JsonKey(name: 'images') List<String>? images});
}

/// @nodoc
class __$$_EndRequestCopyWithImpl<$Res>
    extends _$EndRequestCopyWithImpl<$Res, _$_EndRequest>
    implements _$$_EndRequestCopyWith<$Res> {
  __$$_EndRequestCopyWithImpl(
      _$_EndRequest _value, $Res Function(_$_EndRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = freezed,
    Object? class_id = freezed,
    Object? homework = freezed,
    Object? summary = freezed,
    Object? notes = freezed,
    Object? images = freezed,
  }) {
    return _then(_$_EndRequest(
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      class_id: freezed == class_id
          ? _value.class_id
          : class_id // ignore: cast_nullable_to_non_nullable
              as int?,
      homework: freezed == homework
          ? _value.homework
          : homework // ignore: cast_nullable_to_non_nullable
              as String?,
      summary: freezed == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      images: freezed == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_EndRequest implements _EndRequest {
  _$_EndRequest(
      {@JsonKey(name: 'access_token') required this.token,
      @JsonKey(name: 'class_id') required this.class_id,
      @JsonKey(name: 'homework') required this.homework,
      @JsonKey(name: 'summary') required this.summary,
      @JsonKey(name: 'notes') required this.notes,
      @JsonKey(name: 'images') required final List<String>? images})
      : _images = images;

  factory _$_EndRequest.fromJson(Map<String, dynamic> json) =>
      _$$_EndRequestFromJson(json);

  @override
  @JsonKey(name: 'access_token')
  final String? token;
  @override
  @JsonKey(name: 'class_id')
  final int? class_id;
  @override
  @JsonKey(name: 'homework')
  final String? homework;
  @override
  @JsonKey(name: 'summary')
  final String? summary;
  @override
  @JsonKey(name: 'notes')
  final String? notes;
  final List<String>? _images;
  @override
  @JsonKey(name: 'images')
  List<String>? get images {
    final value = _images;
    if (value == null) return null;
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'EndRequest(token: $token, class_id: $class_id, homework: $homework, summary: $summary, notes: $notes, images: $images)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EndRequest &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.class_id, class_id) ||
                other.class_id == class_id) &&
            (identical(other.homework, homework) ||
                other.homework == homework) &&
            (identical(other.summary, summary) || other.summary == summary) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            const DeepCollectionEquality().equals(other._images, _images));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, token, class_id, homework,
      summary, notes, const DeepCollectionEquality().hash(_images));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EndRequestCopyWith<_$_EndRequest> get copyWith =>
      __$$_EndRequestCopyWithImpl<_$_EndRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EndRequestToJson(
      this,
    );
  }
}

abstract class _EndRequest implements EndRequest {
  factory _EndRequest(
          {@JsonKey(name: 'access_token') required final String? token,
          @JsonKey(name: 'class_id') required final int? class_id,
          @JsonKey(name: 'homework') required final String? homework,
          @JsonKey(name: 'summary') required final String? summary,
          @JsonKey(name: 'notes') required final String? notes,
          @JsonKey(name: 'images') required final List<String>? images}) =
      _$_EndRequest;

  factory _EndRequest.fromJson(Map<String, dynamic> json) =
      _$_EndRequest.fromJson;

  @override
  @JsonKey(name: 'access_token')
  String? get token;
  @override
  @JsonKey(name: 'class_id')
  int? get class_id;
  @override
  @JsonKey(name: 'homework')
  String? get homework;
  @override
  @JsonKey(name: 'summary')
  String? get summary;
  @override
  @JsonKey(name: 'notes')
  String? get notes;
  @override
  @JsonKey(name: 'images')
  List<String>? get images;
  @override
  @JsonKey(ignore: true)
  _$$_EndRequestCopyWith<_$_EndRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
