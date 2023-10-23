// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'register_cubit.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

class RegisterInitial extends RegisterState {}

class RegisterIsLoading extends RegisterState {}

class RegisterIsSuccess extends RegisterState {
  String? message;
  RegisterIsSuccess({
    required this.message,
  });
}

class RegisterIsError extends RegisterState {
  String? message;
  RegisterIsError({
    this.message,
  });
}
