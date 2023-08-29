import 'package:freezed_annotation/freezed_annotation.dart';

part 'absent_request.freezed.dart';
part 'absent_request.g.dart';

@freezed
class AbsentRequest with _$AbsentRequest {
  factory AbsentRequest({
    @JsonKey(name: 'access_token') required String? token,
    @JsonKey(name: 'class_id') required String? class_id,
    @JsonKey(name: 'note') required String? note,
    @JsonKey(name: 'video') required String? video,
  }) = _AbsentRequest;

  factory AbsentRequest.fromJson(Map<String, dynamic> json) =>
      _$AbsentRequestFromJson(json);
}
