// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info_berita_pagination.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InfoBeritaPaginationResponse _$InfoBeritaPaginationResponseFromJson(
        Map<String, dynamic> json) =>
    InfoBeritaPaginationResponse(
      totalData: json['totalData'] as int?,
      totalPage: json['totalPage'] as int?,
      limit: json['limit'] as int?,
      currentPage: json['currentPage'] as int?,
    );

Map<String, dynamic> _$InfoBeritaPaginationResponseToJson(
        InfoBeritaPaginationResponse instance) =>
    <String, dynamic>{
      'totalData': instance.totalData,
      'totalPage': instance.totalPage,
      'limit': instance.limit,
      'currentPage': instance.currentPage,
    };
