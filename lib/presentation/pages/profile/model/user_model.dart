// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserDataModel {
  String id;
  String urlImage;
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
  SubDistrict subDistrict;
  Village village;
  UserDataModel(
    this.id,
    this.urlImage,
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

class SubDistrict {
  int? id;
  String? code;
  String? name;
  SubDistrict({
    this.id,
    this.code,
    this.name,
  });
}

class Village {
  int? id;
  int? subDistrictId;
  String? code;
  String? name;
  Village({
    this.id,
    this.subDistrictId,
    this.code,
    this.name,
  });
}
