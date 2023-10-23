// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScheduleDataResponse _$ScheduleDataResponseFromJson(
        Map<String, dynamic> json) =>
    ScheduleDataResponse(
      id: json['id'] as int?,
      name: json['name'] as String?,
      address: json['address'] as String?,
      timeStart: json['timeStart'] as String?,
      timeEnd: json['timeEnd'] as String?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$ScheduleDataResponseToJson(
        ScheduleDataResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'timeStart': instance.timeStart,
      'timeEnd': instance.timeEnd,
      'type': instance.type,
    };
