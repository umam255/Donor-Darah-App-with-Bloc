// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_collection_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScheduleCollectionResponse _$ScheduleCollectionResponseFromJson(
        Map<String, dynamic> json) =>
    ScheduleCollectionResponse(
      date: json['date'] as String?,
      schedule: (json['schedule'] as List<dynamic>?)
          ?.map((e) => ScheduleDataResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ScheduleCollectionResponseToJson(
        ScheduleCollectionResponse instance) =>
    <String, dynamic>{
      'date': instance.date,
      'schedule': instance.schedule,
    };
