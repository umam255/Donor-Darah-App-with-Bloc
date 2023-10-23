// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace, non_constant_identifier_names, prefer_typing_uninitialized_variables, avoid_print, must_be_immutable, unused_local_variable

import 'package:donor_darah/domain/model/request/change_password/change_password_request.dart';
import 'package:donor_darah/presentation/navigation/routes.dart';
import 'package:donor_darah/presentation/pages/profile/change_password/cubit/change_password_cubit.dart';
import 'package:donor_darah/utility/auth/auth_cubit.dart';
import 'package:donor_darah/utility/commons.dart';
import 'package:donor_darah/utility/custom_textStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ScreenUbahSandi extends StatefulWidget {
  const ScreenUbahSandi({super.key});

  @override
  State<ScreenUbahSandi> createState() => _ScreenUbahSandiState();
}

class _ScreenUbahSandiState extends State<ScreenUbahSandi> {
  TextEditingController passController = TextEditingController();
  TextEditingController confPassController = TextEditingController();
  bool hidePassword = true;
  bool hidePasswordConf = true;

  void changePasswordVisibility(int visibility) {
    if (visibility == 1) {
      setState(() {
        hidePassword = !hidePassword;
      });
    } else {
      setState(() {
        hidePasswordConf = !hidePasswordConf;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.black,
        ),
        title: Text(
          'Ubah Kata Sandi',
          style: TextStyle(
            color: Colors.black,
            fontSize: width * 0.03,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: BlocConsumer<ChangePasswordCubit, ChangePasswordState>(
        listener: (context, state) {
          if (state is ChangePasswordIsFailed) {
            Commons().showSnackBarErrorr(context, state.message!);
          } else if (state is ChangePasswordIsSucces) {
            Commons().showFlashMessage(context, 'Kata sandi berhasil diubah');
            context.read<AuthCubit>().logOut();
            context.goNamed(Routes.loginPage);
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Buat Kata Sandi Baru',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: width * 0.035,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  obscureText: hidePassword,
                  controller: passController,
                  decoration: InputDecoration(
                    label: const Text('Kata Sandi Baru'),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        changePasswordVisibility(1);
                      },
                      child: Icon(
                        hidePassword ? Icons.visibility_off : Icons.visibility,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  obscureText: hidePasswordConf,
                  controller: confPassController,
                  decoration: InputDecoration(
                    label: const Text('Konfirmasi Kata Sandi Baru'),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        changePasswordVisibility(2);
                      },
                      child: Icon(
                        hidePasswordConf
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
        child: ElevatedButton(
          onPressed: () {
            BlocProvider.of<ChangePasswordCubit>(context)
                .onSubmitChangePassword(
              ChangePasswordRequest(
                passController.text,
                confPassController.text,
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: redColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            fixedSize: Size(
              width,
              height * 0.07,
            ),
          ),
          child: Text(
            "Simpan",
            style: TextStyle(color: Colors.white, fontSize: width * 0.035),
          ),
        ),
      ),
    );
  }
}
