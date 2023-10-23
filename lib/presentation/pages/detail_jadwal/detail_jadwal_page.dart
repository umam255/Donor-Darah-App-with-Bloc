// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:donor_darah/controller/my_controller.dart';
import 'package:donor_darah/presentation/pages/pernyataan/pernyataan_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class DetailJadwalPage extends StatefulWidget {
  const DetailJadwalPage({
    Key? key,
  }) : super(key: key);

  @override
  State<DetailJadwalPage> createState() => _DetailJadwalPageState();
}

class _DetailJadwalPageState extends State<DetailJadwalPage> {
  final DonorController _donorController = Get.find<DonorController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        leading: const BackButton(
          color: Colors.black,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 24, right: 24, top: 14),
        child: Column(
          children: [
            Container(
              height: 96,
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color(0xffE6E6E6),
                ),
              ),
              padding: const EdgeInsets.only(left: 12, top: 14),
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/udd_icon.png',
                        height: 32,
                        width: 32,
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Text(
                          _donorController.jadwalDonorData!.name,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: null,
                      child: Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(4),
                          ),
                          color: Color(0xffCCCCCC),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 6, horizontal: 8),
                        child: Text(
                          _donorController.jadwalDonorData!.type,
                          style: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 28),
            Row(
              children: [
                Image.asset('assets/images/kalender_black_icon.png'),
                const SizedBox(width: 10),
                Text(_donorController.jadwalDonorData!.date),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Image.asset('assets/images/jam_icon.png'),
                const SizedBox(width: 10),
                Text(_donorController.jadwalDonorData!.time),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Image.asset('assets/images/map_icon.png'),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    _donorController.jadwalDonorData!.address.toString(),
                    textAlign: TextAlign.left,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 62),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 48,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(6),
                ),
              ),
              child: TextButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext context) {
                      return const PernyataanPage();
                    },
                  );
                },
                style: TextButton.styleFrom(
                  backgroundColor: const Color(0xffD91E2A),
                  elevation: 0,
                ),
                child: const Text(
                  'Ikut Partisipasi',
                  style: TextStyle(
                    fontSize: 16,
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
}
