import 'package:bloc/bloc.dart';
import 'package:donor_darah/base/result_entity/result_entity.dart';
import 'package:donor_darah/domain/model/request/register/register_request.dart';
import 'package:donor_darah/domain/repository/register/register_repository.dart';
import 'package:equatable/equatable.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterRepository repository;
  RegisterCubit(this.repository) : super(RegisterInitial());

  Future<void> postRegister(RegisterRequest request) async {
    emit(RegisterIsLoading());
    final response = await repository.postRegister(request);

    if (response is ResultSuccess) {
      emit(
        RegisterIsSuccess(message: 'Registrasi Akun Berhsil'),
      );
    } else {
      emit(RegisterIsError(message: (response as ResultError).message));
    }
  }
}
