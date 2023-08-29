
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sessions_request.freezed.dart';
part 'sessions_request.g.dart';

@freezed
class SessionsRequest with _$SessionsRequest {
  factory SessionsRequest({
    @JsonKey(name: 'access_token') required String? token,
  }) = _SessionsRequest;
	
  factory SessionsRequest.fromJson(Map<String, dynamic> json) =>
			_$SessionsRequestFromJson(json);
}
