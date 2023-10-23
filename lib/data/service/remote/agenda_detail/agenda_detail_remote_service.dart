import 'package:donor_darah/base/base_config/base_config.dart';
import 'package:donor_darah/domain/base/authentication_headers_request.dart';
import 'package:http/http.dart';

class AgendaDetailRemoteService {
  Client client = Client();

  Future<Response> fetchDetailAgenda(
    AuthenticationHeadersRequest header,
    String idAgenda,
  ) async {
    final url = Uri.http(
      BaseConfig.BASE_DOMAIN,
      BaseConfig.BASE_PATH + BaseConfig.DETAIL_AGENDA + idAgenda,
    );
    print('URL DETAIL AGENDA : ${url}');
    return client.get(url, headers: header.toHeader());
  }
}
