import 'package:json_annotation/json_annotation.dart';
part 'login_request.g.dart';

@JsonSerializable()
class LoginRequest {
  String phone;
  String password;

  LoginRequest(
    this.phone,
    this.password,
  );

  factory LoginRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestFromJson(json);

  Map<String, dynamic> toJson() {
    return _$LoginRequestToJson(this);
  }
}
