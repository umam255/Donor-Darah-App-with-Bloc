import 'package:donor_darah/data/model/login/login_user_data_response.dart';
import 'package:donor_darah/domain/model/data/login/login_data.dart';
import 'package:donor_darah/domain/model/data/login/login_data_user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_data_response.g.dart';

abstract class LoginDataResponseMapper {
  LoginData toLoginData();
}

@JsonSerializable()
class LoginDataResponse implements LoginDataResponseMapper {
  String? token;
  LoginDataUserResponse? user;

  LoginDataResponse({this.token, this.user});

  factory LoginDataResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginDataResponseToJson(this);

  @override
  LoginData toLoginData() {
    return LoginData(
      token: token ?? '',
      user: user?.toLoginDataUser() ??
          LoginDataUser(
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
          ),
    );
  }
}
