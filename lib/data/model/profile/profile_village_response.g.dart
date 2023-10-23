// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_village_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileVillageRemoteResponse _$ProfileVillageRemoteResponseFromJson(
        Map<String, dynamic> json) =>
    ProfileVillageRemoteResponse(
      id: json['id'] as int?,
      subDistrictId: json['subDistrictId'] as int?,
      code: json['code'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$ProfileVillageRemoteResponseToJson(
        ProfileVillageRemoteResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'subDistrictId': instance.subDistrictId,
      'code': instance.code,
      'name': instance.name,
    };
