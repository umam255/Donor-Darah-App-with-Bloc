// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'refresh_token_cubit.dart';

class RefreshTokenState extends Equatable {
  const RefreshTokenState();

  @override
  List<Object> get props => [];
}

class RefreshTokenInitial extends RefreshTokenState {}

class RefreshTokenIsLoading extends RefreshTokenState {}

class RefreshTokenIsSuccess extends RefreshTokenState {
  final RefreshTokenData data;

  RefreshTokenIsSuccess({
    required this.data,
  });
}

class RefreshTokenIsFailed extends RefreshTokenState {
  final String message;
  RefreshTokenIsFailed({
    required this.message,
  });
}
