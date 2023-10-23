// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:donor_darah/data/model/profile/profile_subdistrick_response.dart';
import 'package:donor_darah/data/model/profile/profile_village_response.dart';
import 'package:donor_darah/domain/model/profile/profile_subdistrick_data.dart';
import 'package:donor_darah/domain/model/profile/profile_user_data.dart';
import 'package:donor_darah/domain/model/profile/profile_village_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'profile_user_remote_response.g.dart';

abstract class ProfileUserRemoteResponseMapper {
  ProfileUserData toProfileUserData();
}

@JsonSerializable()
class ProfileUserRemoteResponse implements ProfileUserRemoteResponseMapper {
  String? id;
  String? name;
  String? email;
  String? phone;
  String? jobId;
  String? unitId;
  String? placeOfBirth;
  String? dateOfBirth;
  String? gender;
  String? subDistrictId;
  String? villageId;
  String? address;
  String? postalCode;
  String? role;
  String? memberCode;
  ProfileSubdistrictRemoteResponse? subDistrict;
  ProfileVillageRemoteResponse? village;
  ProfileUserRemoteResponse({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.jobId,
    this.unitId,
    this.placeOfBirth,
    this.dateOfBirth,
    this.gender,
    this.subDistrictId,
    this.villageId,
    this.address,
    this.postalCode,
    this.role,
    this.memberCode,
    this.subDistrict,
    this.village,
  });

  factory ProfileUserRemoteResponse.fromJson(Map<String, dynamic> json) =>
      _$ProfileUserRemoteResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileUserRemoteResponseToJson(this);

  @override
  ProfileUserData toProfileUserData() {
    return ProfileUserData(
      id ?? '',
      name ?? '',
      email ?? '',
      phone ?? '',
      jobId ?? '',
      unitId ?? '',
      placeOfBirth ?? '',
      dateOfBirth ?? '',
      gender ?? '',
      subDistrictId ?? '',
      villageId ?? '',
      address ?? '',
      postalCode ?? '',
      role ?? '',
      memberCode ?? '',
      subDistrict?.toProfileSubDistrictData() ??
          ProfileSubDistrictData(
            id: 0,
            code: '',
            name: '',
          ),
      village?.toProfileVillageData() ??
          ProfileVillageData(
            id: 0,
            subDistrictId: 0,
            code: '',
            name: '',
          ),
    );
  }
}
