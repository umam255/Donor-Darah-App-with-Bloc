import 'package:bloc/bloc.dart';
import 'package:donor_darah/base/result_entity/result_entity.dart';
import 'package:donor_darah/domain/base/authentication_headers_request.dart';
import 'package:donor_darah/domain/model/Notifikasi/notifikasi_detail_data.dart';
import 'package:donor_darah/domain/repository/notifikasi/notifikasi_repository.dart';
import 'package:donor_darah/utility/commons.dart';
import 'package:equatable/equatable.dart';

part 'notifikasi_detail_state.dart';

class NotifikasiDetailCubit extends Cubit<NotifikasiDetailState> {
  final NotifikasiDetailRepository repository;
  NotifikasiDetailCubit(this.repository) : super(NotifikasiDetailInitial());

  Future<void> fetchDetailNotifikasi(int id) async {
    final token = await Commons().getUid();
    final response = await repository.fetchDetailNotifikasi(
      AuthenticationHeadersRequest('$token'),
      id,
    );
    if (response is ResultSuccess) {
      emit(NotifikasiDetailIsSuccess(data: (response as ResultSuccess).data));
    } else {
      emit(
        NotifikasiDetailIsFailed(
          message: (response as ResultError).message.toString(),
        ),
      );
    }
  }
}
