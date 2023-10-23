import 'package:http/http.dart';

import '../../../../base/base_config/base_config.dart';
import '../../../../domain/base/authentication_headers_request.dart';

class LihatBuktiDonorService {
  Client client = Client();
  Future<Response> fetchLihatBuktiDonor(
      AuthenticationHeadersRequest header, String idRiwayat) async {
    final url = Uri.http(
      BaseConfig.BASE_DOMAIN,
      BaseConfig.BASE_PATH + BaseConfig.LIHAT_BUKTI_DONOR + idRiwayat,
    );
    print("URL : ${url.toString()}");
    return client.get(url, headers: header.toHeader());
  }
}
