import 'package:donor_darah/base/base_config/base_config.dart';
import 'package:donor_darah/domain/base/authentication_headers_request.dart';
import 'package:http/http.dart';

class StockDarahService {
  Client client = Client();
  Future<Response> fetchStockDarah(
    AuthenticationHeadersRequest header,
    int unitId,
  ) async {
    final url = Uri.http(
      BaseConfig.BASE_DOMAIN,
      BaseConfig.BASE_PATH + '${BaseConfig.fetchStockDarah}$unitId',
      // +
      // '${unitId}',
    );
    print('URL STOCK DARAH : ${url}');
    return client.get(url, headers: header.toHeader());
  }

  Future<Response> fetchDetailStockDarah(
      AuthenticationHeadersRequest header, int id) async {
    final url = Uri.http(BaseConfig.BASE_DOMAIN,
        BaseConfig.BASE_PATH + '${BaseConfig.fetchDetailStockDarah}$id');
    print('URL DETAIL STOCK DARAH : ${url}');
    return client.get(url, headers: header.toHeader());
  }
}
