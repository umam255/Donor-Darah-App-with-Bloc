import 'package:donor_darah/base/base_config/base_config.dart';
import 'package:donor_darah/domain/base/authentication_headers_request.dart';
import 'package:http/http.dart';

class RiwayatDonorRemoteService {
  Client client = Client();

  Future<Response> fetchRiwayatDonor(
    AuthenticationHeadersRequest header,
  ) async {
    final url = Uri.http(
      BaseConfig.BASE_DOMAIN,
      BaseConfig.BASE_PATH + BaseConfig.RIWAYAT,
    );
    print('URL RIWAYAT DONOR : ${url}');
    return client.get(url, headers: header.toHeader());
  }
}
