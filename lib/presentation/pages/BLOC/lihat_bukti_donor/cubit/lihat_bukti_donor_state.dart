part of 'lihat_bukti_donor_cubit.dart';

class LihatBuktiDonorState extends Equatable {
  const LihatBuktiDonorState();

  @override
  List<Object> get props => [];
}

class LihatBuktiDonorInitial extends LihatBuktiDonorState {}

class LihatBuktiDonorIsLoading extends LihatBuktiDonorState {}

class LihatBuktiDonorIsSucces extends LihatBuktiDonorState {
  final LihatBuktiDonor data;

  const LihatBuktiDonorIsSucces({required this.data});
}

// ignore: must_be_immutable
class LihatBuktiDonorIsFailed extends LihatBuktiDonorState {
  String? message;

  LihatBuktiDonorIsFailed({this.message});
}
