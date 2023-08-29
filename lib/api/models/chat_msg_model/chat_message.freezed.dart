// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChatMessageEntity _$ChatMessageEntityFromJson(Map<String, dynamic> json) {
  return _ChatMessageEntity.fromJson(json);
}

/// @nodoc
mixin _$ChatMessageEntity {
  String? get message => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;
  String? get sender => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatMessageEntityCopyWith<ChatMessageEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatMessageEntityCopyWith<$Res> {
  factory $ChatMessageEntityCopyWith(
          ChatMessageEntity value, $Res Function(ChatMessageEntity) then) =
      _$ChatMessageEntityCopyWithImpl<$Res, ChatMessageEntity>;
  @useResult
  $Res call({String? message, String? url, String? sender});
}

/// @nodoc
class _$ChatMessageEntityCopyWithImpl<$Res, $Val extends ChatMessageEntity>
    implements $ChatMessageEntityCopyWith<$Res> {
  _$ChatMessageEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? url = freezed,
    Object? sender = freezed,
  }) {
    return _then(_value.copyWith(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      sender: freezed == sender
          ? _value.sender
          : sender // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ChatMessageEntityCopyWith<$Res>
    implements $ChatMessageEntityCopyWith<$Res> {
  factory _$$_ChatMessageEntityCopyWith(_$_ChatMessageEntity value,
          $Res Function(_$_ChatMessageEntity) then) =
      __$$_ChatMessageEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? message, String? url, String? sender});
}

/// @nodoc
class __$$_ChatMessageEntityCopyWithImpl<$Res>
    extends _$ChatMessageEntityCopyWithImpl<$Res, _$_ChatMessageEntity>
    implements _$$_ChatMessageEntityCopyWith<$Res> {
  __$$_ChatMessageEntityCopyWithImpl(
      _$_ChatMessageEntity _value, $Res Function(_$_ChatMessageEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? url = freezed,
    Object? sender = freezed,
  }) {
    return _then(_$_ChatMessageEntity(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      sender: freezed == sender
          ? _value.sender
          : sender // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ChatMessageEntity implements _ChatMessageEntity {
  _$_ChatMessageEntity({this.message, this.url, this.sender});

  factory _$_ChatMessageEntity.fromJson(Map<String, dynamic> json) =>
      _$$_ChatMessageEntityFromJson(json);

  @override
  final String? message;
  @override
  final String? url;
  @override
  final String? sender;

  @override
  String toString() {
    return 'ChatMessageEntity(message: $message, url: $url, sender: $sender)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChatMessageEntity &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.sender, sender) || other.sender == sender));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, message, url, sender);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChatMessageEntityCopyWith<_$_ChatMessageEntity> get copyWith =>
      __$$_ChatMessageEntityCopyWithImpl<_$_ChatMessageEntity>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChatMessageEntityToJson(
      this,
    );
  }
}

abstract class _ChatMessageEntity implements ChatMessageEntity {
  factory _ChatMessageEntity(
      {final String? message,
      final String? url,
      final String? sender}) = _$_ChatMessageEntity;

  factory _ChatMessageEntity.fromJson(Map<String, dynamic> json) =
      _$_ChatMessageEntity.fromJson;

  @override
  String? get message;
  @override
  String? get url;
  @override
  String? get sender;
  @override
  @JsonKey(ignore: true)
  _$$_ChatMessageEntityCopyWith<_$_ChatMessageEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
