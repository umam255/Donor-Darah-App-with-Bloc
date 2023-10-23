import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class Commons {
  final prefs = SharedPreferences.getInstance();

  void setUid(String token) async {
    final storage = await prefs;
    await storage.setString("token", token);
  }

  Future<String?> getUid() async {
    final storage = await prefs;
    return storage.getString("token");
  }

  Future<bool> removeUid() async {
    final storage = await prefs;
    return storage.remove("token");
  }

  void showSnackBarErrorr(BuildContext context, String msg) {
    showTopSnackBar(context, CustomSnackBar.error(message: msg));
  }

  void showSnackBarSuccess(BuildContext context, String msg) {
    showTopSnackBar(context, CustomSnackBar.success(message: msg));
  }

  void showFlashMessage(BuildContext context, String message,
      {FlashStyle style = FlashStyle.floating}) {
    showFlash(
      context: context,
      duration: const Duration(seconds: 3),
      builder: (context, controller) {
        return Flash(
          margin: const EdgeInsets.only(top: 50),
          position: FlashPosition.top,
          controller: controller,
          borderRadius: BorderRadius.circular(60),
          backgroundColor: const Color(0xffCCCCCC),
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: FlashBar(
              padding: const EdgeInsets.all(10),
              message: Text(
                textAlign: TextAlign.center,
                message,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: MediaQuery.of(context).size.width * 0.03,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  String formatTanggal(String tanggal) {
    if (tanggal == "") {
      return "";
    }
    initializeDateFormatting('id', null);
    DateTime parse = DateTime.parse(tanggal).toLocal();
    String date = DateFormat('EEEE, dd MMMM yyyy', 'id').format(parse);
    return date;
  }

  String formatDate(String tanggal) {
    if (tanggal == "") {
      return "";
    }
    initializeDateFormatting('id', null);
    DateTime parse = DateTime.parse(tanggal).toLocal();
    String date = DateFormat('dd MMMM yyyy', 'id').format(parse);
    return date;
  }

  String formatJam(String jam, String date) {
    try {
      String formattedDate =
          DateFormat('yyyy-MM-dd').format(DateTime.parse(date));
      String formattedTime = DateFormat.Hm().format(
        DateTime.parse("$formattedDate $jam"),
      );
      return formattedTime;
    } catch (e) {
      return "Error: Format tanggal atau waktu tidak valid";
    }
  }
}
