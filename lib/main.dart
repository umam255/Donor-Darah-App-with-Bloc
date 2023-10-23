// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:donor_darah/presentation/pages/notifikasi_detail/cubit/notifikasi_detail_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:donor_darah/data/repository/agenda_detail/agenda_detail_repository_impl.dart';
import 'package:donor_darah/data/repository/cancel_donor/cancel_donor_repository_impl.dart';
import 'package:donor_darah/data/repository/forgot_password/forgot_pass_repository_impl.dart';
import 'package:donor_darah/data/repository/jadwal_donor/jadwal_donor_repository_impl.dart';
import 'package:donor_darah/data/repository/lihat_bukti_donor/lihat_bukti_donor.dart';
import 'package:donor_darah/data/repository/login/login_repository_impl.dart';
import 'package:donor_darah/data/repository/questionaire/questionaire_repository_impl.dart';
import 'package:donor_darah/data/repository/refresh_token/refresh_token_repository_impl.dart';
import 'package:donor_darah/data/repository/register/register_repository_impl.dart';
import 'package:donor_darah/data/repository/stock_darah/stock_darah_repository_impl.dart';
import 'package:donor_darah/data/repository/unit_udd/unit_udd_repository_impl.dart';
import 'package:donor_darah/data/repository/upload_image/upload_image_repository_impl.dart';
import 'package:donor_darah/presentation/navigation/package.dart';
import 'package:donor_darah/presentation/pages/BLOC/lihat_bukti_donor/cubit/lihat_bukti_donor_cubit.dart';
import 'package:donor_darah/presentation/pages/Notifikasi/cubit/notifikasi_cubit_dart_cubit.dart';
import 'package:donor_darah/presentation/pages/agenda/cubit/agenda_cubit.dart';
import 'package:donor_darah/presentation/pages/detail_agenda/cancel_donor/cubit/cancel_donor_cubit.dart';
import 'package:donor_darah/presentation/pages/detail_agenda/cubit/agenda_detail_cubit.dart';
import 'package:donor_darah/presentation/pages/jadwal_donor/cubit/jadwal_donor_cubit.dart';
import 'package:donor_darah/presentation/pages/login/cubit/login_cubit.dart';
import 'package:donor_darah/presentation/pages/lupa_password/cubit/forgot_pass_cubit.dart';
import 'package:donor_darah/presentation/pages/profile/change_password/cubit/change_password_cubit.dart';
import 'package:donor_darah/presentation/pages/profile/edit_profile/cubit/update_profile_cubit.dart';
import 'package:donor_darah/presentation/pages/profile/kartu_donor/cubit/kartu_donor_cubit.dart';
import 'package:donor_darah/presentation/pages/profile/profile/cubit/profile_cubit.dart';
import 'package:donor_darah/presentation/pages/profile/riwayat_donor/cubit/riwayat_donor_cubit.dart';
import 'package:donor_darah/presentation/pages/profile/upload_bukti_donor/cubit/upload_image_cubit.dart';
import 'package:donor_darah/presentation/pages/questionaire/cubit/questionaire_cubit.dart';
import 'package:donor_darah/presentation/pages/register/cubit/register_cubit.dart';
import 'package:donor_darah/presentation/pages/stok_darah/stock_darah/cubit/detail_stock_darah/cubit/detail_stock_darah_cubit.dart';
import 'package:donor_darah/presentation/pages/stok_darah/stock_darah/cubit/stock_darah_cubit.dart';
import 'package:donor_darah/presentation/pages/udd/cubit/unit_udd_cubit.dart';
import 'package:donor_darah/utility/auth/auth_cubit.dart';
import 'package:donor_darah/utility/auth/refresh_token/refresh_token_cubit.dart';
import 'package:donor_darah/utility/custom_textStyle.dart';

import 'data/repository/agenda/agenda_repository_impl.dart';
import 'data/repository/change_password/change_password_repository_impl.dart';
import 'data/repository/district/district_repository_impl.dart';
import 'data/repository/job/job_repository_impl.dart';
import 'data/repository/kartu_donor/kartu_donor_repository_impl.dart';
import 'data/repository/notifikasi/notifikasi_repository_impl.dart';
import 'data/repository/profile/profile_repository_impl.dart';
import 'data/repository/riwayat_donor/riwayat_donor_repository_impl.dart';
import 'data/repository/update_profile/update_profile_repository_impl.dart';
import 'data/repository/village/village_repository_impl.dart';
import 'presentation/pages/BLOC/district/cubit/district_cubit.dart';
import 'presentation/pages/BLOC/job/cubit/job_cubit.dart';
import 'presentation/pages/BLOC/village/cubit/village_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Color(0xffB31923),
        statusBarIconBrightness: Brightness.light,
      ),
    );
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RefreshTokenCubit(RefreshTokenRepositoryImpl()),
        ),
        BlocProvider(
          create: (context) {
            final refreshTokenCubit =
                BlocProvider.of<RefreshTokenCubit>(context);
            return AuthCubit(refreshTokenCubit)..checkToken();
          },
        ),
        BlocProvider(
          create: (context) => LoginCubit(LoginRepositoryImpl()),
        ),
        BlocProvider(
          create: (context) => ForgotPassCubit(ForgotPassRepositoryImpl()),
        ),
        BlocProvider(
          create: (context) => QuestionaireCubit(
            QuestionaireRepositoryImpl(),
          ),
        ),
        BlocProvider(
          create: (context) => UnitUddCubit(UnitUddRepositoryImpl()),
        ),
        BlocProvider(
          create: (context) => JadwalDonorCubit(JadwalDonorRepositoryImpl()),
        ),
        BlocProvider(
          create: (context) => RegisterCubit(RegisterRemoteRepositoryImpl()),
        ),
        BlocProvider(
          create: (context) => JobCubit(JobRepositoryImpl()),
        ),
        BlocProvider(
          create: (context) => VillageCubit(VillageRepositoryImpl()),
        ),
        BlocProvider(
          create: (context) =>
              RiwayatDonorCubit(RiwayatDonorRemoteRepositoryImpl()),
        ),
        BlocProvider(
          create: (context) => KartuDonorCubit(
            KartuDonorRemoteRepositoryImpl(),
          ),
        ),
        BlocProvider(
          create: (context) => NotifikasiCubit(
            NotifikasiRemoteRepositoryImpl(),
          ),
        ),
        BlocProvider(
          create: (context) => NotifikasiDetailCubit(
            NotifikasiDetailRepositoryImpl(),
          ),
        ),
        BlocProvider(
          create: (context) => AgendaCubit(
            AgendaRemoteRepositoryImpl(),
          ),
        ),
        BlocProvider(
          create: (context) => CancelDonorCubit(CancelDonorRepositoryImpl()),
        ),
        BlocProvider(
          create: (context) => AgendaDetailCubit(
            AgendaDetailRepositoryImpl(),
          ),
        ),
        BlocProvider(
          create: (context) => ProfileCubit(ProfileRemoteRepositoryImpl()),
        ),
        BlocProvider(
          create: (context) => UploadImageCubit(UploadImageRepositoryImpl()),
        ),
        BlocProvider(
          create: (context) => LihatBuktiDonorCubit(
            LihatBuktiDonorRepositoryImpl(),
          ),
        ),
        BlocProvider(
          create: (context) => UpdateProfileCubit(
            UpdateProfileRemoteRepositoryImpl(),
          ),
        ),
        BlocProvider(
          create: (context) => DistrictCubit(
            DistrictRepositoryImpl(),
          ),
        ),
        BlocProvider(
          create: (context) => StockDarahCubit(StockDarahRepositoryImpl()),
        ),
        BlocProvider(
          create: (context) => DetailStockDarahCubit(
            StockDarahRepositoryImpl(),
          ),
        ),
        BlocProvider(
          create: (context) => ChangePasswordCubit(
            ChangePasswordRepositoryImpl(),
          ),
        ),
      ],
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, authStatus) {
          print('AUTHSTATE : ${authStatus}');
          if (authStatus == AuthState.isLoading ||
              authStatus == AuthState.refreshingToken) {
            return Container(
              color: Colors.white,
              child: const Center(
                child: CircularProgressIndicator(
                  color: redColor,
                ),
              ),
            );
          } else if (authStatus == AuthState.authenticated) {
            return const MateriapAppRouter(path: 'beranda');
          } else if (authStatus == AuthState.unauthenticated) {
            return const MateriapAppRouter(path: 'login');
          }
          return Container();
        },
      ),
    );
  }
}

class MateriapAppRouter extends StatelessWidget {
  final String path;
  const MateriapAppRouter({
    Key? key,
    required this.path,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter(path),
      title: 'Donor Darah',
      theme: ThemeData.light().copyWith(
        primaryColor: Colors.blue, // Warna header dan icon di DateTimePicker
        appBarTheme: AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle.light.copyWith(
            statusBarColor: const Color(0xffB31923),
            statusBarBrightness: Brightness.light,
          ),
        ),
        buttonTheme: const ButtonThemeData(
          textTheme: ButtonTextTheme.primary,
        ),
        colorScheme: const ColorScheme.light(
          primary: redColor,
        ).copyWith(
          secondary: Colors.blue,
        ), // Warna tombol "OK" di DateTimePicker
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
