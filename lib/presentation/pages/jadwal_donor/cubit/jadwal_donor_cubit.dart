import 'package:bloc/bloc.dart';
import 'package:donor_darah/base/result_entity/result_entity.dart';
import 'package:donor_darah/domain/base/authentication_headers_request.dart';
import 'package:donor_darah/domain/model/data/jadwal_donor/schedule_data.dart';
import 'package:donor_darah/domain/repository/jadwal_donor/jadwal_donor_repository.dart';
import 'package:donor_darah/utility/commons.dart';
import 'package:equatable/equatable.dart';
part 'jadwal_donor_state.dart';

class JadwalDonorCubit extends Cubit<JadwalDonorState> {
  final JadwalDonorRepository repository;

  JadwalDonorCubit(this.repository) : super(JadwalDonorInitial());

  Future<void> fetchSchedule({
    required int unitId,
  }) async {
    emit(JadwalDonorIsLoading());

    final token = await Commons().getUid();

    final response = await repository.fetchSchedule(
      AuthenticationHeadersRequest(token!),
      unitId,
    );

    if (response is ResultSuccess) {
      emit(JadwalDonorIsSuccess(data: (response as ResultSuccess).data));
    } else {
      emit(JadwalDonorIsError(message: (response as ResultError).message));
    }
  }
}
