// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'unit_udd_cubit.dart';

abstract class UnitUddState extends Equatable {
  const UnitUddState();

  @override
  List<Object> get props => [];
}

class UnitUddInitial extends UnitUddState {}

class UnitUddIsLoading extends UnitUddState {}

class UnitUddIsEmpty extends UnitUddState {}

class UnitUddIsSuccess extends UnitUddState {
  final List<UnitUddData> data;

  const UnitUddIsSuccess({
    required this.data,
  });
}

// ignore: must_be_immutable
class UnitUddIsError extends UnitUddState {
  String? message;

  UnitUddIsError({
    this.message,
  });
}
