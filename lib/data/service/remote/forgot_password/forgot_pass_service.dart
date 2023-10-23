import 'dart:convert';

import 'package:donor_darah/base/base_config/base_config.dart';
import 'package:http/http.dart';
import '../../../../domain/model/request/forget_password/forget_password_request.dart';

class ForgotPassService {
  Client client = Client();

  Future<Response> postForgotPass(ForgetPasswordRequest request) async {
    final url = Uri.http(
      BaseConfig.BASE_DOMAIN,
      BaseConfig.BASE_PATH + BaseConfig.FORGOT_PASS,
    );

    print("URL FORGET PASS: ${url.toString()}");

    return client.post(
      url,
      body: jsonEncode(request.toJson()),
      headers: {'Content-Type': 'application/json'},
    );
  }
}
