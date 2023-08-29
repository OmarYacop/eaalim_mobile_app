// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChatEntity _$ChatEntityFromJson(Map<String, dynamic> json) {
  return _ChatEntity.fromJson(json);
}

/// @nodoc
mixin _$ChatEntity {
  String get profile => throw _privateConstructorUsedError;
  String get lastMSG => throw _privateConstructorUsedError;
  String get chatName => throw _privateConstructorUsedError;
  String get lastMSGDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatEntityCopyWith<ChatEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatEntityCopyWith<$Res> {
  factory $ChatEntityCopyWith(
          ChatEntity value, $Res Function(ChatEntity) then) =
      _$ChatEntityCopyWithImpl<$Res, ChatEntity>;
  @useResult
  $Res call(
      {String profile, String lastMSG, String chatName, String lastMSGDate});
}

/// @nodoc
class _$ChatEntityCopyWithImpl<$Res, $Val extends ChatEntity>
    implements $ChatEntityCopyWith<$Res> {
  _$ChatEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profile = null,
    Object? lastMSG = null,
    Object? chatName = null,
    Object? lastMSGDate = null,
  }) {
    return _then(_value.copyWith(
      profile: null == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as String,
      lastMSG: null == lastMSG
          ? _value.lastMSG
          : lastMSG // ignore: cast_nullable_to_non_nullable
              as String,
      chatName: null == chatName
          ? _value.chatName
          : chatName // ignore: cast_nullable_to_non_nullable
              as String,
      lastMSGDate: null == lastMSGDate
          ? _value.lastMSGDate
          : lastMSGDate // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ChatEntityCopyWith<$Res>
    implements $ChatEntityCopyWith<$Res> {
  factory _$$_ChatEntityCopyWith(
          _$_ChatEntity value, $Res Function(_$_ChatEntity) then) =
      __$$_ChatEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String profile, String lastMSG, String chatName, String lastMSGDate});
}

/// @nodoc
class __$$_ChatEntityCopyWithImpl<$Res>
    extends _$ChatEntityCopyWithImpl<$Res, _$_ChatEntity>
    implements _$$_ChatEntityCopyWith<$Res> {
  __$$_ChatEntityCopyWithImpl(
      _$_ChatEntity _value, $Res Function(_$_ChatEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profile = null,
    Object? lastMSG = null,
    Object? chatName = null,
    Object? lastMSGDate = null,
  }) {
    return _then(_$_ChatEntity(
      profile: null == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as String,
      lastMSG: null == lastMSG
          ? _value.lastMSG
          : lastMSG // ignore: cast_nullable_to_non_nullable
              as String,
      chatName: null == chatName
          ? _value.chatName
          : chatName // ignore: cast_nullable_to_non_nullable
              as String,
      lastMSGDate: null == lastMSGDate
          ? _value.lastMSGDate
          : lastMSGDate // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ChatEntity implements _ChatEntity {
  _$_ChatEntity(
      {required this.profile,
      required this.lastMSG,
      required this.chatName,
      required this.lastMSGDate});

  factory _$_ChatEntity.fromJson(Map<String, dynamic> json) =>
      _$$_ChatEntityFromJson(json);

  @override
  final String profile;
  @override
  final String lastMSG;
  @override
  final String chatName;
  @override
  final String lastMSGDate;

  @override
  String toString() {
    return 'ChatEntity(profile: $profile, lastMSG: $lastMSG, chatName: $chatName, lastMSGDate: $lastMSGDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChatEntity &&
            (identical(other.profile, profile) || other.profile == profile) &&
            (identical(other.lastMSG, lastMSG) || other.lastMSG == lastMSG) &&
            (identical(other.chatName, chatName) ||
                other.chatName == chatName) &&
            (identical(other.lastMSGDate, lastMSGDate) ||
                other.lastMSGDate == lastMSGDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, profile, lastMSG, chatName, lastMSGDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChatEntityCopyWith<_$_ChatEntity> get copyWith =>
      __$$_ChatEntityCopyWithImpl<_$_ChatEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChatEntityToJson(
      this,
    );
  }
}

abstract class _ChatEntity implements ChatEntity {
  factory _ChatEntity(
      {required final String profile,
      required final String lastMSG,
      required final String chatName,
      required final String lastMSGDate}) = _$_ChatEntity;

  factory _ChatEntity.fromJson(Map<String, dynamic> json) =
      _$_ChatEntity.fromJson;

  @override
  String get profile;
  @override
  String get lastMSG;
  @override
  String get chatName;
  @override
  String get lastMSGDate;
  @override
  @JsonKey(ignore: true)
  _$$_ChatEntityCopyWith<_$_ChatEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
