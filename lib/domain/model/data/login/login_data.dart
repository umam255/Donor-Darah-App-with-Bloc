// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:donor_darah/domain/model/data/login/login_data_user.dart';

class LoginData {
  String? token;
  LoginDataUser? user;

  LoginData({this.token, this.user});
}
