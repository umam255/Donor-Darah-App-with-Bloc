// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:donor_darah/data/model/profile/profile_user_remote_response.dart';
import 'package:donor_darah/domain/model/profile/profile_subdistrick_data.dart';
import 'package:donor_darah/domain/model/profile/profile_user_data.dart';
import 'package:donor_darah/domain/model/profile/profile_village_data.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../domain/model/profile/profile_data.dart';

part 'profile_remote_response.g.dart';

abstract class ProfileRemoteResponseMapper {
  ProfileData toProfileData();
}

@JsonSerializable()
class ProfileRemoteResponse implements ProfileRemoteResponseMapper {
  int? id;
  String? memberCode;
  String? name;
  String? urlImage;
  int? totalDonor;
  String? lastDonor;
  String? nextDonor;
  ProfileUserRemoteResponse? user;
  ProfileRemoteResponse({
    this.id,
    this.memberCode,
    this.name,
    this.urlImage,
    this.totalDonor,
    this.lastDonor,
    this.nextDonor,
    this.user,
  });

  factory ProfileRemoteResponse.fromJson(Map<String, dynamic> json) =>
      _$ProfileRemoteResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileRemoteResponseToJson(this);

  @override
  ProfileData toProfileData() {
    return ProfileData(
      id ?? 0,
      memberCode ?? '',
      name ?? '',
      urlImage ?? '',
      totalDonor ?? 0,
      lastDonor ?? '',
      nextDonor ?? '',
      user?.toProfileUserData() ??
          ProfileUserData(
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            ProfileSubDistrictData(id: 0, code: '', name: ''),
            ProfileVillageData(id: 0, subDistrictId: 0, code: '', name: ''),
          ),
    );
  }
}
