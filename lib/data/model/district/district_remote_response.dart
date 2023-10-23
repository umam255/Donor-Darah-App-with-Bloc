import 'package:json_annotation/json_annotation.dart';

import '../../../domain/model/district/district.dart';
part 'district_remote_response.g.dart';

abstract class DistrictRemoteResponseMapper {
  DistrictData toDistrictData();
}

@JsonSerializable()
class DistrictRemoteResponse implements DistrictRemoteResponseMapper {
  int? id;
  String? code;
  String? name;
  DistrictRemoteResponse({
    this.id,
    this.code,
    this.name,
  });

  factory DistrictRemoteResponse.fromJson(Map<String, dynamic> json) =>
      _$DistrictRemoteResponseFromJson(json);
  Map<String, dynamic> toJson() => _$DistrictRemoteResponseToJson(this);

  @override
  DistrictData toDistrictData() {
    return DistrictData(
      id ?? 0,
      code ?? '',
      name ?? '',
    );
  }
}
