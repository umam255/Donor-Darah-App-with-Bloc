// ignore_for_file: non_constant_identifier_names

import 'package:donor_darah/base/base_config/base_config.dart';
import 'package:donor_darah/domain/base/authentication_headers_request.dart';
import 'package:http/http.dart';

class KartuDonorRemoteService {
  Client client = Client();

  Future<Response> fetchKartuDonor(AuthenticationHeadersRequest header) async {
    final url = Uri.http(BaseConfig.BASE_DOMAIN,
        BaseConfig.BASE_PATH + BaseConfig.fetchKartuDonor);
    print('URL KARTU DONOR : ${url}');
    return client.get(url, headers: header.toHeader());
  }
}
