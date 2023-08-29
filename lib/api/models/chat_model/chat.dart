
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat.freezed.dart';
part 'chat.g.dart';

@freezed
class ChatEntity with _$ChatEntity {
  factory ChatEntity({
    required String profile,
    required String lastMSG,
    required String chatName,
    required String lastMSGDate,
  }) = _ChatEntity;
	
  factory ChatEntity.fromJson(Map<String, dynamic> json) =>
			_$ChatEntityFromJson(json);
}
