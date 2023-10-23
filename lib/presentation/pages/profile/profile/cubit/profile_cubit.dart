import 'package:donor_darah/domain/base/authentication_headers_request.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:donor_darah/base/result_entity/result_entity.dart';
import '../../../../../domain/model/profile/profile_data.dart';
import '../../../../../domain/repository/profile/profile_repository.dart';
import '../../../../../utility/commons.dart';
part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepository repository;
  ProfileCubit(this.repository) : super(const ProfileState());

  Future<void> fetchProfile() async {
    emit(ProfileIsLoading());
    final token = await Commons().getUid();

    final response = await repository.fetchProfile(
      AuthenticationHeadersRequest(token.toString()),
    );
    if (response is ResultSuccess) {
      emit(ProfileIsSucces(data: (response as ResultSuccess).data));
    } else {
      emit(ProfileIsFailed(message: (response as ResultError).message));
    }
  }
}
