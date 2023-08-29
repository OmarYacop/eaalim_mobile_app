import 'package:freezed_annotation/freezed_annotation.dart';

part 'refresh_request.freezed.dart';
part 'refresh_request.g.dart';

@freezed
class RefreshRequest with _$RefreshRequest {
  factory RefreshRequest({
    @JsonKey(name: 'access_token') required String? token,
  }) = _RefreshRequest;

  factory RefreshRequest.fromJson(Map<String, dynamic> json) =>
      _$RefreshRequestFromJson(json);
}
