// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'riwayat_donor_remote_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RiwayatDonorRemoteResponse _$RiwayatDonorRemoteResponseFromJson(
        Map<String, dynamic> json) =>
    RiwayatDonorRemoteResponse(
      date: json['date'] as String?,
      donorProof: json['donorProof'] as String?,
      id: json['id'] as int?,
      name: json['name'] as String?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$RiwayatDonorRemoteResponseToJson(
        RiwayatDonorRemoteResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'date': instance.date,
      'type': instance.type,
      'donorProof': instance.donorProof,
    };
