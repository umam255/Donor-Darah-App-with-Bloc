// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kartu_donor_remote_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KartuDonorRemoteResponse _$KartuDonorRemoteResponseFromJson(
        Map<String, dynamic> json) =>
    KartuDonorRemoteResponse(
      id: json['id'] as int?,
      name: json['name'] as String?,
      memberCode: json['memberCode'] as String?,
      dateOfBirth: json['dateOfBirth'] as String?,
    );

Map<String, dynamic> _$KartuDonorRemoteResponseToJson(
        KartuDonorRemoteResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'memberCode': instance.memberCode,
      'dateOfBirth': instance.dateOfBirth,
    };
