// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info_berita_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InfoBeritaRemoteResponse _$InfoBeritaRemoteResponseFromJson(
        Map<String, dynamic> json) =>
    InfoBeritaRemoteResponse(
      uuid: json['uuid'] as String?,
      title: json['title'] as String?,
      image: json['image'] as String?,
      createdAt: json['createdAt'] as String?,
      Pagination: json['Pagination'] == null
          ? null
          : InfoBeritaPaginationResponse.fromJson(
              json['Pagination'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$InfoBeritaRemoteResponseToJson(
        InfoBeritaRemoteResponse instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'title': instance.title,
      'image': instance.image,
      'createdAt': instance.createdAt,
      'Pagination': instance.Pagination,
    };
