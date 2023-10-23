// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:donor_darah/domain/model/data/unit_udd/unit_udd_data.dart';
import 'package:json_annotation/json_annotation.dart';
part "unit_udd_response.g.dart";

abstract class UnitUddDataResponseMapper {
  UnitUddData toUnitUddData();
}

@JsonSerializable()
class UnitUddDataResponse implements UnitUddDataResponseMapper {
  int? id;
  String? name;

  UnitUddDataResponse({
    this.id,
    this.name,
  });

  factory UnitUddDataResponse.fromJson(Map<String, dynamic> json) =>
      _$UnitUddDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UnitUddDataResponseToJson(this);

  @override
  UnitUddData toUnitUddData() {
    return UnitUddData(id!, name ?? "");
  }
}
