import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../base/result_entity/result_entity.dart';
import '../../../../../domain/base/authentication_headers_request.dart';
import '../../../../../domain/model/stock_darah/stock_darah.dart';
import '../../../../../domain/repository/stok_darah/stock_darah_repository.dart';
import '../../../../../utility/commons.dart';
part 'stock_darah_state.dart';

class StockDarahCubit extends Cubit<StockDarahState> {
  final StockDarahRepository repository;

  StockDarahCubit(this.repository) : super(StockDarahInitial());

  Future<void> fetchStockDarah({
    required int unitId,
  }) async {
    emit(StockDarahIsLoading());
    final token = await Commons().getUid();
    final response = await repository.fetchStockDarah(
      AuthenticationHeadersRequest(token!),
      unitId,
    );

    if (response is ResultSuccess) {
      emit(StockDarahIsSuccess(data: (response as ResultSuccess).data));
    } else {
      emit(StockDarahIsError(message: (response as ResultError).message));
    }
  }
}
