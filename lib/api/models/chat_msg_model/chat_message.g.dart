// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChatMessageEntity _$$_ChatMessageEntityFromJson(Map<String, dynamic> json) =>
    _$_ChatMessageEntity(
      message: json['message'] as String?,
      url: json['url'] as String?,
      sender: json['sender'] as String?,
    );

Map<String, dynamic> _$$_ChatMessageEntityToJson(
        _$_ChatMessageEntity instance) =>
    <String, dynamic>{
      'message': instance.message,
      'url': instance.url,
      'sender': instance.sender,
    };
