// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_image_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UploadImageRequest _$UploadImageRequestFromJson(Map<String, dynamic> json) =>
    UploadImageRequest(
      json['file'],
      json['url'] as String,
    );

Map<String, dynamic> _$UploadImageRequestToJson(UploadImageRequest instance) =>
    <String, dynamic>{
      'file': instance.file,
      'url': instance.url,
    };
