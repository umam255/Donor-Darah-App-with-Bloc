// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace, non_constant_identifier_names, prefer_typing_uninitialized_variables, avoid_print, must_be_immutable, unused_local_variable

import 'package:donor_darah/utility/custom_textStyle.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScreenRiwayatDonorK extends StatefulWidget {
  const ScreenRiwayatDonorK({super.key});

  @override
  State<ScreenRiwayatDonorK> createState() => _ScreenRiwayatDonorKState();
}

class _ScreenRiwayatDonorKState extends State<ScreenRiwayatDonorK> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(48),
            child: AppBar(
              shadowColor: const Color.fromRGBO(0, 0, 0, 0.25),
              backgroundColor: const Color.fromRGBO(249, 249, 249, 1),
              flexibleSpace: Positioned(
                child: Padding(
                  padding: const EdgeInsets.only(top: 17.67, left: 14),
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () => context.go('/'),
                          icon: const Icon(
                            Icons.arrow_back,
                            size: 20,
                            color: Color.fromRGBO(0, 0, 0, 1),
                          )),
                      Text(
                        "Riwayat Donor",
                        style: CustomStyle04(),
                      ),
                    ],
                  ),
                ),
              ),
            )),
        backgroundColor: const Color.fromRGBO(249, 249, 249, 1),
        body: Column(children: [
          Container(
            margin: const EdgeInsets.fromLTRB(128, 111, 128, 0),
            child: const Image(
              image: AssetImage("assets/images/DD30.png"),
              height: 80,
              width: 82,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(80, 0, 80, 0),
            child: Text("Anda belum melakukan\ndonor darah",
                textAlign: TextAlign.center, style: CustomStyle2042()),
          ),
          const SizedBox(
            height: 53,
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromRGBO(217, 34, 42, 1),
              padding: const EdgeInsets.fromLTRB(24, 12, 24, 12),
            ),
            child: Text(
              "Ajukan Donor Darah",
              style: CustomStyle2493(),
            ),
          )
        ]));
  }
}
