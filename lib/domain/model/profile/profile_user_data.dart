// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:donor_darah/domain/model/profile/profile_subdistrick_data.dart';
import 'package:donor_darah/domain/model/profile/profile_village_data.dart';

class ProfileUserData {
  String id;
  String name;
  String email;
  String phone;
  String jobId;
  String unitId;
  String placeOfBirth;
  String dateOfBirth;
  String gender;
  String subDistrictId;
  String villageId;
  String address;
  String postalCode;
  String role;
  String memberCode;
  ProfileSubDistrictData subDistrict;
  ProfileVillageData village;
  ProfileUserData(
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
  );
}
