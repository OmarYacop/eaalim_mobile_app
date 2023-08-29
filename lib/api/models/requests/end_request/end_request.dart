import 'package:freezed_annotation/freezed_annotation.dart';

part 'end_request.freezed.dart';
part 'end_request.g.dart';

@freezed
class EndRequest with _$EndRequest {
  factory EndRequest({
    @JsonKey(name: 'access_token') required String? token,
    @JsonKey(name: 'class_id') required int? class_id,
    @JsonKey(name: 'homework') required String? homework,
    @JsonKey(name: 'summary') required String? summary,
    @JsonKey(name: 'notes') required String? notes,
    @JsonKey(name: 'images') required List<String>? images,
  }) = _EndRequest;

  factory EndRequest.fromJson(Map<String, dynamic> json) =>
      _$EndRequestFromJson(json);
}
