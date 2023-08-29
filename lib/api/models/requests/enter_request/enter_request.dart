import 'package:freezed_annotation/freezed_annotation.dart';

part 'enter_request.freezed.dart';
part 'enter_request.g.dart';

@freezed
class EnterRequest with _$EnterRequest {
  factory EnterRequest({
    @JsonKey(name: 'access_token') required String? token,
    @JsonKey(name: 'class_id') required String? class_id,
  }) = _EnterRequest;

  factory EnterRequest.fromJson(Map<String, dynamic> json) =>
      _$EnterRequestFromJson(json);
}
