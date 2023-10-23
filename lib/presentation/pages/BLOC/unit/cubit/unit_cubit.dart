// ignore_for_file: avoid_print

import 'package:donor_darah/base/result_entity/result_entity.dart';
import 'package:donor_darah/domain/model/request/register/register_request.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../domain/model/unit/unit_data.dart';
import '../../../../../domain/repository/unit/unit_repository.dart';

part 'unit_state.dart';

class UnitCubit extends Cubit<UnitState> {
  final UnitRepository repository;
  UnitCubit(this.repository) : super(const UnitState());

  Future<void> fetchUnit(RegisterRequest request) async {
    print("Fetch Unit");

    final response = await repository.fetchUnit(request);
    if (response is ResultSuccess) {
      emit(UnitIsSucces(data: (response as ResultSuccess).data));
    } else {
      emit(UnitIsFailed(message: "Data Not Found"));
    }
  }
}
