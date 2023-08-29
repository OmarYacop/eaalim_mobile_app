import 'package:freezed_annotation/freezed_annotation.dart';

part 'cancel_request.freezed.dart';
part 'cancel_request.g.dart';

@freezed
class CancelRequest with _$CancelRequest {
  factory CancelRequest({
    @JsonKey(name: 'access_token') required String? token,
    @JsonKey(name: 'type') required String? type,
    @JsonKey(name: 'class_id') required String? class_id,
    @JsonKey(name: 'date') required String? date,
    @JsonKey(name: 'time') required String? time,
    @JsonKey(name: 'user_id') required int? user_id,
  }) = _CancelRequest;

  factory CancelRequest.fromJson(Map<String, dynamic> json) =>
      _$CancelRequestFromJson(json);
}
