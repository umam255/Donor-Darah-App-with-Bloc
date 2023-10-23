// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:donor_darah/data/repository/refresh_token/refresh_token_repository_impl.dart';
import 'package:donor_darah/utility/auth/auth_cubit.dart';
import 'package:donor_darah/utility/auth/refresh_token/refresh_token_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:donor_darah/presentation/pages/Notifikasi/notifikasi_screen.dart';
import 'package:donor_darah/presentation/pages/agenda/agenda_screen.dart';
import 'package:donor_darah/presentation/pages/main_layout/home/home_screen.dart';
import 'package:donor_darah/presentation/pages/profile/akun_screen.dart';
import 'package:donor_darah/utility/custom_textStyle.dart';

class MainLayoutScreen extends StatefulWidget {
  final int indexScreen;
  const MainLayoutScreen({
    Key? key,
    required this.indexScreen,
  }) : super(key: key);

  @override
  State<MainLayoutScreen> createState() => _MainLayoutScreenState();
}

class _MainLayoutScreenState extends State<MainLayoutScreen> {
  int _currentIndex = 0;
  final List<Widget> _screens = const [
    BerandaScreen(),
    AgendaScreen(),
    NotifikasiScreen(),
    AkunScreen(),
  ];
  @override
  void initState() {
    _currentIndex = widget.indexScreen;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0.0,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        enableFeedback: false,
        showUnselectedLabels: true,
        selectedItemColor: redColor,
        unselectedItemColor: greyColor,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(
              'assets/icon/iconBottomNavbar/iconActive/homeActive.svg',
            ),
            icon: SvgPicture.asset(
              'assets/icon/iconBottomNavbar/icon/home.svg',
            ),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(
              'assets/icon/iconBottomNavbar/iconActive/agendaActive.svg',
            ),
            icon: SvgPicture.asset(
              'assets/icon/iconBottomNavbar/icon/agenda.svg',
            ),
            label: 'Agenda',
          ),
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(
              'assets/icon/iconBottomNavbar/iconActive/notifikasiActive.svg',
            ),
            icon: SvgPicture.asset(
              'assets/icon/iconBottomNavbar/icon/notifikasi.svg',
            ),
            label: 'Notifikasi',
          ),
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(
              'assets/icon/iconBottomNavbar/iconActive/profileActive.svg',
            ),
            icon: SvgPicture.asset(
              'assets/icon/iconBottomNavbar/icon/profile.svg',
            ),
            label: 'Akun',
          ),
        ],
      ),
    );
  }
}
