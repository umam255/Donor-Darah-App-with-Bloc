// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'update_profile_cubit.dart';

class UpdateProfileState extends Equatable {
  const UpdateProfileState();

  @override
  List<Object> get props => [];
}

class UpdateProfileInitial extends UpdateProfileState {}

class UpdateProfileIsLoading extends UpdateProfileState {}

class UpdateProfileIsLoaded extends UpdateProfileState {}

class UpdateProfileIsSucces extends UpdateProfileState {
  final String? message;

  UpdateProfileIsSucces({
    this.message,
  });
}

// ignore: must_be_immutable
class UpdateProfileIsFailed extends UpdateProfileState {
  String? message;

  UpdateProfileIsFailed({this.message});
}
