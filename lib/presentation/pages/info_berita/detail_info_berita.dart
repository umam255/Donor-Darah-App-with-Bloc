// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace, non_constant_identifier_names, prefer_typing_uninitialized_variables, avoid_print

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../utility/custom_textStyle.dart';

class DetailInfoBerita extends StatefulWidget {
  const DetailInfoBerita({super.key});

  @override
  State<DetailInfoBerita> createState() => _DetailInfoBeritaState();
}

class _DetailInfoBeritaState extends State<DetailInfoBerita> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: white249Color,
        appBar: AppBar(
            backgroundColor: white249Color,
            leading: IconButton(
              iconSize: 20,
              onPressed: () => context.go('/'),
              icon: const Icon(Icons.arrow_back),
              color: black01Color,
            ),
            title: const Text("Info & Berita",
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontSize: 12,
                    fontFamily: "Plus Jakarta Sans",
                    color: black01Color,
                    fontWeight: FontWeight.w500)),
            toolbarHeight: 45,
            bottom: const TabBar(
              indicatorColor: redColor,
              labelColor: redColor,
              labelStyle: TextStyle(
                  letterSpacing: 0.2,
                  fontSize: 14,
                  fontFamily: "Plus Jakarta Sans",
                  fontWeight: FontWeight.w600),
              tabs: [
                Tab(
                  text: "Berita",
                ),
                Tab(
                  text: "Edukasi",
                ),
                Tab(
                  text: "Kegiatan",
                ),
              ],
            )),
        body: TabBarView(children: [
          Container(
            padding: const EdgeInsets.only(top: 23, left: 24),
            color: white249Color,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Image(image: AssetImage("assets/images/DD22.png")),
                    Container(
                        padding: const EdgeInsets.fromLTRB(14, 0, 0, 32),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                                padding:
                                    const EdgeInsets.fromLTRB(0, 0, 78, 10),
                                child: const Text("23 Januari 2023",
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontFamily: "Plus Jakarta Sans",
                                        color: greyColor,
                                        fontWeight: FontWeight.w500))),
                            Container(
                              child: const Text(
                                  "Jusuf Kalla Lantik Pengurus\nPMI Kalbar 2022 - 2027",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: "Plus Jakarta Sans",
                                      color: black26Color,
                                      fontWeight: FontWeight.w500)),
                            )
                          ],
                        )),
                  ],
                ),
                const SizedBox(
                  height: 2,
                ),
                const Divider(
                  endIndent: 24,
                  color: white230Color,
                ),
                const SizedBox(
                  height: 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Image(image: AssetImage("assets/images/DD23.png")),
                    Container(
                        padding: const EdgeInsets.fromLTRB(14, 0, 0, 19),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                                padding:
                                    const EdgeInsets.fromLTRB(0, 0, 78, 10),
                                child: const Text("23 Januari 2023",
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontFamily: "Plus Jakarta Sans",
                                        color: greyColor,
                                        fontWeight: FontWeight.w500))),
                            Container(
                              child: const Text(
                                  "Sambut Hari Bhakti Imigrasi\nke-73, Kanim Sanggau Gelar\nDonor Darah Sukarela",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: "Plus Jakarta Sans",
                                      color: black26Color,
                                      fontWeight: FontWeight.w500)),
                            )
                          ],
                        )),
                  ],
                ),
                const SizedBox(
                  height: 2,
                ),
                const Divider(
                  endIndent: 24,
                  color: white230Color,
                ),
                const SizedBox(
                  height: 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Image(image: AssetImage("assets/images/DD24.png")),
                    Container(
                        padding: const EdgeInsets.fromLTRB(14, 0, 0, 19),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                                padding:
                                    const EdgeInsets.fromLTRB(0, 0, 90, 10),
                                child: const Text("23 Januari 2023",
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontFamily: "Plus Jakarta Sans",
                                        color: greyColor,
                                        fontWeight: FontWeight.w500))),
                            Container(
                              child: const Text(
                                  "Peringati HUT Polwan Ke – 74,\nPolwan Polres Ketapang Gelar\nBakti Sosial Donor Darah",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: "Plus Jakarta Sans",
                                      color: black26Color,
                                      fontWeight: FontWeight.w500)),
                            )
                          ],
                        )),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 23, left: 24),
            color: white249Color,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Image(image: AssetImage("assets/images/DD25.png")),
                    Container(
                        padding: const EdgeInsets.fromLTRB(14, 0, 0, 32),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                                padding:
                                    const EdgeInsets.fromLTRB(0, 0, 70, 10),
                                child: const Text("23 Januari 2023",
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontFamily: "Plus Jakarta Sans",
                                        color: greyColor,
                                        fontWeight: FontWeight.w500))),
                            Container(
                              child: const Text(
                                  "5 Cara Menghindari Stress\nDengan Sehat !",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: "Plus Jakarta Sans",
                                      color: black26Color,
                                      fontWeight: FontWeight.w500)),
                            )
                          ],
                        )),
                  ],
                ),
                const SizedBox(
                  height: 2,
                ),
                const Divider(
                  endIndent: 24,
                  color: white230Color,
                ),
                const SizedBox(
                  height: 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Image(
                      image: AssetImage("assets/images/DD26.png"),
                    ),
                    Container(
                        padding: const EdgeInsets.fromLTRB(14, 0, 0, 19),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                                padding:
                                    const EdgeInsets.fromLTRB(0, 0, 87, 10),
                                child: const Text("23 Januari 2023",
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontFamily: "Plus Jakarta Sans",
                                        color: greyColor,
                                        fontWeight: FontWeight.w500))),
                            Container(
                              child: const Text(
                                  "12 Makanan Penyebab Asam\nLambung Naik dan Pantangan\nyang Harus Dihindari",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: "Plus Jakarta Sans",
                                      color: black26Color,
                                      fontWeight: FontWeight.w500)),
                            )
                          ],
                        )),
                  ],
                ),
                const SizedBox(
                  height: 2,
                ),
                const Divider(
                  endIndent: 24,
                  color: white230Color,
                ),
                const SizedBox(
                  height: 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Image(image: AssetImage("assets/images/DD27.png")),
                    Container(
                        padding: const EdgeInsets.fromLTRB(14, 0, 0, 30),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                                padding:
                                    const EdgeInsets.fromLTRB(0, 0, 90, 10),
                                child: const Text("23 Januari 2023",
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontFamily: "Plus Jakarta Sans",
                                        color: greyColor,
                                        fontWeight: FontWeight.w500))),
                            Container(
                              child: const Text(
                                  "9 Vitamin dan Suplemen untuk\nPenderita Asam Lambung",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: "Plus Jakarta Sans",
                                      color: black26Color,
                                      fontWeight: FontWeight.w500)),
                            )
                          ],
                        )),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 67, left: 0, right: 0),
            color: white249Color,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    padding: const EdgeInsets.only(left: 128, right: 128),
                    child: const Image(
                        image: AssetImage("assets/images/DD28.png"))),
                Container(
                  padding:
                      const EdgeInsets.only(top: 30, left: 120, right: 117),
                  child: const Text("Belum ada kegiatan",
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: "Plus Jakarta Sans",
                          color: white204Color,
                          fontWeight: FontWeight.w500)),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
