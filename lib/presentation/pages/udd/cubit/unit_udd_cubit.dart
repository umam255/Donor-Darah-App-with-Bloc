import 'package:bloc/bloc.dart';
import 'package:donor_darah/base/result_entity/result_entity.dart';
import 'package:donor_darah/domain/model/data/unit_udd/unit_udd_data.dart';
import 'package:donor_darah/domain/repository/unit_udd/unit_udd_repository.dart';
import 'package:equatable/equatable.dart';

part 'unit_udd_state.dart';

class UnitUddCubit extends Cubit<UnitUddState> {
  final UnitUddRepository repository;

  UnitUddCubit(this.repository) : super(UnitUddInitial());

  Future<void> fetchUnitUdd() async {
    emit(UnitUddIsLoading());
    final response = await repository.fetchUnitUdd();

    if (response is ResultSuccess) {
      emit(UnitUddIsSuccess(data: (response as ResultSuccess).data));
    } else {
      emit(UnitUddIsError(message: (response as ResultError).message));
    }
  }
}
