// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agenda_remote_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AgendaRemoteResponse _$AgendaRemoteResponseFromJson(
        Map<String, dynamic> json) =>
    AgendaRemoteResponse(
      id: json['id'] as int?,
      address: json['address'] as String?,
      date: json['date'] as String?,
      name: json['name'] as String?,
      timeEnd: json['timeEnd'] as String?,
      timeStart: json['timeStart'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$AgendaRemoteResponseToJson(
        AgendaRemoteResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date,
      'timeStart': instance.timeStart,
      'timeEnd': instance.timeEnd,
      'name': instance.name,
      'address': instance.address,
      'status': instance.status,
    };
