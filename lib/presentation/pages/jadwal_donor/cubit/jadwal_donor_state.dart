// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'jadwal_donor_cubit.dart';

abstract class JadwalDonorState extends Equatable {
  const JadwalDonorState();

  @override
  List<Object> get props => [];
}

class JadwalDonorInitial extends JadwalDonorState {}

class JadwalDonorIsLoading extends JadwalDonorState {}

// ignore: must_be_immutable
class JadwalDonorIsSuccess extends JadwalDonorState {
  List<ScheduleData>? data;
  JadwalDonorIsSuccess({
    this.data,
  });
}

class JadwalDonorIsError extends JadwalDonorState {
  final String? message;
  const JadwalDonorIsError({
    this.message,
  });
}
