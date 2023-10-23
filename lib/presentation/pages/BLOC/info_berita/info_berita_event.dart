// ignore_for_file: override_on_non_overriding_member
import 'package:equatable/equatable.dart';

abstract class InfoBeritaEvent extends Equatable {
  const InfoBeritaEvent();
}

class BeritaInfoEvent extends InfoBeritaEvent {
  final String country;
  final String limit;
  final String categoryId;

  const BeritaInfoEvent(this.country, this.limit, this.categoryId);

  @override
  List<Object> get props => [];
}
