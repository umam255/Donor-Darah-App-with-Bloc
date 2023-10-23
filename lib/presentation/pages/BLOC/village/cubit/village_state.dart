// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
part of 'village_cubit.dart';

class VillageState extends Equatable {
  const VillageState();

  @override
  List<Object> get props => [];
}

class VillageInitial extends VillageState {}

class VillageIsLoading extends VillageState {}

class VillageIsLoaded extends VillageState {}

class VillageIsSucces extends VillageState {
  List<VillageData> data;
  VillageIsSucces({
    required this.data,
  });
}

class VillageIsFailed extends VillageState {
  String? message;

  VillageIsFailed({this.message});
}
