import 'package:donor_darah/base/result_entity/result_entity.dart';
import 'package:donor_darah/domain/base/authentication_headers_request.dart';
import 'package:donor_darah/utility/commons.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../domain/model/agenda/agenda_data.dart';
import '../../../../../domain/repository/agenda/agenda_repository.dart';

part 'agenda_state.dart';

class AgendaCubit extends Cubit<AgendaState> {
  final AgendaRepository repository;

  AgendaCubit(this.repository) : super(const AgendaState());

  Future<void> fetchAgenda() async {
    emit(AgendaIsLoading());

    final token = await Commons().getUid();

    final response = await repository.fetchAgenda(
      AuthenticationHeadersRequest(token.toString()),
    );

    if (response is ResultSuccess) {
      // Get the complete list of agenda data from the response
      final List<AgendaData> allAgenda = (response as ResultSuccess).data;

      // Filter the data by status OPEN
      final openAgenda =
          allAgenda.where((agenda) => agenda.status == "OPEN").toList();

      if (openAgenda.isEmpty) {
        // If no data with status OPEN, emit AgendaIsOpenIsEmpty state
        emit(AgendaIsOpenIsEmpty());
      } else {
        // If data with status OPEN is present, emit AgendaIsSucces state with the filtered data
        emit(AgendaIsSucces(data: openAgenda));
      }
    } else {
      emit(AgendaIsFailed(message: ''));
    }
  }
}
