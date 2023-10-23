// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:donor_darah/data/model/agenda_detail/unit_data_remote_response.dart';
import 'package:donor_darah/data/model/agenda_detail/user_data_remote_response.dart';
import 'package:donor_darah/domain/model/agenda_detail/agenda_detail_data.dart';
import 'package:donor_darah/domain/model/agenda_detail/agenda_detail_unit_data.dart';
import 'package:donor_darah/domain/model/agenda_detail/agenda_detail_user_data.dart';
import 'package:json_annotation/json_annotation.dart';
part 'agenda_detail_remote_response.g.dart';

abstract class AgendaDetailRemoteResponseMapper {
  AgendaDetailData toAgendaDetailData();
}

@JsonSerializable()
class AgendaDetailRemoteResponse implements AgendaDetailRemoteResponseMapper {
  int? id;
  String? code;
  String? name;
  String? date;
  String? timeStart;
  String? timeEnd;
  UnitDataRemoteResponse? unit;
  UserDataRemoteResponse? user;
  AgendaDetailRemoteResponse({
    this.id,
    this.code,
    this.name,
    this.date,
    this.timeStart,
    this.timeEnd,
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
      code ?? '',
      name ?? '',
      date ?? '',
      timeStart ?? '',
      timeEnd ?? '',
      unit?.toAgendaDetailUnitData() ?? AgendaDetailUnitData(0, ''),
      user?.toAgendaDetailUserData() ?? AgendaDetailUserData('', ''),
    );
  }
}
