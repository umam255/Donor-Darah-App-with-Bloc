import 'package:donor_darah/base/base_config/base_config.dart';
import 'package:donor_darah/domain/base/authentication_headers_request.dart';
import 'package:http/http.dart';

class NotifikasiRemoteService {
  Client client = Client();

  Future<Response> fetchNotifikasi(AuthenticationHeadersRequest header) async {
    print('INI ERROR');

    final url = Uri.http(
      BaseConfig.BASE_DOMAIN,
      BaseConfig.BASE_PATH + BaseConfig.fetchNotifikasi,
    );
    print('URL NOTIFIKASI : ${url.toString()}');

    return client.get(url, headers: header.toHeader());
  }
}

class NotifikasiDetailRemoteService {
  Client client = Client();

  Future<Response> fetchDetailNotifikasi(
    AuthenticationHeadersRequest header,
    int id,
  ) async {
    final url = Uri.http(
      BaseConfig.BASE_DOMAIN,
      '${BaseConfig.BASE_PATH}${BaseConfig.DETAIL_NOTIFIKASI}$id',
    );
    print('URL NOTIFIKASI DETAIL: ${url.toString()}');

    return client.get(
      url,
      headers: header.toHeader(),
    );
  }
}
