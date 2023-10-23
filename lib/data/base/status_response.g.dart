// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'status_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StatusResponse _$StatusResponseFromJson(Map<String, dynamic> json) =>
    StatusResponse(
      code: json['Code'] as int?,
      message: json['Message'] as String?,
    );

Map<String, dynamic> _$StatusResponseToJson(StatusResponse instance) =>
    <String, dynamic>{
      'Code': instance.code,
      'Message': instance.message,
    };
