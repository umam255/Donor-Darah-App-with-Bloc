// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_remote_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileRemoteResponse _$ProfileRemoteResponseFromJson(
        Map<String, dynamic> json) =>
    ProfileRemoteResponse(
      id: json['id'] as int?,
      memberCode: json['memberCode'] as String?,
      name: json['name'] as String?,
      urlImage: json['urlImage'] as String?,
      totalDonor: json['totalDonor'] as int?,
      lastDonor: json['lastDonor'] as String?,
      nextDonor: json['nextDonor'] as String?,
      user: json['user'] == null
          ? null
          : ProfileUserRemoteResponse.fromJson(
              json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProfileRemoteResponseToJson(
        ProfileRemoteResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'memberCode': instance.memberCode,
      'name': instance.name,
      'urlImage': instance.urlImage,
      'totalDonor': instance.totalDonor,
      'lastDonor': instance.lastDonor,
      'nextDonor': instance.nextDonor,
      'user': instance.user,
    };
