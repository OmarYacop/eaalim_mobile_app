import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'app_response.g.dart';

@JsonSerializable(explicitToJson: true, genericArgumentFactories: true)
class AppResponse<T> extends Equatable {
  /// The AppResponse data
  final T? data;

  /// StatusCode added by response status code (Not from server)
  final int statusCode;

  const AppResponse._({
    required this.statusCode,
    this.data,
  });

  factory AppResponse({
    int? statusCode,
    T? data,
  }) {
    return AppResponse._(
      statusCode: statusCode ?? 200,
      data: data,
    );
  }

  @override
  List<Object> get props {
    return [
      statusCode,
      data ?? "",
    ];
  }

  factory AppResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) {
    return _$AppResponseFromJson(json, fromJsonT);
  }

  Map<String, dynamic> toJson(
    Object? Function(T? value) toJsonT,
  ) {
    return _$AppResponseToJson(this, toJsonT);
  }

  @override
  bool get stringify => true;
}
