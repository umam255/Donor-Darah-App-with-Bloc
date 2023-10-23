import 'dart:convert';

import 'package:donor_darah/base/base_config/base_config.dart';
import 'package:http/http.dart';

import '../../../../domain/model/request/register/register_request.dart';

class RegisterRemoteService {
  Client client = Client();

  Future<Response> postRegister(RegisterRequest request) async {
    final url = Uri.http(BaseConfig.BASE_DOMAIN,
        BaseConfig.BASE_PATH + BaseConfig.fetchRegister);

    print("URL REGISTER: ${url}");
    print("DATA REGISTER: ${jsonEncode(request.toJson())}");

    return client.post(
      url,
      body: jsonEncode(request.toJson()),
      headers: {'Content-Type': 'application/json'},
    );
  }
}
