import 'package:donor_darah/domain/model/agenda/unit_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'unit_data_remote_response.g.dart';

abstract class UnitDataRemoteResponseMapper {
  UnitData toUnitData();
}

@JsonSerializable()
class UnitDataRemoteResponse implements UnitDataRemoteResponseMapper {
  String? name;
  UnitDataRemoteResponse({this.name});

  factory UnitDataRemoteResponse.fromJson(Map<String, dynamic> json) =>
      _$UnitDataRemoteResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UnitDataRemoteResponseToJson(this);

  @override
  UnitData toUnitData() {
    return UnitData(name ?? '');
  }
}
