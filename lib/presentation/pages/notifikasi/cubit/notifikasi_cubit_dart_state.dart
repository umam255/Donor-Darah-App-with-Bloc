import 'package:equatable/equatable.dart';

import '../../../../../domain/model/Notifikasi/notifikasi_data.dart';

class NotifikasiState extends Equatable {
  const NotifikasiState();

  @override
  List<Object> get props => [];
}

class NotifikasiInitial extends NotifikasiState {}

class NotifikasiIsLoading extends NotifikasiState {}

class NotifikasiIsLoaded extends NotifikasiState {}

class NotifikasiIsSucces extends NotifikasiState {
  final List<NotifikasiData> data;

  const NotifikasiIsSucces({required this.data});
}

// ignore: must_be_immutable
class NotifikasiIsFailed extends NotifikasiState {
  String? message;

  NotifikasiIsFailed({this.message});
}
