import 'package:donor_darah/presentation/pages/jadwal_donor/model/jadwal_donor_model.dart';
import 'package:donor_darah/presentation/pages/register/model/model_register.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  ModelRegister? registerData;

  void setRegisterData(ModelRegister newRegisterData) {
    registerData = newRegisterData;
    update();
  }
}

class DonorController extends GetxController {
  JadwalDonorModel? jadwalDonorData;
  var unitId = 0;

  void setunitId(int newUnitId) {
    unitId = newUnitId;
    update();
  }

  void setJadwalDonorData(JadwalDonorModel newJadwalDonorData) {
    jadwalDonorData = newJadwalDonorData;
    update();
  }
}
