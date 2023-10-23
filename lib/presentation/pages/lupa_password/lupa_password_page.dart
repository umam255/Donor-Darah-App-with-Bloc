import 'package:donor_darah/data/repository/forgot_password/forgot_pass_repository_impl.dart';
import 'package:donor_darah/presentation/navigation/routes.dart';
import 'package:donor_darah/presentation/pages/lupa_password/cubit/forgot_pass_cubit.dart';
import 'package:donor_darah/utility/commons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../domain/model/request/forget_password/forget_password_request.dart';

class LupaPasswordPage extends StatefulWidget {
  const LupaPasswordPage({super.key});

  @override
  State<LupaPasswordPage> createState() => _LupaPasswordPageState();
}

class _LupaPasswordPageState extends State<LupaPasswordPage> {
  final _emailController = TextEditingController();

  bool validation() {
    if (_emailController.text.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  late ForgotPassCubit _forgotPassCubit;

  @override
  void initState() {
    super.initState();
    _forgotPassCubit = ForgotPassCubit(ForgotPassRepositoryImpl());
  }

  @override
  void dispose() {
    _forgotPassCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: BackButton(
            color: Colors.black,
          ),
          title: const Text(
            'Lupa Kata Sandi',
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          backgroundColor: Colors.white,
          systemOverlayStyle: SystemUiOverlayStyle.light,
        ),
        body: BlocListener<ForgotPassCubit, ForgotPassState>(
          listener: (context, forgotPassState) {
            if (forgotPassState is ForgotPassIsError) {
              ((forgotPassState.message == ""
                  ? Commons()
                      .showSnackBarErrorr(context, forgotPassState.message!)
                  : Commons()
                      .showSnackBarErrorr(context, forgotPassState.message!)));
              if (forgotPassState.message == "") {
                Commons().showSnackBarErrorr(context, forgotPassState.message!);
              }
            } else if (forgotPassState is ForgotPassIsSuccess) {
              showDialog(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  elevation: 0,
                  alignment: Alignment.center,
                  insetPadding: const EdgeInsets.symmetric(horizontal: 100),
                  icon: Image.asset(
                    'assets/images/notification_lonceng.png',
                    width: 100,
                    height: 100,
                  ),
                  iconPadding: const EdgeInsets.only(
                    top: 40,
                    left: 60,
                    right: 60,
                  ),
                  content: Padding(
                    padding: const EdgeInsets.only(bottom: 61),
                    child: Text(
                      'Password baru telah dikirim ke ${_emailController.text}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              );
              Future.delayed(
                const Duration(seconds: 3),
                () {
                  context.goNamed(Routes.loginPage);
                },
              );
            }
          },
          child: Container(
            padding: const EdgeInsets.only(top: 18, left: 24, right: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Masukan Email',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 34),
                TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: Color(0xffE6E6E6),
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: Color(0xffE6E6E6),
                      ),
                    ),
                    labelText: 'Email',
                    labelStyle: TextStyle(
                      color: Color(0xff999999),
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                const Text(
                  'Info : Password Baru anda akan dikirim melalui email.',
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xffFFAF11),
                  ),
                ),
                const SizedBox(height: 85),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 52,
                  child: ElevatedButton(
                      onPressed: validation()
                          ? () {
                              BlocProvider.of<ForgotPassCubit>(context)
                                  .btnForgotPass(ForgetPasswordRequest(
                                      _emailController.text));
                            }
                          : () {
                              Commons().showSnackBarErrorr(
                                  context, 'email tidak boleh kosong');
                            },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFD91E2A),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                        side: const BorderSide(color: Colors.white),
                        elevation: 0.0,
                      ),
                      child: BlocBuilder<ForgotPassCubit, ForgotPassState>(
                        builder: (context, forgotPassState) {
                          if (forgotPassState is ForgotPassIsLoading) {
                            return const CircularProgressIndicator(
                              color: Colors.white,
                            );
                          }
                          return const Text(
                            'Kirim',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          );
                        },
                      )),
                )
              ],
            ),
          ),
        ));
  }
}
