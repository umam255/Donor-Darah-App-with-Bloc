// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notifikasi_detail_remote_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotifikasiDetailRemoteResponse _$NotifikasiDetailRemoteResponseFromJson(
        Map<String, dynamic> json) =>
    NotifikasiDetailRemoteResponse(
      id: json['id'] as int?,
      desc: json['desc'] as String?,
      status: json['status'] as String?,
      title: json['title'] as String?,
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$NotifikasiDetailRemoteResponseToJson(
        NotifikasiDetailRemoteResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'desc': instance.desc,
      'status': instance.status,
      'title': instance.title,
      'createdAt': instance.createdAt,
    };
