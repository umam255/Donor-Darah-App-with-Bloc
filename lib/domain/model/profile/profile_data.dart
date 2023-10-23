// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:donor_darah/domain/model/profile/profile_user_data.dart';

class ProfileData {
  int id;
  String memberCode;
  String name;
  String urlImage;
  int totalDonor;
  String lastDonor;
  String nextDonor;
  ProfileUserData user;
  ProfileData(
    this.id,
    this.memberCode,
    this.name,
    this.urlImage,
    this.totalDonor,
    this.lastDonor,
    this.nextDonor,
    this.user,
  );
}
