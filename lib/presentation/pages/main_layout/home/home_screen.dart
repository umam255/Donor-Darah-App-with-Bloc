// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:donor_darah/presentation/navigation/routes.dart';
import 'package:donor_darah/presentation/pages/agenda/cubit/agenda_cubit.dart';
import 'package:donor_darah/presentation/pages/main_layout/home/shimmer.dart';
import 'package:donor_darah/presentation/pages/profile/profile/cubit/profile_cubit.dart';
import 'package:donor_darah/utility/custom_textStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';

class BerandaScreen extends StatefulWidget {
  const BerandaScreen({super.key});

  @override
  State<BerandaScreen> createState() => _BerandaScreenState();
}

class _BerandaScreenState extends State<BerandaScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ProfileCubit>(context).fetchProfile();
    BlocProvider.of<AgendaCubit>(context).fetchAgenda();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Theme.of(context).appBarTheme.backgroundColor,
      statusBarIconBrightness: Brightness.light,
    ));
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is ProfileIsLoading) {
          return const LoadingShimmer();
        } else if (state is ProfileIsSucces) {
          return SafeArea(
            child: Scaffold(
              body: Container(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Selamat Datang',
                      style: CustomStyle02(),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      state.data.name,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Color.fromRGBO(0, 0, 0, 1),
                        fontFamily: "Plus Jakarta Sans",
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () => context.goNamed(Routes.uddPage),
                          child: const DetailContainer(
                            image: "assets/images/jam.png",
                            text: "Jadwal Donor",
                          ),
                        ),
                        GestureDetector(
                          onTap: () =>
                              context.goNamed(Routes.uddStockDarahScreen),
                          child: const DetailContainer(
                            image: "assets/images/Blood.png",
                            text: "Stok Darah",
                          ),
                        ),
                        GestureDetector(
                          child: Container(
                            margin: const EdgeInsets.only(top: 30),
                            padding: const EdgeInsets.only(top: 10),
                            height: height * 0.14,
                            width: width * 0.26,
                            decoration: BoxDecoration(
                              color: white249Color,
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: const [
                                BoxShadow(
                                  offset: Offset(1, 1),
                                  spreadRadius: 0,
                                  blurRadius: 4,
                                  color: Color.fromRGBO(0, 0, 0, 0.25),
                                )
                              ],
                            ),
                            child: Column(
                              children: [
                                Container(
                                  height: height * 0.07,
                                  width: width * 0.15,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade300,
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: const [
                                      BoxShadow(
                                        offset: Offset(1, 1),
                                        spreadRadius: 0,
                                        blurRadius: 4,
                                        color: Color.fromRGBO(0, 0, 0, 0.25),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(height: height * 0.022),
                                Text(
                                  'Coming Soon',
                                  style: TextStyle(
                                    fontSize: width * 0.028,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // onTap: () => context.go('/berita'),
                          // child: const DetailContainer(
                          //   image: "assets/images/Globe.png",
                          //   text: "Coming soon",
                          // ),
                        )
                      ],
                    ),
                    //Button Ajukan Donor
                    Container(
                      margin: EdgeInsets.symmetric(vertical: height * 0.03),
                      height: height * 0.14,
                      decoration: BoxDecoration(
                        color: redColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              child: RichText(
                                text: TextSpan(
                                  text: "Sudahkah anda\nDonor Darah?",
                                  style: TextStyle(
                                    fontSize: width * 0.04,
                                    color: white255Color,
                                    fontFamily: "plus jakarta sans",
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                maxLines: 2,
                              ),
                            ),
                            SizedBox(
                              height: height * 0.06,
                              width: width * 0.35,
                              child: ElevatedButton(
                                onPressed: () {
                                  context.goNamed(Routes.uddPage);
                                },
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                      8,
                                    ),
                                  ),
                                  backgroundColor: white249Color,
                                ),
                                child: Text(
                                  'Ajukan Donor',
                                  style: CustomStyle2175(),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Text(
                      'Cooming soon',
                      style: CustomStyle04(),
                    ),
                    const SizedBox(height: 10),
                    Shimmer(
                      gradient: const LinearGradient(
                        colors: [
                          Color.fromARGB(31, 104, 104, 104),
                          Color.fromARGB(31, 104, 104, 104),
                        ],
                      ),
                      child: SingleChildScrollView(
                        physics: const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ShimmerLoading(
                                  height: height * 0.18,
                                  width: width * 0.35,
                                  circular: 6,
                                ),
                                const SizedBox(height: 10),
                                ShimmerLoading(
                                  height: height * 0.01,
                                  width: width * 0.35,
                                  circular: 50,
                                ),
                                const SizedBox(height: 10),
                                ShimmerLoading(
                                  height: height * 0.01,
                                  width: width * 0.25,
                                  circular: 50,
                                ),
                              ],
                            ),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ShimmerLoading(
                                  height: height * 0.18,
                                  width: width * 0.35,
                                  circular: 6,
                                ),
                                const SizedBox(height: 10),
                                ShimmerLoading(
                                  height: height * 0.01,
                                  width: width * 0.35,
                                  circular: 50,
                                ),
                                const SizedBox(height: 10),
                                ShimmerLoading(
                                  height: height * 0.01,
                                  width: width * 0.25,
                                  circular: 50,
                                ),
                              ],
                            ),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ShimmerLoading(
                                  height: height * 0.18,
                                  width: width * 0.35,
                                  circular: 6,
                                ),
                                const SizedBox(height: 10),
                                ShimmerLoading(
                                  height: height * 0.01,
                                  width: width * 0.35,
                                  circular: 50,
                                ),
                                const SizedBox(height: 10),
                                ShimmerLoading(
                                  height: height * 0.01,
                                  width: width * 0.25,
                                  circular: 50,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Column(
                    //   crossAxisAlignment: CrossAxisAlignment.start,
                    //   children: [
                    //     Text(
                    //       'Cooming soon',
                    //       style: CustomStyle04(),
                    //     ),
                    //     SizedBox(
                    //       height: height * 0.01,
                    //     ),
                    //     SizedBox(
                    //       height: height * 0.24,
                    //       child: SingleChildScrollView(
                    //         scrollDirection: Axis.horizontal,
                    //         child: Row(
                    //           children: const [
                    //             DetailSlide(
                    //               image: "assets/images/DD 3.png",
                    //               text:
                    //                   "Jusuf Kalla Lantik Pengurus PMI Kalbar 2022-2027",
                    //             ),
                    //             DetailSlide(
                    //               image: "assets/images/DD 2.png",
                    //               text:
                    //                   "Sambut Hari Bhakti Imigrasi ke-73, Kanim Sanggau Gelar Donor Darah Sukarela",
                    //             ),
                    //             DetailSlide(
                    //               image: "assets/images/DD 4.png",
                    //               text:
                    //                   "Peringati HUT Polwan Ke 74, Polwan Polres Ketapang Gelar Bakti Sosial Donor Darah",
                    //             ),
                    //           ],
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // )
                  ],
                ),
              ),
            ),
          );
        } else if (state is ProfileIsFailed) {
          return Center(
            child: Text(state.message!),
          );
        } else {
          return Container();
        }
      },
    );
  }
}

class DetailSlide extends StatelessWidget {
  final String image;
  final String text;

  const DetailSlide({
    Key? key,
    required this.image,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      width: width * 0.43,
      padding: const EdgeInsets.only(right: 16),
      child: Column(
        children: [
          Image(
            image: AssetImage(
              image,
            ),
            height: height * 0.14,
            width: width,
            fit: BoxFit.fill,
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            text,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: CustomStyle262(),
          ),
        ],
      ),
    );
  }
}

class DetailContainer extends StatelessWidget {
  final String text;
  final String image;
  const DetailContainer({
    Key? key,
    required this.text,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      height: 120,
      width: MediaQuery.of(context).size.width * 0.26,
      decoration: BoxDecoration(
        color: white249Color,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
              offset: Offset(1, 1),
              spreadRadius: 0,
              blurRadius: 4,
              color: Color.fromRGBO(0, 0, 0, 0.25))
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 10),
            height: 60,
            width: 70,
            decoration: BoxDecoration(
                color: white214Color, borderRadius: BorderRadius.circular(4)),
            child: Stack(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 40),
                  decoration: const BoxDecoration(
                    color: yellowColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(4),
                      bottomRight: Radius.circular(4),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15, left: 20),
                  child: Image(
                    image: AssetImage(image),
                    height: 35,
                    width: 35,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 18,
          ),
          InkWell(
            child: Text(
              text,
              style: CustomStyle263(),
            ),
          ),
        ],
      ),
    );
  }
}
