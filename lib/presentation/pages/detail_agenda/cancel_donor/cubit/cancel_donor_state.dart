// ignore_for_file: must_be_immutable

part of 'cancel_donor_cubit.dart';

class CancelDonorState extends Equatable {
  const CancelDonorState();

  @override
  List<Object> get props => [];
}

class CancelDonorInitial extends CancelDonorState {}

class CancelDonorIsLoading extends CancelDonorState {}

class CancelDonorIsSucces extends CancelDonorState {
  String? message;
  CancelDonorIsSucces({required this.message});
}

class CancelDonorIsFailed extends CancelDonorState {
  String? message;
  CancelDonorIsFailed({this.message});
}
