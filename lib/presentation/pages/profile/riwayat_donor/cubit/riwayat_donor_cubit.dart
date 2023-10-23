import 'package:donor_darah/base/result_entity/result_entity.dart';
import 'package:donor_darah/domain/base/authentication_headers_request.dart';
import 'package:donor_darah/utility/commons.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../domain/model/riwayat_donor/riwayat_donor_data.dart';
import '../../../../../domain/repository/riwayat_donor/riwayat_donor_repository.dart';
part 'riwayat_donor_state.dart';

class RiwayatDonorCubit extends Cubit<RiwayatDonorState> {
  final RiwayatDonorRepository repository;
  RiwayatDonorCubit(this.repository) : super(const RiwayatDonorState());

  Future<void> fetchRiwayatDonor() async {
    emit(RiwayatDonorIsLoading());
    final token = await Commons().getUid();
    final response = await repository
        .fetchRiwayatDonor(AuthenticationHeadersRequest(token!));

    if (response is ResultSuccess) {
      emit(RiwayatDonorIsSucces(data: (response as ResultSuccess).data));
    } else {
      emit(RiwayatDonorIsFailed(message: (response as ResultError).message));
    }
  }
}
