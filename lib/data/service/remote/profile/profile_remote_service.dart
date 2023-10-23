import 'package:donor_darah/base/base_config/base_config.dart';
import 'package:donor_darah/domain/base/authentication_headers_request.dart';
import 'package:http/http.dart';

class ProfileRemoteService {
  Client client = Client();

  Future<Response> fetchProfile(AuthenticationHeadersRequest header) async {
    final url = Uri.http(
        BaseConfig.BASE_DOMAIN, BaseConfig.BASE_PATH + BaseConfig.fetchProfile);
    print('URL PROFILE : ${url}');
    return client.get(url, headers: header.toHeader());
  }
}
