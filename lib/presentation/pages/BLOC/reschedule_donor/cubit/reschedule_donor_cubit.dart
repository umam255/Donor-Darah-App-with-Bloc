import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../../base/result_entity/result_entity.dart';
import '../../../../../domain/base/authentication_headers_request.dart';
import '../../../../../domain/repository/reschedule_donor/reschedule_donor_repository.dart';
import '../../../../../utility/commons.dart';
part 'reschedule_donor_state.dart';

class RescheduleDonorCubit extends Cubit<RescheduleDonorState> {
  final RescheduleDonorRepository repository;
  RescheduleDonorCubit(this.repository) : super(const RescheduleDonorState());

  Future<void> postReschedule(String idAgenda, int idSchedule) async {
    emit(RescheduleDonorIsLoading());
    final token = await Commons().getUid();
    final response = await repository.postReschedule(
      idAgenda,
      idSchedule,
      AuthenticationHeadersRequest(token!),
    );

    if (response is ResultSuccess) {
      emit(RescheduleDonorIsSucces(message: ''));
    } else {
      emit(RescheduleDonorIsFailed(message: (response as ResultError).message));
    }
  }
}
