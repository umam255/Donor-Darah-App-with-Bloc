// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:donor_darah/domain/model/data/login/login_data_user.dart';
import 'package:json_annotation/json_annotation.dart';
part 'login_user_data_response.g.dart';

abstract class LoginDataUserResponseMapper {
  LoginDataUser toLoginDataUser();
}

@JsonSerializable()
class LoginDataUserResponse implements LoginDataUserResponseMapper {
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

  LoginDataUserResponse({
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
  });

  factory LoginDataUserResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginDataUserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginDataUserResponseToJson(this);

  @override
  LoginDataUser toLoginDataUser() {
    return LoginDataUser(
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
    );
  }
}
