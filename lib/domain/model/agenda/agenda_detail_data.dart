import 'package:donor_darah/domain/model/agenda/unit_data.dart';
import 'package:donor_darah/domain/model/agenda/user_data.dart';

class AgendaDetailData {
  int id;
  String name;
  String date;
  String timeStart;
  String timeEnd;
  String address;
  String code;
  UnitData unit;
  UserData user;
  AgendaDetailData(
    this.id,
    this.name,
    this.date,
    this.address,
    this.timeEnd,
    this.timeStart,
    this.code,
    this.unit,
    this.user,
  );
}
