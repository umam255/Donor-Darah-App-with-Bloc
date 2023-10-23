part of 'kartu_donor_cubit.dart';

class KartuDonorState extends Equatable {
  const KartuDonorState();

  @override
  List<Object> get props => [];
}

class KartuDonorInitial extends KartuDonorState {}

class KartuDonorIsLoading extends KartuDonorState {}

class KartuDonorIsSucces extends KartuDonorState {
  final KartuDonorData data;

  const KartuDonorIsSucces({required this.data});
}

// ignore: must_be_immutable
class KartuDonorIsFailed extends KartuDonorState {
  String? message;

  KartuDonorIsFailed({this.message});
}
