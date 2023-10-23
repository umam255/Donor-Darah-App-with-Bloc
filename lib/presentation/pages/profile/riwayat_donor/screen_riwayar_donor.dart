import 'dart:io';
import 'package:donor_darah/presentation/navigation/routes.dart';
import 'package:donor_darah/presentation/pages/BLOC/lihat_bukti_donor/cubit/lihat_bukti_donor_cubit.dart';
import 'package:donor_darah/presentation/pages/profile/riwayat_donor/cubit/riwayat_donor_cubit.dart';
import 'package:donor_darah/utility/commons.dart';
import 'package:donor_darah/utility/custom_textStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

class ScreenRiwayatDonor extends StatefulWidget {
  const ScreenRiwayatDonor({super.key});

  @override
  State<ScreenRiwayatDonor> createState() => _ScreenRiwayatDonorState();
}

class _ScreenRiwayatDonorState extends State<ScreenRiwayatDonor> {
  File? _image;

  Future<void> _getImageFromCamera(String? idRiwayat) async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.camera);

    if (pickedImage != null) {
      setState(
        () {
          _image = File(pickedImage.path);
          context.goNamed(
            Routes.uploadBuktiDonorScreen,
            extra: {
              'image': _image,
              'idRiwayat': idRiwayat,
            },
          );
        },
      );
    }
  }

  Future<void> _getImageFromGallery(String? idRiwayat) async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
        context.goNamed(
          Routes.uploadBuktiDonorScreen,
          extra: {
            'image': _image,
            'idRiwayat': idRiwayat,
          },
        );
      });
    }
  }

  @override
  void initState() {
    super.initState();
    BlocProvider.of<RiwayatDonorCubit>(context).fetchRiwayatDonor();
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
          'Riwayat Donor',
          style: TextStyle(
            fontSize: width * 0.03,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: BlocBuilder<RiwayatDonorCubit, RiwayatDonorState>(
        builder: (context, riwayatDonorState) {
          if (riwayatDonorState is RiwayatDonorIsLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: redColor,
              ),
            );
          } else if (riwayatDonorState is RiwayatDonorIsSucces) {
            var data = riwayatDonorState.data;
            if (data.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Transform.scale(
                      scale: 1.2,
                      child: Image.asset(
                          'assets/Screen_kosong/Riwayat_kosong.png'),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: height * 0.02,
                        bottom: height * 0.03,
                      ),
                      child: Text(
                        'Anda belum melakukan donor darah',
                        style: TextStyle(
                          fontSize: width * 0.035,
                          color: const Color(0xFFCCCCCC),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        context.goNamed(Routes.uddPage);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: redColor,
                        elevation: 0,
                        fixedSize: Size(width * 0.5, height * 0.06),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            6.0,
                          ),
                        ),
                      ),
                      child: Text(
                        'Ajukan Donor Darah',
                        style: TextStyle(
                          fontSize: width * 0.035,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              );
            } else {
              return Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: height * 0.01,
                ),
                child: ListView.builder(
                  itemCount: riwayatDonorState.data.length,
                  itemBuilder: (context, index) {
                    final data = riwayatDonorState.data[index];
                    return Column(
                      children: [
                        const SizedBox(
                          height: 12,
                        ),
                        DetailRiwayatDonor(
                          text1: data.name,
                          text2: Commons().formatTanggal(data.date),
                          text3: data.donorProof != ''
                              ? 'Lihat Bukti Donor'
                              : 'Upload Bukti Donor',
                          color: data.donorProof != '' ? Colors.blue : redColor,
                          text4: data.type,
                          onTap: data.donorProof != ''
                              ? () {
                                  BlocProvider.of<LihatBuktiDonorCubit>(context)
                                      .fetchLihatBuktiDonor(
                                    data.id.toString(),
                                  );
                                  context.goNamed(Routes.lihatBuktiDonorScreen);
                                }
                              : () {
                                  showModalBottomSheet(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return IntrinsicHeight(
                                        child: Container(
                                          padding: const EdgeInsets.all(24),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text(
                                                'Pilih Foto',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              ListTile(
                                                contentPadding:
                                                    const EdgeInsets.only(
                                                  left: 0,
                                                ),
                                                minLeadingWidth: 0,
                                                leading: SvgPicture.asset(
                                                  'assets/images/take-picture/camera.svg',
                                                ),
                                                title: const Text('Ambil Foto'),
                                                onTap: () {
                                                  _getImageFromCamera(
                                                    data.id.toString(),
                                                  );
                                                  context.pop();
                                                },
                                              ),
                                              ListTile(
                                                onTap: () {
                                                  _getImageFromGallery(
                                                    data.id.toString(),
                                                  );
                                                  context.pop();
                                                },
                                                contentPadding:
                                                    const EdgeInsets.only(
                                                  left: 0,
                                                ),
                                                minLeadingWidth: 0,
                                                leading: SvgPicture.asset(
                                                  'assets/images/take-picture/gallery.svg',
                                                ),
                                                title: const Text('Gallery'),
                                              )
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                      ],
                    );
                  },
                ),
              );
            }
          } else if (riwayatDonorState is RiwayatDonorIsFailed) {
            return Center(
              child: Text(
                '$riwayatDonorState.message',
                style: const TextStyle(color: Colors.black),
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}

class DetailRiwayatDonor extends StatelessWidget {
  final String text1;
  final String text2;
  final String text3;
  final Color color;
  final String text4;

  void Function()? onTap;

  DetailRiwayatDonor({
    Key? key,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.color,
    required this.text4,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: const Color(0xffE6E6E6),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text1,
                style: TextStyle(
                  fontSize: width * 0.03,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Padding(padding: EdgeInsets.only(top: 5)),
              Text(
                text2,
                style: TextStyle(
                  fontSize: width * 0.025,
                  color: greyColor,
                ),
              ),
              const SizedBox(
                height: 31,
              ),
              InkWell(
                onTap: onTap,
                child: Text(
                  text3,
                  style: TextStyle(
                    fontFamily: "Plus Jakarta Sans",
                    fontSize: width * 0.025,
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
              ),
            ],
          ),
          Container(
            height: height * 0.03,
            width: width * 0.15,
            padding: const EdgeInsets.only(top: 6),
            decoration: BoxDecoration(
              color: const Color(0xFFCCCCCC),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              text4,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: width * 0.02,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
