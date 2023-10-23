import 'dart:convert';

import 'package:donor_darah/base/base_config/base_config.dart';
import 'package:donor_darah/domain/base/authentication_headers_request.dart';
import 'package:donor_darah/domain/model/request/change_password/change_password_request.dart';
import 'package:http/http.dart';

class ChangePasswordService {
  Client client = Client();
  Future<Response> postChangePassword(AuthenticationHeadersRequest header,
      ChangePasswordRequest request) async {
    final url = Uri.http(
      BaseConfig.BASE_DOMAIN,
      BaseConfig.BASE_PATH + BaseConfig.fetchChangePassword,
    );
    print("URL : ${url.toString()}");
    var bodyRequest = jsonEncode(request.toJson());
    return client.post(
      url,
      body: bodyRequest,
      headers: {
        'Content-Type': 'application/json',
        ...header.toHeader(),
      },
    );
  }
}
