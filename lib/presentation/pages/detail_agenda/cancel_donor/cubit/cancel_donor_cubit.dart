import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../base/result_entity/result_entity.dart';
import '../../../../../domain/base/authentication_headers_request.dart';
import '../../../../../domain/repository/cancel_donor/cancel_donor_repository.dart';
import '../../../../../utility/commons.dart';
part 'cancel_donor_state.dart';

class CancelDonorCubit extends Cubit<CancelDonorState> {
  final CancelDonorRepository repository;
  CancelDonorCubit(this.repository) : super(const CancelDonorState());

  Future<void> putCancelDonor(String donorRegisterId) async {
    emit(CancelDonorIsLoading());
    final token = await Commons().getUid();
    final response = await repository.putCancelDonor(
      donorRegisterId,
      AuthenticationHeadersRequest(token!),
    );
    if (response is ResultSuccess) {
      emit(CancelDonorIsSucces(message: ''));
    } else {
      emit(CancelDonorIsFailed(message: ''));
    }
  }
}
