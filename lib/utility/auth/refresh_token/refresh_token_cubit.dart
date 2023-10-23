import 'package:bloc/bloc.dart';
import 'package:donor_darah/base/result_entity/result_entity.dart';
import 'package:donor_darah/domain/base/authentication_headers_request.dart';
import 'package:donor_darah/domain/model/data/refreh_token/refresh_token_data.dart';
import 'package:donor_darah/domain/repository/refresh_token/refresh_token_repository.dart';
import 'package:donor_darah/utility/commons.dart';
import 'package:equatable/equatable.dart';

part 'refresh_token_state.dart';

class RefreshTokenCubit extends Cubit<RefreshTokenState> {
  final RefreshTokenRepository repository;

  RefreshTokenCubit(this.repository) : super(RefreshTokenInitial());

  Future<void> refreshToken() async {
    emit(RefreshTokenIsLoading());
    var token = await Commons().getUid();
    final response = await repository.postRefreshToken(
      AuthenticationHeadersRequest('$token'),
    );

    if (response is ResultSuccess) {
      emit(
        RefreshTokenIsSuccess(data: (response as ResultSuccess).data),
      );
      var newToken = (state as RefreshTokenIsSuccess).data;
      print('NEW TOKEN: ${newToken.token}');
      Commons().setUid(newToken.token.toString());
    } else {
      emit(
        RefreshTokenIsFailed(
          message: (response as ResultError).message.toString(),
        ),
      );
    }
  }
}
