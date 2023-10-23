import 'package:donor_darah/base/result_entity/result_entity.dart';
import 'package:donor_darah/domain/base/authentication_headers_request.dart';
import 'package:donor_darah/utility/commons.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../domain/model/request/update_profil/update_profile-request.dart';
import '../../../../../domain/repository/update_profile/update_profile_repository.dart';
part 'update_profile_state.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  final UpdateProfileRepository repository;
  UpdateProfileCubit(this.repository) : super(const UpdateProfileState());

  Future<void> submitUpdateProfile(UpdateProfileRequest request) async {
    emit(UpdateProfileIsLoading());
    final token = await Commons().getUid();
    print('TOKEN CUBIT: ${token}');
    final response = await repository.postUpdateProfile(
      AuthenticationHeadersRequest(token!),
      request,
    );

    if (response is ResultSuccess) {
      emit(UpdateProfileIsSucces(message: ''));
    } else {
      print('ERROR CUBIT: ${request.file}');
      emit(UpdateProfileIsFailed(message: ''));
    }
  }
}
