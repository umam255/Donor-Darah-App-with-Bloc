import 'dart:convert';

import 'package:donor_darah/base/base_config/base_config.dart';
import 'package:donor_darah/domain/base/authentication_headers_request.dart';
import 'package:donor_darah/domain/model/request/questionaire/questionaire_request.dart';
import 'package:http/http.dart';

class QuestionaireService {
  final Client client = Client();

  Future<Response> postQuestionaire(
    AuthenticationHeadersRequest header,
    QuestionaireRequest request,
  ) async {
    final url = Uri.http(
      BaseConfig.BASE_DOMAIN,
      BaseConfig.BASE_PATH + BaseConfig.QUESTIONAIRE,
    );

    return client.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        ...header.toHeader(),
      },
      body: jsonEncode(request.toJson()),
    );
  }
}
