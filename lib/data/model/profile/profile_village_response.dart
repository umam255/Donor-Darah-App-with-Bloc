// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:donor_darah/domain/model/profile/profile_subdistrick_data.dart';
import 'package:donor_darah/domain/model/profile/profile_village_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'profile_village_response.g.dart';

abstract class ProfileVillageRemoteResponseMapper {
  ProfileVillageData toProfileVillageData();
}

@JsonSerializable()
class ProfileVillageRemoteResponse
    implements ProfileVillageRemoteResponseMapper {
  int? id;
  int? subDistrictId;
  String? code;
  String? name;
  ProfileVillageRemoteResponse({
    this.id,
    this.subDistrictId,
    this.code,
    this.name,
  });

  factory ProfileVillageRemoteResponse.fromJson(Map<String, dynamic> json) =>
      _$ProfileVillageRemoteResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileVillageRemoteResponseToJson(this);

  @override
  ProfileVillageData toProfileVillageData() {
    return ProfileVillageData(
      id: id ?? 0,
      subDistrictId: subDistrictId ?? 0,
      code: code ?? '',
      name: name ?? '',
    );
  }
}
