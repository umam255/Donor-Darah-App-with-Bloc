// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_remote_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JobRemoteResponse _$JobRemoteResponseFromJson(Map<String, dynamic> json) =>
    JobRemoteResponse(
      id: json['id'] as int?,
      name: json['name'] as String?,
      updatedAt: json['updatedAt'] as String?,
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$JobRemoteResponseToJson(JobRemoteResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'updatedAt': instance.updatedAt,
      'createdAt': instance.createdAt,
    };
