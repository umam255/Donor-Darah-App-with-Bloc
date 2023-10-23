// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'register_request.g.dart';

@JsonSerializable()
class RegisterRequest {
  String? name;
  String? placeOfBirth;
  String? dateOfBirth;
  String? Gender;
  String? jobId;
  String? unitId;
  String? phone;
  String? email;
  String? address;
  String? subDistrictId;
  String? villageId;
  String? postalCode;
  String? password;
  String? passwordConfirmation;
  RegisterRequest(
    this.name,
    this.placeOfBirth,
    this.dateOfBirth,
    this.Gender,
    this.jobId,
    this.unitId,
    this.phone,
    this.email,
    this.address,
    this.subDistrictId,
    this.villageId,
    this.postalCode,
    this.password,
    this.passwordConfirmation,
  );

  factory RegisterRequest.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestFromJson(json);

  Map<String, dynamic> toJson() {
    return _$RegisterRequestToJson(this);
  }
}
