part of 'profile_cubit.dart';

class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

class ProfileInitial extends ProfileState {}

class ProfileIsLoading extends ProfileState {}

class ProfileIsSucces extends ProfileState {
  final ProfileData data;

  const ProfileIsSucces({required this.data});
}

// ignore: must_be_immutable
class ProfileIsFailed extends ProfileState {
  String? message;

  ProfileIsFailed({this.message});
}
