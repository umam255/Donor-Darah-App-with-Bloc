// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
part of 'unit_cubit.dart';

class UnitState extends Equatable {
  const UnitState();

  @override
  List<Object> get props => [];
}

class UnitInitial extends UnitState {}

class UnitIsLoading extends UnitState {}

class UnitIsLoaded extends UnitState {}

class UnitIsSucces extends UnitState {
  List<UnitData> data;

  UnitIsSucces({
    required this.data,
  });
}

class UnitIsFailed extends UnitState {
  String? message;

  UnitIsFailed({this.message});
}
