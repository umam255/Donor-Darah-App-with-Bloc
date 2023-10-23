import 'package:json_annotation/json_annotation.dart';
part 'change_password_request.g.dart';

@JsonSerializable()
class ChangePasswordRequest {
  String password;
  String passwordConfirm;

  ChangePasswordRequest(this.password, this.passwordConfirm);

  factory ChangePasswordRequest.fromJson(Map<String, dynamic> json) =>
      _$ChangePasswordRequestFromJson(json);

  Map<String, dynamic> toJson() {
    return _$ChangePasswordRequestToJson(this);
  }
}
