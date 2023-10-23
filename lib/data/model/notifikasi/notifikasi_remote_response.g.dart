// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notifikasi_remote_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotifikasiRemoteResponse _$NotifikasiRemoteResponseFromJson(
        Map<String, dynamic> json) =>
    NotifikasiRemoteResponse(
      id: json['id'] as int?,
      desc: json['desc'] as String?,
      status: json['status'] as String?,
      title: json['title'] as String?,
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$NotifikasiRemoteResponseToJson(
        NotifikasiRemoteResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'desc': instance.desc,
      'status': instance.status,
      'title': instance.title,
      'createdAt': instance.createdAt,
    };
