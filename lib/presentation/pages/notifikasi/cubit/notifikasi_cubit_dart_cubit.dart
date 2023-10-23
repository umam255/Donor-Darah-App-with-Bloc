// ignore_for_file: avoid_print

import 'package:donor_darah/base/result_entity/result_entity.dart';
import 'package:donor_darah/domain/base/authentication_headers_request.dart';
import 'package:donor_darah/utility/commons.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../domain/repository/notifikasi/notifikasi_repository.dart';
import 'notifikasi_cubit_dart_state.dart';

class NotifikasiCubit extends Cubit<NotifikasiState> {
  final NotifikasiRepository repository;
  NotifikasiCubit(this.repository) : super(const NotifikasiState());

  Future<void> fetchNotifikasi() async {
    final token = await Commons().getUid();
    final response = await repository.fetchNotifikasi(
      AuthenticationHeadersRequest('$token'),
    );
    if (response is ResultSuccess) {
      emit(NotifikasiIsSucces(data: (response as ResultSuccess).data));
    } else {
      emit(NotifikasiIsFailed(message: "Data Not Found"));
    }
  }
}
