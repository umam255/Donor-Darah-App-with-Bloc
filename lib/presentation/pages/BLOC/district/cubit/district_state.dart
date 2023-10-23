// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
part of 'district_cubit.dart';

class DistrictState extends Equatable {
  const DistrictState();

  @override
  List<Object> get props => [];
}

class DistrictInitial extends DistrictState {}

class DistrictIsLoading extends DistrictState {}

class DistrictIsSucces extends DistrictState {
  List<DistrictData> data;
  DistrictIsSucces({
    required this.data,
  });
}

class DistrictIsFailed extends DistrictState {
  String? message;

  DistrictIsFailed({this.message});
}
