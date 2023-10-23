import 'package:donor_darah/base/base_config/base_config.dart';
import 'package:donor_darah/domain/base/authentication_headers_request.dart';
import 'package:http/http.dart';

class AgendaRemoteService {
  Client client = Client();

  Future<Response> fetchAgenda(AuthenticationHeadersRequest header) async {
    final url = Uri.http(
      BaseConfig.BASE_DOMAIN,
      BaseConfig.BASE_PATH + BaseConfig.AGENDA,
    );
    print('URL AGENDA : ${url}');
    return client.get(url, headers: header.toHeader());
  }
}
