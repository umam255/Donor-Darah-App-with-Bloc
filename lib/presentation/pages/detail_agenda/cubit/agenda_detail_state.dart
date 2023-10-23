part of 'agenda_detail_cubit.dart';

class AgendaDetailState extends Equatable {
  const AgendaDetailState();

  @override
  List<Object> get props => [];
}

class AgendaDetailInitial extends AgendaDetailState {}

class AgendaDetailIsLoading extends AgendaDetailState {}

class AgendaDetailIsSucces extends AgendaDetailState {
  final AgendaDetailData data;

  const AgendaDetailIsSucces({required this.data});
}

// ignore: must_be_immutable
class AgendaDetailIsFailed extends AgendaDetailState {
  String? message;

  AgendaDetailIsFailed({this.message});
}
