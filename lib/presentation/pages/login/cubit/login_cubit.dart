import 'package:bloc/bloc.dart';
import 'package:donor_darah/base/result_entity/result_entity.dart';
import 'package:donor_darah/domain/model/data/login/login_data.dart';
import 'package:donor_darah/domain/model/request/login/login_request.dart';
import 'package:donor_darah/domain/repository/login/login_repository.dart';
import 'package:donor_darah/utility/commons.dart';
import 'package:equatable/equatable.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepository repository;

  LoginCubit(this.repository) : super(LoginInitial());

  Future<void> btnlogin(LoginRequest request) async {
    emit(LoginIsLoading());
    final response = await repository.submitLogin(request);
    if (response is ResultSuccess) {
      emit(
        LoginIsSuccess(data: (response as ResultSuccess).data),
      );
      final data = (state as LoginIsSuccess).data;
      Commons().setUid(data.token.toString());
    } else {
      emit(LoginIsError(message: (response as ResultError).message));
    }
  }
}
