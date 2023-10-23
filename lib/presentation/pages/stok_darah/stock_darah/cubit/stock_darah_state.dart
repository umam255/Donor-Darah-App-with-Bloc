part of 'stock_darah_cubit.dart';

abstract class StockDarahState extends Equatable {
  const StockDarahState();

  @override
  List<Object> get props => [];
}

class StockDarahInitial extends StockDarahState {}

class StockDarahIsLoading extends StockDarahState {}

// ignore: must_be_immutable
class StockDarahIsSuccess extends StockDarahState {
  List<StockDarahData>? data;
  StockDarahIsSuccess({
    this.data,
  });
}

class StockDarahIsError extends StockDarahState {
  final String? message;
  const StockDarahIsError({
    this.message,
  });
}
