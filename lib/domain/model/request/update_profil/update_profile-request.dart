// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

class UpdateProfileRequest {
  String name;
  String gender;
  String placeOfBirth;
  String dateOfBirth;
  String jobId;
  String unitId;
  String phone;
  String email;
  String villageId;
  String address;
  String subDistrictId;
  String postalCode;
  File? file;
  UpdateProfileRequest(
    this.name,
    this.gender,
    this.placeOfBirth,
    this.dateOfBirth,
    this.jobId,
    this.unitId,
    this.phone,
    this.email,
    this.villageId,
    this.address,
    this.subDistrictId,
    this.postalCode,
    this.file,
  );
}
