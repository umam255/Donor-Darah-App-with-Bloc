import 'package:donor_darah/domain/model/agenda/unit_data.dart';
import 'package:json_annotation/json_annotation.dart';
part 'unit_remote_response.g.dart';

abstract class UnitRemoteResponseMapper {
  UnitData toUnitData();
}

@JsonSerializable()
class UnitRemoteResponse implements UnitRemoteResponseMapper {
  int? id;
  String? name;
  UnitRemoteResponse({this.id, this.name});
  factory UnitRemoteResponse.fromJson(Map<String, dynamic> json) =>
      _$UnitRemoteResponseFromJson(json);
  Map<String, dynamic> toJson() => _$UnitRemoteResponseToJson(this);
  @override
  UnitData toUnitData() {
    return UnitData(
      name ?? "",
    );
  }
}
