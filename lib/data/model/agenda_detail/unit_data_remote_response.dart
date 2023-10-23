// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:donor_darah/domain/model/agenda_detail/agenda_detail_unit_data.dart';
import 'package:json_annotation/json_annotation.dart';
part 'unit_data_remote_response.g.dart';

abstract class UnitDataRemoteResponseMapper {
  AgendaDetailUnitData toAgendaDetailUnitData();
}

@JsonSerializable()
class UnitDataRemoteResponse implements UnitDataRemoteResponseMapper {
  int? id;
  String? name;
  UnitDataRemoteResponse({
    this.id,
    this.name,
  });

  factory UnitDataRemoteResponse.fromJson(Map<String, dynamic> json) =>
      _$UnitDataRemoteResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UnitDataRemoteResponseToJson(this);

  @override
  AgendaDetailUnitData toAgendaDetailUnitData() {
    return AgendaDetailUnitData(id ?? 0, name ?? '');
  }
}
