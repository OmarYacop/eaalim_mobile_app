// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChatEntity _$$_ChatEntityFromJson(Map<String, dynamic> json) =>
    _$_ChatEntity(
      profile: json['profile'] as String,
      lastMSG: json['lastMSG'] as String,
      chatName: json['chatName'] as String,
      lastMSGDate: json['lastMSGDate'] as String,
    );

Map<String, dynamic> _$$_ChatEntityToJson(_$_ChatEntity instance) =>
    <String, dynamic>{
      'profile': instance.profile,
      'lastMSG': instance.lastMSG,
      'chatName': instance.chatName,
      'lastMSGDate': instance.lastMSGDate,
    };
