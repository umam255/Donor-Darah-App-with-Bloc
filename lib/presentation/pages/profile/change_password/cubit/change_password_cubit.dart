// ignore_for_file: unused_local_variable

import 'package:donor_darah/base/result_entity/result_entity.dart';
import 'package:donor_darah/domain/base/authentication_headers_request.dart';
import 'package:donor_darah/domain/model/request/change_password/change_password_request.dart';
import 'package:donor_darah/domain/repository/change_password/change_password_repository.dart';
import 'package:donor_darah/utility/commons.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  final ChangePasswordRepository repository;

  ChangePasswordCubit(this.repository) : super(ChangePasswordInitial());

  Future<void> onSubmitChangePassword(ChangePasswordRequest request) async {
    emit(ChangePasswordIsLoading());

    final token = await Commons().getUid();
    print('token : ${token}');
    final response = await repository.postChangePassword(
      AuthenticationHeadersRequest(token!),
      request,
    );

    if (response is ResultSuccess) {
      Commons().removeUid();
      emit(const ChangePasswordIsSucces(message: ''));
    } else {
      emit(const ChangePasswordIsFailed(message: ''));
    }
  }
}
