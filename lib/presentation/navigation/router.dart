// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'package.dart';

GoRouter appRouter(String path) {
  return GoRouter(
    initialLocation: '/$path',
    routes: [
      GoRoute(
        path: '/beranda',
        name: Routes.berandaScreen,
        builder: (context, state) {
          return const MainLayoutScreen(indexScreen: 0);
        },
        routes: [
          GoRoute(
            path: 'udd-screen',
            name: Routes.uddPage,
            builder: (context, state) {
              context.read<AuthCubit>().checkToken();
              return const UddPage(stockDarah: false);
            },
            routes: [
              GoRoute(
                path: 'jadwal-donor',
                name: Routes.jadwalDonorPage,
                builder: (context, state) {
                  return const JadwalDonorPage();
                },
                routes: [
                  GoRoute(
                    path: 'detail-jadwal-donor',
                    name: Routes.detailJadwalPage,
                    builder: (context, state) {
                      return const DetailJadwalPage();
                    },
                    routes: [
                      GoRoute(
                        path: 'questionaire',
                        name: Routes.questionerPage,
                        builder: (context, state) => const QuestionairePage(),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          GoRoute(
            path: "udd-stockdarah-screen",
            name: Routes.uddStockDarahScreen,
            builder: (context, state) => const UddPage(stockDarah: true),
            routes: [
              GoRoute(
                path: "stokdarah",
                name: Routes.screenstokdarah,
                builder: (context, state) {
                  int? unitId;
                  if (state.extra is int) {
                    unitId = state.extra as int;
                  }
                  BlocProvider.of<StockDarahCubit>(context).fetchStockDarah(
                    unitId: unitId ?? 0,
                  );
                  BlocProvider.of<UnitUddCubit>(context).fetchUnitUdd();
                  return ScreenStokDarah(
                    unitId: unitId ?? 0,
                  );
                },
                routes: [
                  GoRoute(
                    path: "stokdarahA",
                    name: Routes.screenstokdarahA,
                    builder: (context, state) {
                      Map<String, dynamic> data =
                          state.extra as Map<String, dynamic>;
                      BlocProvider.of<DetailStockDarahCubit>(context)
                          .fetchDetailStock(id: data['id'] ?? 0);
                      return ScreenStokDarahA(
                        tittle: data['tittle'] ?? '',
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: '/agenda',
        name: Routes.agendaScreen,
        builder: (context, state) {
          return const MainLayoutScreen(indexScreen: 1);
        },
        routes: [
          GoRoute(
            path: "agenda-detail-screen",
            name: Routes.agendaDetailScreen,
            builder: (context, state) {
              int idAgenda = state.extra as int;
              return DetailAgendaScreen(idAgenda: idAgenda.toString());
            },
          ),
        ],
      ),
      GoRoute(
        path: '/notifikasi',
        name: Routes.notifikasiScreen,
        builder: (context, state) {
          return const MainLayoutScreen(indexScreen: 2);
        },
        routes: [
          GoRoute(
            path: 'notifikasi-detail-screen',
            name: Routes.notifikasiDetailScreen,
            builder: (context, state) {
              return const NotifikasiDetailScreen();
            },
          ),
        ],
      ),
      GoRoute(
        path: '/akun',
        name: Routes.profileScreen,
        builder: (context, state) {
          return const MainLayoutScreen(indexScreen: 3);
        },
        routes: [
          GoRoute(
            path: "ubahsandi",
            name: Routes.screenubahsandi,
            builder: (context, state) => const ScreenUbahSandi(),
          ),
          GoRoute(
            path: "editprofil",
            name: Routes.screeneditprofil,
            builder: (context, state) {
              final userData = state.extra as UserDataModel;
              return ScreenEditProfil(userData: userData);
            },
          ),
          GoRoute(
            path: "riwayatdonor",
            name: Routes.screenriwayatdonor,
            builder: (context, state) {
              return const ScreenRiwayatDonor();
            },
            routes: [
              GoRoute(
                path: "lihat-bukti-donor-screen",
                name: Routes.lihatBuktiDonorScreen,
                builder: (context, state) {
                  return const ScreenBuktiDonor();
                },
              ),
              GoRoute(
                path: "upload-bukti-donor-screen",
                name: Routes.uploadBuktiDonorScreen,
                builder: (context, state) {
                  Map<String, dynamic> data =
                      state.extra as Map<String, dynamic>;
                  return ScreenUploadBuktiDonor(
                    image: data['image'] as File,
                    idRiwayat: data['idRiwayat'] as String,
                  );
                },
              ),
            ],
          ),
          GoRoute(
            path: "kartudonor",
            name: Routes.screenkartudonor,
            builder: (context, state) {
              return const ScreenKartuDonor();
            },
          ),
        ],
      ),
      GoRoute(
        path: '/login',
        name: Routes.loginPage,
        builder: (context, state) {
          return const LoginPage();
        },
        routes: [
          GoRoute(
            path: 'lupa-password',
            name: Routes.lupaPasswordPage,
            builder: (context, state) => const LupaPasswordPage(),
          ),
          GoRoute(
            path: "register",
            name: Routes.screenReg,
            builder: (context, state) {
              return const ScreenRegister();
            },
            routes: [
              GoRoute(
                path: "step2",
                name: Routes.screenRegA,
                builder: (context, state) {
                  return const ScreenRegisterAlamat();
                },
                routes: [
                  GoRoute(
                    path: "step3",
                    name: Routes.screenRegS,
                    builder: (context, state) {
                      return const ScreenRegisterSandi();
                    },
                  )
                ],
              )
            ],
          ),

          //Menu
        ],
      ),
      // GoRoute(
      //   path: "/berita",
      //   name: Routes.detailinfoberita,
      //   builder: (context, state) => const DetailInfoBerita(),
      // ),
    ],
  );
}
