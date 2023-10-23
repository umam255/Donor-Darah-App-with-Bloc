// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
part of 'reschedule_donor_cubit.dart';

class RescheduleDonorState extends Equatable {
  const RescheduleDonorState();

  @override
  List<Object> get props => [];
}

class RescheduleDonorInitial extends RescheduleDonorState {}

class RescheduleDonorIsLoading extends RescheduleDonorState {}

class RescheduleDonorIsLoaded extends RescheduleDonorState {}

class RescheduleDonorIsSucces extends RescheduleDonorState {
  String? message;
  RescheduleDonorIsSucces({
    this.message,
  });
}

class RescheduleDonorIsFailed extends RescheduleDonorState {
  String? message;

  RescheduleDonorIsFailed({this.message});
}
