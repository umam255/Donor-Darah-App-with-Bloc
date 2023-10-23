part of 'upload_image_cubit.dart';

class UploadImageState extends Equatable {
  const UploadImageState();

  @override
  List<Object> get props => [];
}

class UploadImageInitial extends UploadImageState {}

class UploadImageIsLoading extends UploadImageState {}

class UploadImageIsSucces extends UploadImageState {
  String? message;

  UploadImageIsSucces({this.message});
}

// ignore: must_be_immutable
class UploadImageIsFailed extends UploadImageState {
  String? message;

  UploadImageIsFailed({this.message});
}
