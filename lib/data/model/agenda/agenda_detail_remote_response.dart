// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:donor_darah/data/model/agenda/unit_data_remote_response.dart';
import 'package:donor_darah/data/model/agenda/user_data_remote_response.dart';
import 'package:donor_darah/domain/model/agenda/unit_data.dart';
import 'package:donor_darah/domain/model/agenda/user_data.dart';

import '../../../domain/model/agenda/agenda_detail_data.dart';

part 'agenda_detail_remote_response.g.dart';

abstract class AgendaDetailRemoteResponseMapper {
  AgendaDetailData toAgendaDetailData();
}

@JsonSerializable()
class AgendaDetailRemoteResponse implements AgendaDetailRemoteResponseMapper {
  int? id;
  String? name;
  String? date;
  String? timeStart;
  String? timeEnd;
  String? address;
  String? code;
  UnitDataRemoteResponse? unit;
  UserDataRemoteResponse? user;
  AgendaDetailRemoteResponse({
    this.id,
    this.name,
    this.date,
    this.timeStart,
    this.timeEnd,
    this.address,
    this.code,
    this.unit,
    this.user,
  });

  factory AgendaDetailRemoteResponse.fromJson(Map<String, dynamic> json) =>
      _$AgendaDetailRemoteResponseFromJson(json);
  Map<String, dynamic> toJson() => _$AgendaDetailRemoteResponseToJson(this);

  @override
  AgendaDetailData toAgendaDetailData() {
    return AgendaDetailData(
      id ?? 0,
      name ?? '',
      date ?? '',
      address ?? '',
      timeEnd ?? '',
      timeStart ?? '',
      code ?? '',
      unit?.toUnitData() ?? UnitData(name ?? ''),
      user?.toUserData() ?? UserData(name ?? ''),
    );
  }
}
