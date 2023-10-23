import 'dart:convert';

import 'package:donor_darah/base/result_entity/result_entity.dart';
import 'package:donor_darah/data/model/stock_darah/stock_darah_response.dart';
import 'package:donor_darah/data/service/remote/stock_darah/stock_darah_service.dart';
import 'package:donor_darah/domain/model/stock_darah/stock_darah.dart';
import 'package:donor_darah/domain/repository/stok_darah/stock_darah_repository.dart';
import '../../../domain/base/authentication_headers_request.dart';
import '../../../domain/model/stock_darah/detail_stock_darah.dart';
import '../../base/base_remote_response.dart';
import '../../model/stock_darah/detail_stock_darah_response.dart';

class StockDarahRepositoryImpl implements StockDarahRepository {
  final stockDarahService = StockDarahService();
  @override
  Future<ResultEntity<List<StockDarahData>>> fetchStockDarah(
      AuthenticationHeadersRequest header, int unitId) async {
    try {
      final response = await stockDarahService.fetchStockDarah(header, unitId);

      print("STATUS CODE STOCK DARAH :${response.statusCode} ");
      if (response.statusCode == 200) {
        BaseRemoteResponse<List<StockDarahResponse>> baseResponse =
            BaseRemoteResponse<List<StockDarahResponse>>.fromJson(
          jsonDecode(response.body),
          (json) => (json as List)
              .map(
                (e) => StockDarahResponse.fromJson(e as Map<String, dynamic>),
              )
              .toList(),
        );

        StockDarahResponse.fromJson(jsonDecode(response.body));

        if (baseResponse.status == null) {
          return ResultError();
        } else if (baseResponse.status?.code != 0) {
          return ResultError(message: baseResponse.status?.message);
        } else if (baseResponse.data == null) {
          return ResultError(message: baseResponse.status?.message);
        } else {
          return ResultSuccess(
            baseResponse.data!.map((e) => e.toStockDarahData()).toList(),
          );
        }
      } else {
        print("error : ${response.body}");
        return ResultError(message: response.body);
      }
    } catch (e) {
      print("error : ${e}");
      return ResultError(message: e.toString());
    }
  }

  @override
  Future<ResultEntity<List<DetailStockDarahData>>> fetchDetailStockDarah(
      AuthenticationHeadersRequest header, int Id) async {
    try {
      final response =
          await stockDarahService.fetchDetailStockDarah(header, Id);

      print("STATUS CODE DETAIL STOCK DARAH :${response.statusCode} ");
      if (response.statusCode == 200) {
        BaseRemoteResponse<List<DetailStockDarahResponse>> baseResponse =
            BaseRemoteResponse<List<DetailStockDarahResponse>>.fromJson(
          jsonDecode(response.body),
          (json) => (json as List)
              .map(
                (e) => DetailStockDarahResponse.fromJson(
                    e as Map<String, dynamic>),
              )
              .toList(),
        );

        DetailStockDarahResponse.fromJson(jsonDecode(response.body));

        if (baseResponse.status == null) {
          return ResultError();
        } else if (baseResponse.status?.code != 0) {
          return ResultError(message: baseResponse.status?.message);
        } else if (baseResponse.data == null) {
          return ResultError(message: baseResponse.status?.message);
        } else {
          return ResultSuccess(
            baseResponse.data!.map((e) => e.toDetailStockDarahData()).toList(),
          );
        }
      } else {
        print("error detail stock darah : ${response.body}");
        return ResultError(message: response.body);
      }
    } catch (e) {
      print("error detail stock darah: ${e}");
      return ResultError(message: e.toString());
    }
  }
}
