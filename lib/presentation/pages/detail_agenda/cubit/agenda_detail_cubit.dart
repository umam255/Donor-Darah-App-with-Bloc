import 'package:donor_darah/base/result_entity/result_entity.dart';
import 'package:donor_darah/domain/base/authentication_headers_request.dart';
import 'package:donor_darah/domain/model/agenda_detail/agenda_detail_data.dart';
import 'package:donor_darah/domain/repository/agenda/agenda_repository.dart';
import 'package:donor_darah/domain/repository/agenda_detail/agenda_detail_repository.dart';
import 'package:donor_darah/utility/commons.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'agenda_detail_state.dart';

class AgendaDetailCubit extends Cubit<AgendaDetailState> {
  final AgendaDetailRepository repository;
  AgendaDetailCubit(this.repository) : super(const AgendaDetailState());

  Future<void> fetchAgendaDetail(
    String idAgenda,
  ) async {
    emit(AgendaDetailIsLoading());
    final token = await Commons().getUid();
    final response = await repository.fetchDetailAgenda(
      AuthenticationHeadersRequest(token!),
      idAgenda,
    );
    if (response is ResultSuccess) {
      emit(AgendaDetailIsSucces(data: (response as ResultSuccess).data));
    } else {
      emit(AgendaDetailIsFailed(message: ''));
    }
  }
}
