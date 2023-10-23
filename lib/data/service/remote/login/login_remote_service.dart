import 'dart:convert';

import 'package:donor_darah/base/base_config/base_config.dart';
import 'package:donor_darah/domain/model/request/login/login_request.dart';
import 'package:http/http.dart';

class LoginRemoteService {
  Client client = Client();

  Future<Response> postLogin(LoginRequest request) async {
    final url = Uri.http(
      BaseConfig.BASE_DOMAIN,
      BaseConfig.BASE_PATH + BaseConfig.LOGIN,
    );

    print("URL : ${url.toString()}");
    print('REQUEST : ${request.toJson()}');

    return client.post(
      url,
      body: jsonEncode(request.toJson()),
      headers: {'Content-Type': 'application/json'},
    );
  }
}
