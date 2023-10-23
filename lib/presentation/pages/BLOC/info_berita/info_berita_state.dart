// ignore_for_file: override_on_non_overriding_member

import 'package:donor_darah/domain/model/info_berita/info_berita_data.dart';
import 'package:equatable/equatable.dart';

abstract class InfoBeritaState extends Equatable {
  const InfoBeritaState();

  @override
  List<Object> get props => [];
}

class InfoBeritaInitState extends InfoBeritaState {}

class InfoBeritaIsEmpty extends InfoBeritaState {
  final String? message;
  const InfoBeritaIsEmpty({this.message});
}

class InfoBeritaLoaded extends InfoBeritaState {
  final List<InfoBeritaData> data;
  const InfoBeritaLoaded(this.data);
}

class InfoBeritaError extends InfoBeritaState {}

class InfoBeritaLoading extends InfoBeritaState {}
