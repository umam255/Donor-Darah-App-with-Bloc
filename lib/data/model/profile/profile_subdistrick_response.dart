// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:donor_darah/domain/model/profile/profile_subdistrick_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'profile_subdistrick_response.g.dart';

abstract class ProfileSubdistrictRemoteResponseMapper {
  ProfileSubDistrictData toProfileSubDistrictData();
}

@JsonSerializable()
class ProfileSubdistrictRemoteResponse
    implements ProfileSubdistrictRemoteResponseMapper {
  int? id;
  String? code;
  String? name;
  ProfileSubdistrictRemoteResponse({
    this.id,
    this.code,
    this.name,
  });

  factory ProfileSubdistrictRemoteResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ProfileSubdistrictRemoteResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ProfileSubdistrictRemoteResponseToJson(this);

  @override
  ProfileSubDistrictData toProfileSubDistrictData() {
    return ProfileSubDistrictData(
      id: id ?? 0,
      code: code ?? '',
      name: name ?? '',
    );
  }
}
