import 'package:donor_darah/utility/auth/refresh_token/refresh_token_cubit.dart';
import 'package:donor_darah/utility/commons.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

enum AuthState {
  isLoading,
  authenticated,
  unauthenticated,
  tokenExpired,
  refreshingToken,
}

class AuthCubit extends Cubit<AuthState> {
  final RefreshTokenCubit refreshTokenCubit;

  AuthCubit(this.refreshTokenCubit) : super(AuthState.unauthenticated) {
    // BlocListener(
    //   listener: (context, refreshTokenState) {
    //     if (refreshTokenState is RefreshTokenIsSuccess) {
    //       emit(AuthState.authenticated);
    //     } else {
    //       emit(AuthState.unauthenticated);
    //     }
    //   },
    // );
    refreshTokenCubit.stream.listen((refreshTokenState) {
      if (refreshTokenState is RefreshTokenIsLoading) {
        emit(AuthState.isLoading);
      } else if (refreshTokenState is RefreshTokenIsSuccess) {
        emit(AuthState.authenticated);
      } else if (refreshTokenState is RefreshTokenIsFailed) {
        emit(AuthState.unauthenticated);
      }
    });
  }

  Future<void> checkToken() async {
    emit(AuthState.isLoading);
    final token = await Commons().getUid();

    if (validationToken(token)) {
      Map<String, dynamic> decodedToken = JwtDecoder.decode('$token');

      int timestampInSeconds = decodedToken["exp"];
      int timestampInMilliseconds = timestampInSeconds * 1000;
      DateTime expiredTime = DateTime.fromMillisecondsSinceEpoch(
        timestampInMilliseconds,
      );
      DateTime datTimeNow = DateTime.now();

      if (datTimeNow.isAfter(expiredTime)) {
        // emit(AuthState.authenticated);
        emit(AuthState.refreshingToken);
        await refreshTokenCubit.refreshToken();
      } else {
        emit(AuthState.authenticated);
        // emit(AuthState.refreshingToken);
        // await refreshTokenCubit.refreshToken();
      }
    } else {
      emit(AuthState.unauthenticated);
    }
  }

  Future<void> logOut() async {
    await Commons().removeUid();
    emit(AuthState.unauthenticated);
  }
}

validationToken(token) {
  if (token != null && token != '') {
    return true;
  } else {
    return false;
  }
}
