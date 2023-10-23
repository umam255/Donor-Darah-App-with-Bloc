// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info_berita_collection_remote_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InfoBeritaCollectionRemoteResponse _$InfoBeritaCollectionRemoteResponseFromJson(
        Map<String, dynamic> json) =>
    InfoBeritaCollectionRemoteResponse(
      status: json['status'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) =>
              InfoBeritaRemoteResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      pagination: json['pagination'] as String?,
    );

Map<String, dynamic> _$InfoBeritaCollectionRemoteResponseToJson(
        InfoBeritaCollectionRemoteResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'pagination': instance.pagination,
      'data': instance.data,
    };
