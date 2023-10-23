import 'package:donor_darah/utility/auth/auth_cubit.dart';
import 'package:donor_darah/utility/commons.dart';
import 'package:donor_darah/utility/custom_textStyle.dart';
import 'package:donor_darah/data/repository/login/login_repository_impl.dart';
import 'package:donor_darah/domain/model/request/login/login_request.dart';
import 'package:donor_darah/presentation/navigation/routes.dart';
import 'package:donor_darah/presentation/pages/login/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool hidePassword = true;
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  void changePasswordVisibility() {
    setState(() {
      hidePassword = !hidePassword;
    });
  }

  bool validation() {
    if (phoneController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  late LoginCubit _loginCubit;

  getToken() async {
    final token = await Commons().getUid();
    // ignore: avoid_print
    print(token);
  }

  @override
  void initState() {
    super.initState();
    _loginCubit = LoginCubit(LoginRepositoryImpl());
  }

  @override
  void dispose() {
    _loginCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, loginState) {
          if (loginState is LoginIsError) {
            ((loginState.message == ""
                ? Commons().showSnackBarErrorr(
                    context, "No Handone atau Password Salah")
                : Commons().showSnackBarErrorr(context, loginState.message!)));
            if (loginState.message == "") {
              Commons().showSnackBarErrorr(
                  context, "No Handone atau Password Salah");
            }
          } else if (loginState is LoginIsSuccess) {
            context.read<AuthCubit>().checkToken();
            context.go('/beranda');
          }
        },
        builder: (context, loginState) {
          return Container(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: FractionallySizedBox(
                    widthFactor: 0.7,
                    child: Image.asset(
                      'assets/images/Logo.png',
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                Text(
                  'Selamat Datang',
                  style: TextStyle(
                    fontSize: width * 0.04,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  'Silahkan login untuk masuk ke akun anda',
                  style: TextStyle(
                    fontSize: width * 0.028,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.02,
                  ),
                ),
                SizedBox(
                  height: height * 0.04,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nomor Handphone',
                      style: TextStyle(
                        fontSize: width * 0.025,
                        fontWeight: FontWeight.bold,
                        color: redColor,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      controller: phoneController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(
                            color: Color(0xffFCE9EA),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(
                            color: Color(0xFFD91E2A),
                          ),
                        ),
                        hintText: 'Masukan No Handphone',
                        suffixIcon: const Icon(
                          Icons.phone_iphone_rounded,
                          color: Color(0xFFD91E2A),
                        ),
                        filled: true,
                        fillColor: const Color(0xffFCE9EA),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Kata Sandi',
                      style: TextStyle(
                        fontSize: width * 0.025,
                        fontWeight: FontWeight.bold,
                        color: redColor,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      controller: passwordController,
                      obscureText: hidePassword,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(
                            color: Color(0xffFCE9EA),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(
                            color: Color(0xFFD91E2A),
                          ),
                        ),
                        hintText: 'Masukan Kata Sandi',
                        suffixIcon: GestureDetector(
                          onTap: () {
                            changePasswordVisibility();
                          },
                          child: Icon(
                            color: const Color(0xFFD91E2A),
                            (hidePassword)
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                        ),
                        filled: true,
                        fillColor: const Color(0xffFCE9EA),
                      ),
                    ),
                    SizedBox(height: height * 0.01),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () =>
                            context.goNamed(Routes.lupaPasswordPage),
                        child: const Text(
                          'Lupa Kata Sandi',
                          style: TextStyle(
                            color: Color(0xFFD91E2A),
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.021),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: height * 0.07,
                      child: ElevatedButton(
                        onPressed: validation()
                            ? () {
                                BlocProvider.of<LoginCubit>(context).btnlogin(
                                  LoginRequest(
                                    phoneController.text,
                                    passwordController.text,
                                  ),
                                );
                              }
                            : () {
                                Commons().showSnackBarErrorr(
                                  context,
                                  'No Handphone & Password Tidak Boleh Kosong',
                                );
                              },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFD91E2A),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            side: const BorderSide(color: Colors.white),
                            elevation: 0.0),
                        child: BlocBuilder<LoginCubit, LoginState>(
                          builder: (context, loginState) {
                            if (loginState is LoginIsLoading) {
                              return const CircularProgressIndicator(
                                color: Colors.white,
                              );
                            }
                            return Text(
                              'Masuk',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: width * 0.03,
                                fontWeight: FontWeight.w700,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.01),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Belum Punya Akun?',
                          style: TextStyle(
                            fontSize: width * 0.03,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            context.goNamed(Routes.screenReg);
                          },
                          child: Text(
                            'Register',
                            style: TextStyle(
                              fontSize: width * 0.03,
                              color: redColor,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
