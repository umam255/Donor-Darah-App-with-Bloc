import '../../../base/result_entity/result_entity.dart';
import '../../base/authentication_headers_request.dart';
import '../../model/stock_darah/detail_stock_darah.dart';
import '../../model/stock_darah/stock_darah.dart';

abstract class StockDarahRepository {
  Future<ResultEntity<List<StockDarahData>>> fetchStockDarah(
    AuthenticationHeadersRequest header,
    int unitId,
  );

  Future<ResultEntity<List<DetailStockDarahData>>> fetchDetailStockDarah(
    AuthenticationHeadersRequest header,
    int id,
  );
}
