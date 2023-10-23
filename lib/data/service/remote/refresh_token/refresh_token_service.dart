import 'package:donor_darah/base/base_config/base_config.dart';
import 'package:donor_darah/domain/base/authentication_headers_request.dart';
import 'package:http/http.dart';

class RefreshTokenRemoteService {
  Client client = Client();

  Future<Response> postRefrehToken(AuthenticationHeadersRequest header) async {
    final url = Uri.http(
      BaseConfig.BASE_DOMAIN,
      BaseConfig.BASE_PATH + BaseConfig.TOKEN_REFRESH,
    );
    print('URL REFRESH TOKEN : ${url}');
    return client.post(url, headers: header.toHeader());
  }
}
