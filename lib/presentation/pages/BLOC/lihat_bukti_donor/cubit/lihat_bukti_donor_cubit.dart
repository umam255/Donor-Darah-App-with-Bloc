import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../../base/result_entity/result_entity.dart';
import '../../../../../domain/base/authentication_headers_request.dart';
import '../../../../../domain/model/lihat_bukti_donor/lihat_bukti_donor.dart';
import '../../../../../domain/repository/lihat_bukti_donor/lihat_bukti_donor_repository.dart';
import '../../../../../utility/commons.dart';
part 'lihat_bukti_donor_state.dart';

class LihatBuktiDonorCubit extends Cubit<LihatBuktiDonorState> {
  final LihatBuktiDonorRepository repository;
  LihatBuktiDonorCubit(this.repository) : super(const LihatBuktiDonorState());

  Future<void> fetchLihatBuktiDonor(String idRiwayat) async {
    emit(LihatBuktiDonorIsLoading());
    final token = await Commons().getUid();
    final response = await repository.fetchLihatBuktiDonor(
      AuthenticationHeadersRequest(token!),
      idRiwayat,
    );

    if (response is ResultSuccess) {
      emit(LihatBuktiDonorIsSucces(data: (response as ResultSuccess).data));
    } else {
      emit(LihatBuktiDonorIsFailed(message: (response as ResultError).message));
    }
  }
}
