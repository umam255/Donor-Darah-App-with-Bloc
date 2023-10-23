import 'package:donor_darah/domain/base/authentication_headers_request.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:donor_darah/base/result_entity/result_entity.dart';
import '../../../../../domain/model/kartu_donor/kartu_donor_data.dart';
import '../../../../../domain/repository/kartu_donor/kartu_donor_repository.dart';
import '../../../../../utility/commons.dart';

part 'kartu_donor_state.dart';

class KartuDonorCubit extends Cubit<KartuDonorState> {
  final KartuDonorRepository repository;
  KartuDonorCubit(this.repository) : super(const KartuDonorState());

  Future<void> fetchKartuDonor() async {
    final token = await Commons().getUid();
    final response =
        await repository.fetchKartuDonor(AuthenticationHeadersRequest(token!));
    if (response is ResultSuccess) {
      emit(KartuDonorIsSucces(data: (response as ResultSuccess).data));
    } else {
      emit(KartuDonorIsFailed(message: response.toString()));
    }
  }
}
