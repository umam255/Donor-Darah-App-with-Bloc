import 'package:donor_darah/base/result_entity/result_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../domain/model/district/district.dart';
import '../../../../../domain/repository/district/district_repository.dart';
part 'district_state.dart';

class DistrictCubit extends Cubit<DistrictState> {
  final DistrictRepository repository;
  DistrictCubit(this.repository) : super(const DistrictState());

  Future<void> fetchDistrict() async {
    emit(DistrictIsLoading());
    final response = await repository.fetchDistrict();
    if (response is ResultSuccess) {
      emit(DistrictIsSucces(data: (response as ResultSuccess).data));
    } else {
      emit(DistrictIsFailed(message: (response as ResultError).message));
    }
  }
}
