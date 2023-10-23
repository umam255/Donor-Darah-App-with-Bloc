import 'package:donor_darah/domain/model/agenda_detail/agenda_detail_unit_data.dart';
import 'package:donor_darah/domain/model/agenda_detail/agenda_detail_user_data.dart';

class AgendaDetailData {
  int id;
  String code;
  String name;
  String date;
  String timeStart;
  String timeEnd;
  AgendaDetailUnitData unit;
  AgendaDetailUserData user;
  AgendaDetailData(
    this.id,
    this.code,
    this.name,
    this.date,
    this.timeStart,
    this.timeEnd,
    this.unit,
    this.user,
  );
}
