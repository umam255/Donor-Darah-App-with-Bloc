// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'notifikasi_detail_cubit.dart';

class NotifikasiDetailState extends Equatable {
  const NotifikasiDetailState();

  @override
  List<Object> get props => [];
}

class NotifikasiDetailInitial extends NotifikasiDetailState {}

class NotifikasiDetailIsLoading extends NotifikasiDetailState {}

class NotifikasiDetailIsSuccess extends NotifikasiDetailState {
  final NotifikasiDetailData data;
  NotifikasiDetailIsSuccess({
    required this.data,
  });
}

class NotifikasiDetailIsFailed extends NotifikasiDetailState {
  final String message;
  NotifikasiDetailIsFailed({
    required this.message,
  });
}
