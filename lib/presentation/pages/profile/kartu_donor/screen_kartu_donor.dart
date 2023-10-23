// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace, non_constant_identifier_names, prefer_typing_uninitialized_variables, avoid_print, must_be_immutable, unused_local_variable

import 'dart:ui' as ui;
import 'package:donor_darah/presentation/pages/profile/kartu_donor/cubit/kartu_donor_cubit.dart';
import 'package:donor_darah/utility/commons.dart';
import 'package:go_router/go_router.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:donor_darah/utility/custom_textStyle.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:permission_handler/permission_handler.dart';

class ScreenKartuDonor extends StatefulWidget {
  const ScreenKartuDonor({super.key});

  @override
  State<ScreenKartuDonor> createState() => _ScreenKartuDonorState();
}

class _ScreenKartuDonorState extends State<ScreenKartuDonor> {
  final GlobalKey _cardKey = GlobalKey();

  @override
  void initState() {
    BlocProvider.of<KartuDonorCubit>(context).fetchKartuDonor();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return BlocBuilder<KartuDonorCubit, KartuDonorState>(
      builder: (context, state) {
        if (state is KartuDonorIsLoading) {
          return const Center(
            child: CircularProgressIndicator(
              color: redColor,
            ),
          );
        } else if (state is KartuDonorIsSucces) {
          return Scaffold(
            appBar: AppBar(
              leading: const BackButton(
                color: Colors.black,
              ),
              title: Text(
                'Kartu Donor Darah',
                style: TextStyle(
                  fontSize: width * 0.03,
                  color: Colors.black,
                ),
              ),
              backgroundColor: Colors.white,
            ),
            body: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  RepaintBoundary(
                    key: _cardKey,
                    child: Container(
                      height: height * 0.3,
                      width: width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey
                                .withOpacity(0.5), // Color of the shadow
                            spreadRadius: 0, // Spread radius
                            blurRadius: 8, // Blur radius
                            // offset: Offset(0, 3), // Offset in x and y direction
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Stack(
                          children: [
                            Positioned(
                              top: 0,
                              bottom: 0,
                              left: 0,
                              right: width / 3,
                              child: ClipPath(
                                clipper: MyClipPath(),
                                child: Container(
                                  padding:
                                      const EdgeInsets.only(left: 12, top: 24),
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(12),
                                      bottomLeft: Radius.circular(12),
                                    ),
                                    color: redColor,
                                  ),
                                  width: width / 2.5,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Kartu Donor Darah",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: width * 0.035,
                                          // fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      Text(
                                        state.data.name,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: width * 0.03,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        Commons().formatDate(
                                          state.data.dateOfBirth,
                                        ),
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: width * 0.02,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 12,
                              bottom: 10,
                              child: Text(
                                "Unit Donor Darah PMI Ketapang",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: width * 0.025,
                                  // fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Positioned(
                              top: 0,
                              right: 0,
                              child: SvgPicture.asset(
                                'assets/kartu_donor/kananAtas.svg',
                                height: 50,
                              ),
                            ),
                            Positioned(
                              top: 120,
                              right: 12,
                              child: Text(
                                state.data.memberCode,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: width * 0.025,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 10,
                              right: 10,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset(
                                    'assets/kartu_donor/kananBawah.png',
                                    height: 30,
                                    fit: BoxFit.contain,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      await [Permission.storage].request();
                      // ignore: use_build_context_synchronously
                      RenderRepaintBoundary boundary = _cardKey.currentContext!
                          .findRenderObject() as RenderRepaintBoundary;

                      showDialog(
                        barrierColor: const ui.Color.fromARGB(
                          218,
                          255,
                          255,
                          255,
                        ),
                        context: context,
                        builder: (BuildContext context) {
                          return const PercentIndicator();
                        },
                      );

                      ui.Image image = await boundary.toImage(pixelRatio: 5.0);
                      ByteData? byteData = await (image.toByteData(
                          format: ui.ImageByteFormat.png));

                      if (byteData != null) {
                        final result = await ImageGallerySaver.saveImage(
                          byteData.buffer.asUint8List(),
                        );
                        print(result);
                        if (result['isSuccess']) {
                          // ignore: use_build_context_synchronously
                          Navigator.of(context).pop();
                          // ignore: use_build_context_synchronously
                          Commons().showFlashMessage(
                              context, 'Kartu Donor Berhasil DiUnduh');
                          print('Image saved to gallery.');
                        } else {
                          print('Failed to save image to gallery.');
                        }
                      }
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                        top: height * 0.05,
                      ),
                      alignment: Alignment.center,
                      height: height * 0.07,
                      width: width,
                      decoration: BoxDecoration(
                        color: redColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Text(
                        'Unduh Kartu Donor',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        }
        return Container();
      },
    );
  }
}

class PercentIndicator extends StatelessWidget {
  const PercentIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: 120.0,
      lineWidth: 13.0,
      animation: true,
      percent: 1.0,
      center: const Text(
        "100%",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
      ),
      footer: const Text(
        "Downloading",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
      ),
      circularStrokeCap: CircularStrokeCap.round,
      progressColor: redColor,
    );
  }
}

class MyClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;
    final path = Path();

    //atas ke bawah
    path.lineTo(0, h);
    //bawah kiri ke kanan
    path.lineTo(w, h);
    // kanan bawah ke atas
    // path.lineTo(w, 0);
    path.quadraticBezierTo(
      w - 80,
      h * 0.5,
      w,
      0,
    );
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
