// ignore_for_file: avoid_print
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:donor_darah/base/result_entity/result_entity.dart';
import '../../../../../domain/model/village/village_data.dart';
import '../../../../../domain/repository/village/village_repository.dart';
part 'village_state.dart';

class VillageCubit extends Cubit<VillageState> {
  final VillageRepository repository;
  VillageCubit(this.repository) : super(const VillageState());

  Future<void> fetchVillage(String? subDistrictId) async {
    emit(VillageIsLoading());
    final response = await repository.fetchVillage(subDistrictId);
    if (response is ResultSuccess) {
      emit(VillageIsSucces(data: (response as ResultSuccess).data));
    } else {
      emit(VillageIsFailed(message: "Data Not Found"));
    }
  }
}
