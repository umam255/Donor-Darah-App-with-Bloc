import 'package:http/http.dart';
import '../../../../base/base_config/base_config.dart';
import '../../../../domain/base/authentication_headers_request.dart';

class CancelDonorService {
  Client client = Client();
  Future<Response> putCancelDonor(
      String donorRegisterId, AuthenticationHeadersRequest header) async {
    final url = Uri.http(
      BaseConfig.BASE_DOMAIN,
      BaseConfig.BASE_PATH + BaseConfig.CANCEL_DONOR + donorRegisterId,
    );
    print("URL CANCEL DONOR: ${url.toString()}");
    return client.put(
      url,
      headers: header.toHeader(),
    );
  }
}
