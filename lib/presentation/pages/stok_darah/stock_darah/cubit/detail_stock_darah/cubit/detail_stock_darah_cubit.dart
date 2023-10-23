import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../../base/result_entity/result_entity.dart';
import '../../../../../../../domain/base/authentication_headers_request.dart';
import '../../../../../../../domain/model/stock_darah/detail_stock_darah.dart';
import '../../../../../../../domain/repository/stok_darah/stock_darah_repository.dart';
import '../../../../../../../utility/commons.dart';
part 'detail_stock_darah_state.dart';

class DetailStockDarahCubit extends Cubit<DetailStockDarahState> {
  final StockDarahRepository repository;

  DetailStockDarahCubit(this.repository) : super(DetailStockDarahInitial());

  Future<void> fetchDetailStock({
    required int id,
  }) async {
    emit(DetailStockDarahIsLoading());
    final token = await Commons().getUid();
    final response = await repository.fetchDetailStockDarah(
      AuthenticationHeadersRequest(token!),
      id,
    );

    if (response is ResultSuccess) {
      emit(DetailStockDarahIsSuccess(data: (response as ResultSuccess).data));
    } else {
      emit(DetailStockDarahIsError(message: (response as ResultError).message));
    }
  }
}
