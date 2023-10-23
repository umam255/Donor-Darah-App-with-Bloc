part of 'detail_stock_darah_cubit.dart';

abstract class DetailStockDarahState extends Equatable {
  const DetailStockDarahState();

  @override
  List<Object> get props => [];
}

class DetailStockDarahInitial extends DetailStockDarahState {}

class DetailStockDarahIsLoading extends DetailStockDarahState {}

// ignore: must_be_immutable
class DetailStockDarahIsSuccess extends DetailStockDarahState {
  List<DetailStockDarahData>? data;
  DetailStockDarahIsSuccess({
    this.data,
  });
}

class DetailStockDarahIsError extends DetailStockDarahState {
  final String? message;
  const DetailStockDarahIsError({
    this.message,
  });
}
