// ignore_for_file: override_on_non_overriding_member

import '../../../domain/model/agenda/agenda_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'agenda_remote_response.g.dart';

abstract class AgendaRemoteResponseMapper {
  AgendaData toAgendaData();
}

@JsonSerializable()
class AgendaRemoteResponse implements AgendaRemoteResponseMapper {
  int? id;
  String? date;
  String? timeStart;
  String? timeEnd;
  String? name;
  String? address;
  String? status;
  AgendaRemoteResponse({
    this.id,
    this.address,
    this.date,
    this.name,
    this.timeEnd,
    this.timeStart,
    this.status,
  });

  factory AgendaRemoteResponse.fromJson(Map<String, dynamic> json) =>
      _$AgendaRemoteResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AgendaRemoteResponseToJson(this);

  @override
  AgendaData toAgendaData() {
    return AgendaData(
      id ?? 0,
      name ?? '',
      date ?? '',
      address ?? '',
      timeEnd ?? '',
      timeStart ?? '',
      status ?? '',
    );
  }
}
