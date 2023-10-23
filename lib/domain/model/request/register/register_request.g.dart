// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterRequest _$RegisterRequestFromJson(Map<String, dynamic> json) =>
    RegisterRequest(
      json['name'] as String?,
      json['placeOfBirth'] as String?,
      json['dateOfBirth'] as String?,
      json['Gender'] as String?,
      json['jobId'] as String?,
      json['unitId'] as String?,
      json['phone'] as String?,
      json['email'] as String?,
      json['address'] as String?,
      json['subDistrictId'] as String?,
      json['villageId'] as String?,
      json['postalCode'] as String?,
      json['password'] as String?,
      json['passwordConfirmation'] as String?,
    );

Map<String, dynamic> _$RegisterRequestToJson(RegisterRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'placeOfBirth': instance.placeOfBirth,
      'dateOfBirth': instance.dateOfBirth,
      'Gender': instance.Gender,
      'jobId': instance.jobId,
      'unitId': instance.unitId,
      'phone': instance.phone,
      'email': instance.email,
      'address': instance.address,
      'subDistrictId': instance.subDistrictId,
      'villageId': instance.villageId,
      'postalCode': instance.postalCode,
      'password': instance.password,
      'passwordConfirmation': instance.passwordConfirmation,
    };
