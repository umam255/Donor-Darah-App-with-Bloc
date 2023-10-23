part of 'agenda_cubit.dart';

class AgendaState extends Equatable {
  const AgendaState();

  @override
  List<Object> get props => [];
}

class AgendaInitial extends AgendaState {}

class AgendaIsLoading extends AgendaState {}

class AgendaIsSucces extends AgendaState {
  final List<AgendaData> data;

  const AgendaIsSucces({required this.data});

  @override
  List<Object> get props => [data];
}

class AgendaIsOpenIsEmpty extends AgendaState {}

// ignore: must_be_immutable
class AgendaIsFailed extends AgendaState {
  String? message;

  AgendaIsFailed({this.message});
}
