// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'package:json_annotation/json_annotation.dart';

import '../../../domain/model/stock_darah/detail_stock_darah.dart';

part 'detail_stock_darah_response.g.dart';

abstract class DetailStockDarahResponseMapper {
  DetailStockDarahData toDetailStockDarahData();
}

@JsonSerializable()
class DetailStockDarahResponse implements DetailStockDarahResponseMapper {
  int? Id;
  String? Title;
  int? Stock;
  DetailStockDarahResponse({
    this.Id,
    this.Title,
    this.Stock,
  });

  factory DetailStockDarahResponse.fromJson(Map<String, dynamic> json) =>
      _$DetailStockDarahResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DetailStockDarahResponseToJson(this);

  @override
  DetailStockDarahData toDetailStockDarahData() {
    return DetailStockDarahData(Id ?? 0, Title ?? '', Stock ?? 0);
  }
}
