// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';
import '../../../domain/model/stock_darah/stock_darah.dart';
part 'stock_darah_response.g.dart';

abstract class StockDarahResponseMapper {
  StockDarahData toStockDarahData();
}

@JsonSerializable()
class StockDarahResponse implements StockDarahResponseMapper {
  int? id;
  String? title;
  StockDarahResponse({
    this.id,
    this.title,
  });

  factory StockDarahResponse.fromJson(Map<String, dynamic> json) =>
      _$StockDarahResponseFromJson(json);

  Map<String, dynamic> toJson() => _$StockDarahResponseToJson(this);

  @override
  StockDarahData toStockDarahData() {
    return StockDarahData(id!, title ?? "");
  }
}
