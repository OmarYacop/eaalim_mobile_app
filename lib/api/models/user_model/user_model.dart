import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserEntity with _$UserEntity {
  factory UserEntity({
    required int? id,
    required int? age,
    required int? invoicetype,
    required int? invoicepaymenttype,
    required String? firstName,
    required String? lastName,
    required String? userName,
    required String? email,
    required String? phone,
    required String? gender,
    required String? image,
    required String? status,
    required String? country,
    required String? city,
    required String? timezone,
    required String? timezonediff,
    required String? paymentmethod,
    required String? currency,
    required int? hourrate,
    required int? totalhour,
    required String? apitoken,
  }) = _UserEntity;

  factory UserEntity.fromJson(Map<String, dynamic> json) =>
      _$UserEntityFromJson(json);
}

@freezed
class AuthUser with _$AuthUser {
  factory AuthUser({
    @JsonKey(name: 'user') required Map<String, dynamic>? user,
    @JsonKey(name: 'access_token') required Map<String, dynamic> accesstoken,
    required UserEntity? userEntity,
    @JsonKey(name: 'status') required int status,
  }) = _AuthUser;
  factory AuthUser.fromJson(Map<String, dynamic> json) =>
      _$AuthUserFromJson(json);
}
