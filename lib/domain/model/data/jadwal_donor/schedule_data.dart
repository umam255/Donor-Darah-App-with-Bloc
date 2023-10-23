// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:donor_darah/domain/model/data/jadwal_donor/schedule_schedule_data.dart';

class ScheduleData {
  String date;
  List<ScheduleScheduleData> schedule;

  ScheduleData(
    this.date,
    this.schedule,
  );
}
