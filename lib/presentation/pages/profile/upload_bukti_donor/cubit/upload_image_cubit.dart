import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../../base/result_entity/result_entity.dart';
import '../../../../../domain/base/authentication_headers_request.dart';
import '../../../../../domain/repository/upload_image/upload_image_repository.dart';
import '../../../../../utility/commons.dart';
part 'upload_image_state.dart';

class UploadImageCubit extends Cubit<UploadImageState> {
  final UploadImageRepository repository;
  UploadImageCubit(this.repository) : super(const UploadImageState());

  Future<void> fetchUploadImage(File image, String idRiwayat) async {
    emit(UploadImageIsLoading());
    final token = await Commons().getUid();
    final response = await repository.postUploadImage(
      AuthenticationHeadersRequestUpload(token!),
      image,
      idRiwayat,
    );

    if (response is ResultSuccess) {
      emit(UploadImageIsSucces(message: ''));
    } else {
      emit(UploadImageIsFailed(message: ''));
    }
  }
}
