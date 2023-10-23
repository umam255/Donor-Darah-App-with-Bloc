// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
part of 'job_cubit.dart';

class JobState extends Equatable {
  const JobState();

  @override
  List<Object> get props => [];
}

class JobInitial extends JobState {}

class JobIsLoading extends JobState {}

class JobIsLoaded extends JobState {}

class JobIsSucces extends JobState {
  List<JobData>? data;

  JobIsSucces({
    this.data,
  });
}

class JobIsFailed extends JobState {
  String? message;

  JobIsFailed({this.message});
}
