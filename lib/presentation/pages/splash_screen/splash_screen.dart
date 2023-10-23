import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:donor_darah/base/widget/BaseColor.dart';
import 'package:donor_darah/presentation/pages/login/login_page.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        duration: 3000,
        backgroundColor: BaseColor.white,
        splash: Image.asset('assets/images/Logo.png'),
        nextScreen: const LoginPage(),
        splashIconSize: 250,
        splashTransition: SplashTransition.fadeTransition,
      ),
    );
  }
}
