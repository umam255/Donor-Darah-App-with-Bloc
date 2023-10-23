part of 'change_password_cubit.dart';

abstract class ChangePasswordState extends Equatable {
  const ChangePasswordState();

  @override
  List<Object> get props => [];
}

class ChangePasswordInitial extends ChangePasswordState {}

class ChangePasswordIsLoading extends ChangePasswordState {}

class ChangePasswordIsSucces extends ChangePasswordState {
  final String? message;

  const ChangePasswordIsSucces({required this.message});
}

class ChangePasswordIsFailed extends ChangePasswordState {
  final String? message;

  const ChangePasswordIsFailed({this.message});
}
