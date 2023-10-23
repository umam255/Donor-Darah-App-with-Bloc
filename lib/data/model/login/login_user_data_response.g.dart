// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_user_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginDataUserResponse _$LoginDataUserResponseFromJson(
        Map<String, dynamic> json) =>
    LoginDataUserResponse(
      id: json['id'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      jobId: json['jobId'] as String?,
      unitId: json['unitId'] as String?,
      placeOfBirth: json['placeOfBirth'] as String?,
      dateOfBirth: json['dateOfBirth'] as String?,
      gender: json['gender'] as String?,
      subDistrictId: json['subDistrictId'] as String?,
      villageId: json['villageId'] as String?,
      address: json['address'] as String?,
      postalCode: json['postalCode'] as String?,
      role: json['role'] as String?,
      memberCode: json['memberCode'] as String?,
    );

Map<String, dynamic> _$LoginDataUserResponseToJson(
        LoginDataUserResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'jobId': instance.jobId,
      'unitId': instance.unitId,
      'placeOfBirth': instance.placeOfBirth,
      'dateOfBirth': instance.dateOfBirth,
      'gender': instance.gender,
      'subDistrictId': instance.subDistrictId,
      'villageId': instance.villageId,
      'address': instance.address,
      'postalCode': instance.postalCode,
      'role': instance.role,
      'memberCode': instance.memberCode,
    };
