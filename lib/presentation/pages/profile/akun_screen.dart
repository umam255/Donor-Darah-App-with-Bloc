// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import 'package:donor_darah/presentation/navigation/routes.dart';
import 'package:donor_darah/presentation/pages/profile/model/user_model.dart';
import 'package:donor_darah/presentation/pages/profile/profile/cubit/profile_cubit.dart';
import 'package:donor_darah/utility/auth/auth_cubit.dart';
import 'package:donor_darah/utility/custom_textStyle.dart';

class AkunScreen extends StatefulWidget {
  const AkunScreen({super.key});

  @override
  State<AkunScreen> createState() => _AkunScreenState();
}

class _AkunScreenState extends State<AkunScreen> {
  UserDataModel? _dataUser;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is ProfileIsLoading) {
          return const Center(
            child: CircularProgressIndicator(
              color: redColor,
            ),
          );
        } else if (state is ProfileIsSucces) {
          final data = state.data;
          final userData = state.data.user;
          _dataUser = UserDataModel(
            userData.id,
            data.urlImage,
            userData.name,
            userData.email,
            userData.phone,
            userData.jobId,
            userData.unitId,
            userData.placeOfBirth,
            userData.dateOfBirth,
            userData.gender,
            userData.subDistrictId,
            userData.villageId,
            userData.address,
            userData.postalCode,
            userData.role,
            userData.memberCode,
            SubDistrict(
              id: userData.subDistrict.id,
              code: userData.subDistrict.code,
              name: userData.subDistrict.name,
            ),
            Village(
              id: userData.village.id,
              subDistrictId: userData.village.subDistrictId,
              code: userData.village.code,
              name: userData.village.name,
            ),
          );

          return Scaffold(
            appBar: AppBar(
              toolbarHeight: height * 0.15,
              elevation: 0,
              backgroundColor: const Color(0xffD91E2A),
              title: Row(
                children: [
                  GestureDetector(
                    onTap: data.urlImage.isEmpty
                        ? null
                        : () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return ShowImage(content: data.urlImage);
                              },
                            );
                          },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: data.urlImage != ''
                          ? CircleAvatar(
                              backgroundImage: NetworkImage(data.urlImage),
                              backgroundColor: greyColor,
                              maxRadius: 30,
                            )
                          : CircleAvatar(
                              backgroundColor: greyColor,
                              maxRadius: 30,
                              child: Transform.scale(
                                scale: 1.2,
                                child: SvgPicture.asset(
                                  'assets/images/take-picture/Foto_profile_kosong.svg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data.name,
                        style: TextStyle(
                          fontSize: width * 0.03,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        data.memberCode,
                        style: TextStyle(
                          fontSize: width * 0.02,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: IconButton(
                    icon: const Icon(Icons.edit_outlined),
                    iconSize: width * 0.07,
                    onPressed: () {
                      context.goNamed(
                        Routes.screeneditprofil,
                        extra: _dataUser,
                      );
                    },
                  ),
                ),
              ],
            ),
            body: Stack(
              children: <Widget>[
                Container(
                  color: const Color(0XFFD91E2A),
                  height: height * 0.05,
                ),
                Positioned(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 24,
                      right: 24,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Material(
                              elevation: 4,
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.white,
                              child: Container(
                                width: width * 0.25,
                                height: height * 0.12,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Total Donor',
                                      style: TextStyle(
                                        fontSize: width * 0.03,
                                      ),
                                    ),
                                    SizedBox(height: height * 0.02),
                                    Text(
                                      '${data.totalDonor}',
                                      style: TextStyle(
                                        fontSize: width * 0.04,
                                        color: redColor,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(width: width * 0.02),
                            Expanded(
                              child: Material(
                                elevation: 4,
                                borderRadius: BorderRadius.circular(8),
                                child: SizedBox(
                                  height: height * 0.12,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 15,
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Terakhir Donor',
                                              style: TextStyle(
                                                fontSize: width * 0.023,
                                              ),
                                            ),
                                            Text(
                                              data.lastDonor,
                                              style: TextStyle(
                                                fontSize: width * 0.023,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            )
                                          ],
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                            vertical: height * 0.01,
                                          ),
                                          child: const Divider(
                                            height: 10,
                                            color: Colors.grey,
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Donor Selanjutnya',
                                              style: TextStyle(
                                                  fontSize: width * 0.023),
                                            ),
                                            Text(
                                              data.nextDonor,
                                              style: TextStyle(
                                                fontSize: width * 0.023,
                                                fontWeight: FontWeight.bold,
                                                color: redColor,
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: height * 0.04),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade400,
                                blurRadius: 4, // Jumlah kabur pada bayangan
                                spreadRadius: 0, // Seberapa luas bayangan
                              ),
                            ],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: SizedBox(
                            height: height * 0.08,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Row(
                                children: [
                                  Image.asset(
                                    'assets/images/DD10.png',
                                    scale: 0.9,
                                  ),
                                  const SizedBox(
                                    width: 12,
                                  ),
                                  Text(
                                    'Kartu Donor',
                                    style: TextStyle(
                                      fontSize: width * 0.03,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Expanded(child: SizedBox()),
                                  IconButton(
                                    onPressed: () {
                                      context.goNamed(Routes.screenkartudonor);
                                    },
                                    icon: const Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      size: 18,
                                      color: greyColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: height * 0.03),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade400,
                                blurRadius: 4, // Jumlah kabur pada bayangan
                                spreadRadius: 0, // Seberapa luas bayangan
                              ),
                            ],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: SizedBox(
                            height: height * 0.08,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Row(
                                children: [
                                  Image.asset(
                                    'assets/images/DD12.png',
                                    scale: 0.9,
                                  ),
                                  const SizedBox(
                                    width: 12,
                                  ),
                                  Text(
                                    'Riwayat Donor',
                                    style: TextStyle(
                                      fontSize: width * 0.03,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Expanded(child: SizedBox()),
                                  IconButton(
                                    onPressed: () {
                                      context
                                          .goNamed(Routes.screenriwayatdonor);
                                    },
                                    icon: const Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      size: 18,
                                      color: greyColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: height * 0.03),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade400,
                                blurRadius: 4, // Jumlah kabur pada bayangan
                                spreadRadius: 0, // Seberapa luas bayangan
                              ),
                            ],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: SizedBox(
                            height: height * 0.08,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Row(
                                children: [
                                  Image.asset(
                                    'assets/images/DD13.png',
                                    scale: 0.9,
                                  ),
                                  const SizedBox(
                                    width: 12,
                                  ),
                                  Text(
                                    'Ubah Kata Sandi',
                                    style: TextStyle(
                                      fontSize: width * 0.03,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Expanded(child: SizedBox()),
                                  IconButton(
                                    onPressed: () {
                                      context.goNamed(Routes.screenubahsandi);
                                    },
                                    icon: const Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      size: 18,
                                      color: greyColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: height * 0.03),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade400,
                                blurRadius: 4, // Jumlah kabur pada bayangan
                                spreadRadius: 0, // Seberapa luas bayangan
                              ),
                            ],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: SizedBox(
                            height: height * 0.08,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Row(
                                children: [
                                  Image.asset(
                                    'assets/images/DD9.png',
                                    scale: 0.9,
                                  ),
                                  const SizedBox(
                                    width: 12,
                                  ),
                                  Text(
                                    'Keluar',
                                    style: TextStyle(
                                      fontSize: width * 0.03,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Expanded(child: SizedBox()),
                                  IconButton(
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                            actionsPadding:
                                                const EdgeInsets.only(
                                              right: 24,
                                              bottom: 24,
                                            ),
                                            contentPadding:
                                                const EdgeInsets.all(
                                              24,
                                            ),
                                            title: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'Keluar Dari Akun',
                                                  style: TextStyle(
                                                    fontSize: width * 0.035,
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child:
                                                      const Icon(Icons.close),
                                                )
                                              ],
                                            ),
                                            content: SizedBox(
                                              height: height * 0.15,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: const [
                                                  Text(
                                                    'Jika Anda keluar, anda tidak akan mendapatkan notifikasi jadwal kembali donor',
                                                  ),
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                  Text('Yakin ingin keluar ?')
                                                ],
                                              ),
                                            ),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Text(
                                                  'Batal',
                                                  style: TextStyle(
                                                    color: redColor,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: width * 0.035,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      12,
                                                    ),
                                                  ),
                                                  fixedSize: Size(
                                                    width * 0.25,
                                                    height * 0.06,
                                                  ),
                                                ),
                                                onPressed: () {
                                                  BlocProvider.of<AuthCubit>(
                                                          context)
                                                      .logOut();
                                                  // context.goNamed(
                                                  //   Routes.loginPage,
                                                  // );
                                                },
                                                child: Text(
                                                  "Keluar",
                                                  style: TextStyle(
                                                    fontSize: width * 0.035,
                                                  ),
                                                ),
                                              )
                                            ],
                                          );
                                        },
                                      );
                                    },
                                    icon: const Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      size: 18,
                                      color: greyColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}

class ShowImage extends StatelessWidget {
  final String content;
  const ShowImage({
    Key? key,
    required this.content,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Image.network(content),
    );
  }
}
