// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace, non_constant_identifier_names, prefer_typing_uninitialized_variables, avoid_print, must_be_immutable, unused_local_variable

import 'package:donor_darah/utility/custom_textStyle.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScreenUDD extends StatefulWidget {
  const ScreenUDD({super.key});

  @override
  State<ScreenUDD> createState() => _ScreenUDDState();
}

class _ScreenUDDState extends State<ScreenUDD> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: white249Color,
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(48),
            child: AppBar(
              shadowColor: const Color.fromRGBO(0, 0, 0, 0.25),
              backgroundColor: white249Color,
              flexibleSpace: Positioned(
                child: Padding(
                  padding: const EdgeInsets.only(top: 17.67, left: 10),
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.arrow_back,
                            size: 20,
                            color: black01Color,
                          )),
                      Text(
                        "Pilih UDD",
                        style: CustomStyle04(),
                      ),
                    ],
                  ),
                ),
              ),
            )),
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
              padding: const EdgeInsets.fromLTRB(24, 16, 152, 0),
              child: const Text(
                "Daftar Unit Donor Darah",
                style: TextStyle(
                    color: black01Color,
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    fontFamily: "plus jakarta sans"),
              )),
          const SizedBox(
            height: 24,
          ),
          DaftarUDD(
            text: "UDD PMI Ketapang",
            onTap: () => context.go('/stokdarah'),
          ),
          const SizedBox(height: 12),
          DaftarUDD(
            text: "UDD PMI Ketapang 2",
            onTap: () {},
          ),
          const SizedBox(height: 12),
          DaftarUDD(
            text: "UDD PMI Ketapang 3",
            onTap: () {},
          ),
          const SizedBox(height: 12),
          DaftarUDD(
            text: "UDD PMI Ketapang 4",
            onTap: () {},
          ),
        ]));
  }
}

class DaftarUDD extends StatelessWidget {
  final String text;

  final void Function()? onTap;
  const DaftarUDD({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 24),
      height: 50,
      width: 312,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: white204Color,
        ),
        color: white249Color,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Image(image: AssetImage("assets/images/DD38.png")),
              ),
              const SizedBox(
                width: 14,
              ),
              Text(
                text,
                style: CustomStyle267(),
              ),
            ],
          ),
          IconButton(
              onPressed: onTap,
              icon: const Icon(Icons.arrow_forward_ios_rounded,
                  size: 16, color: greyColor))
        ],
      ),
    );
  }
}
