import 'package:donor_darah/controller/my_controller.dart';
import 'package:donor_darah/domain/model/request/register/register_request.dart';
import 'package:donor_darah/presentation/navigation/routes.dart';
import 'package:donor_darah/presentation/pages/register/cubit/register_cubit.dart';
import 'package:donor_darah/presentation/pages/register/model/model_register.dart';
import 'package:donor_darah/utility/commons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import '../../../utility/custom_textStyle.dart';

class ScreenRegisterSandi extends StatefulWidget {
  const ScreenRegisterSandi({super.key});

  @override
  State<ScreenRegisterSandi> createState() => _ScreenRegisterSandiState();
}

class _ScreenRegisterSandiState extends State<ScreenRegisterSandi> {
  TextEditingController passConfirmController = TextEditingController();
  TextEditingController passController = TextEditingController();
  bool hidePassword = true;
  bool hidePassCon = true;

  final RegisterController registerController = Get.put(RegisterController());
  final ModelRegister? getRegisterController =
      Get.find<RegisterController>().registerData;

  void changePasswordVisibility() {
    setState(() {
      hidePassCon = !hidePassCon;
    });
  }

  void changePasswordConVisibility() {
    setState(() {
      hidePassword = !hidePassword;
    });
  }

  bool validationEmpty() {
    if (passController.text.isEmpty && passConfirmController.text.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  bool validationPass() {
    if (passController.text != passConfirmController.text) {
      return false;
    } else {
      return true;
    }
  }

  String? validate() {
    if (!validationEmpty()) {
      return 'Field Tidak Boleh Kosong';
    } else if (!validationPass()) {
      return 'Kata Sandi Harus Sama';
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: white249Color,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const BackButton(
          color: Colors.black,
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              'Kata Sandi',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '3 dari 3',
              style: TextStyle(fontSize: 14, color: Color(0xff999999)),
            ),
          ],
        ),
      ),
      body: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is RegisterIsError) {
            Commons().showSnackBarErrorr(context, state.message!);
          } else if (state is RegisterIsSuccess) {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  icon: Image.asset(
                    'assets/images/notif.png',
                  ),
                  content: Text(
                    state.message.toString(),
                    textAlign: TextAlign.center,
                  ),
                );
              },
            );
            Future.delayed(
              const Duration(seconds: 2),
              () {
                context.goNamed(Routes.loginPage);
              },
            );
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DetailText("Buat Kata Sandi"),
                  TextFormField(
                    obscureText: hidePassword,
                    cursorColor: black26Color,
                    controller: passController,
                    decoration: InputDecoration(
                      alignLabelWithHint: true,
                      floatingLabelStyle: const TextStyle(color: redColor),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: redColor),
                      ),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: white230Color),
                      ),
                      labelText: "Kata Sandi",
                      labelStyle: CustomStyle1532(),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          changePasswordConVisibility();
                        },
                        child: Icon(
                          (hidePassword)
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: redColor,
                          size: 20,
                        ),
                      ),
                    ),
                    textAlign: TextAlign.left,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    obscureText: hidePassCon,
                    cursorColor: black26Color,
                    controller: passConfirmController,
                    decoration: InputDecoration(
                      alignLabelWithHint: true,
                      floatingLabelStyle: const TextStyle(color: redColor),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: redColor),
                      ),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: white230Color),
                      ),
                      labelText: "Konfirmasi Kata Sandi",
                      labelStyle: CustomStyle1532(),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          changePasswordVisibility();
                        },
                        child: Icon(
                          (hidePassCon)
                              ? Icons.visibility_off
                              : Icons.visibility,
                          size: 20,
                          color: redColor,
                        ),
                      ),
                    ),
                    textAlign: TextAlign.left,
                    keyboardType: TextInputType.emailAddress,
                  ),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(24),
        child: ElevatedButton(
            onPressed: () {
              String? validationResult = validate();
              if (validationResult != null) {
                Commons().showSnackBarErrorr(
                  context,
                  validationResult,
                );
              } else {
                ModelRegister newRegisterData = ModelRegister(
                  getRegisterController!.name,
                  getRegisterController!.placeOfBirth,
                  getRegisterController!.dateOfBirth,
                  getRegisterController!.gender,
                  getRegisterController!.jobId,
                  getRegisterController!.unitId,
                  getRegisterController!.phone,
                  getRegisterController!.email,
                  getRegisterController!.address,
                  getRegisterController!.subDistrictId,
                  getRegisterController!.villageId,
                  getRegisterController!.postalCode,
                  passController.text,
                  passConfirmController.text,
                );
                registerController.setRegisterData(newRegisterData);
                BlocProvider.of<RegisterCubit>(context).postRegister(
                  RegisterRequest(
                    getRegisterController!.name,
                    getRegisterController!.placeOfBirth,
                    getRegisterController!.dateOfBirth,
                    getRegisterController!.gender,
                    getRegisterController!.jobId,
                    getRegisterController!.unitId,
                    getRegisterController!.phone,
                    getRegisterController!.email,
                    getRegisterController!.address,
                    getRegisterController!.subDistrictId,
                    getRegisterController!.villageId,
                    getRegisterController!.postalCode,
                    passController.text,
                    passConfirmController.text,
                  ),
                );
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: redColor,
              fixedSize: Size(MediaQuery.of(context).size.width, 52),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
            ),
            child: Text(
              "Daftar",
              style: CustomStyle2493(),
            )),
      ),
    );
  }

  Text DetailText(String text) {
    return Text(text, style: CustomStyle04());
  }
}
