// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'forgot_pass_cubit.dart';

abstract class ForgotPassState extends Equatable {
  const ForgotPassState();

  @override
  List<Object> get props => [];
}

class ForgotPassInitial extends ForgotPassState {}

class ForgotPassIsLoading extends ForgotPassState {}

// ignore: must_be_immutable
class ForgotPassIsSuccess extends ForgotPassState {
  String message;

  ForgotPassIsSuccess({required this.message});
}

// ignore: must_be_immutable
class ForgotPassIsError extends ForgotPassState {
  String? message;

  ForgotPassIsError({
    this.message,
  });
}
