// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agenda_detail_remote_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AgendaDetailRemoteResponse _$AgendaDetailRemoteResponseFromJson(
        Map<String, dynamic> json) =>
    AgendaDetailRemoteResponse(
      id: json['id'] as int?,
      code: json['code'] as String?,
      name: json['name'] as String?,
      date: json['date'] as String?,
      timeStart: json['timeStart'] as String?,
      timeEnd: json['timeEnd'] as String?,
      unit: json['unit'] == null
          ? null
          : UnitDataRemoteResponse.fromJson(
              json['unit'] as Map<String, dynamic>),
      user: json['user'] == null
          ? null
          : UserDataRemoteResponse.fromJson(
              json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AgendaDetailRemoteResponseToJson(
        AgendaDetailRemoteResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'date': instance.date,
      'timeStart': instance.timeStart,
      'timeEnd': instance.timeEnd,
      'unit': instance.unit,
      'user': instance.user,
    };
