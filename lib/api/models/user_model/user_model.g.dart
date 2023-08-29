// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserEntity _$$_UserEntityFromJson(Map<String, dynamic> json) =>
    _$_UserEntity(
      id: json['id'] as int?,
      age: json['age'] as int?,
      invoicetype: json['invoicetype'] as int?,
      invoicepaymenttype: json['invoicepaymenttype'] as int?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      userName: json['userName'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      gender: json['gender'] as String?,
      image: json['image'] as String?,
      status: json['status'] as String?,
      country: json['country'] as String?,
      city: json['city'] as String?,
      timezone: json['timezone'] as String?,
      timezonediff: json['timezonediff'] as String?,
      paymentmethod: json['paymentmethod'] as String?,
      currency: json['currency'] as String?,
      hourrate: json['hourrate'] as int?,
      totalhour: json['totalhour'] as int?,
      apitoken: json['apitoken'] as String?,
    );

Map<String, dynamic> _$$_UserEntityToJson(_$_UserEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'age': instance.age,
      'invoicetype': instance.invoicetype,
      'invoicepaymenttype': instance.invoicepaymenttype,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'userName': instance.userName,
      'email': instance.email,
      'phone': instance.phone,
      'gender': instance.gender,
      'image': instance.image,
      'status': instance.status,
      'country': instance.country,
      'city': instance.city,
      'timezone': instance.timezone,
      'timezonediff': instance.timezonediff,
      'paymentmethod': instance.paymentmethod,
      'currency': instance.currency,
      'hourrate': instance.hourrate,
      'totalhour': instance.totalhour,
      'apitoken': instance.apitoken,
    };

_$_AuthUser _$$_AuthUserFromJson(Map<String, dynamic> json) => _$_AuthUser(
      user: json['user'] as Map<String, dynamic>?,
      accesstoken: json['access_token'] as Map<String, dynamic>,
      userEntity: json['userEntity'] == null
          ? null
          : UserEntity.fromJson(json['userEntity'] as Map<String, dynamic>),
      status: json['status'] as int,
    );

Map<String, dynamic> _$$_AuthUserToJson(_$_AuthUser instance) =>
    <String, dynamic>{
      'user': instance.user,
      'access_token': instance.accesstoken,
      'userEntity': instance.userEntity,
      'status': instance.status,
    };
