import 'package:donor_darah/utility/custom_textStyle.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PernyataanPage extends StatefulWidget {
  const PernyataanPage({super.key});

  @override
  State<PernyataanPage> createState() => _PernyataanPageState();
}

class _PernyataanPageState extends State<PernyataanPage> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 62, left: 24, right: 24),
              child: Text(
                'Persetujuan  Tindakan Medis (Pengambilan Darah)',
                style: TextStyle(
                  fontSize: width * 0.05,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 18),
            Container(
              height: 25,
              width: width,
              decoration: const BoxDecoration(color: Color(0xffFCE9EA)),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 24),
                alignment: Alignment.centerLeft,
                child: Text(
                  'Mohon untuk membaca baris pernyataan secara menyeluruh',
                  style: TextStyle(
                    fontSize: width * 0.025,
                    color: redColor,
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(right: 24, left: 24, top: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: "1. ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                        TextSpan(
                          text:
                              "Menyetujui untuk dilaksakannya tindakan medis (pengambilan darah) dan saya telah menerima penjelasan tentang tata kerja, tujuan serta resiko yang mungkin terjadi.",
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: "2. ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                        TextSpan(
                          text: "Saya juga menyatakan setuju untuk :",
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16, left: 35),
                    child: Column(
                      children: [
                        RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: "2.1 ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              TextSpan(
                                text:
                                    "Mengisi data diri serta pernyataan terkait dengan tindakan medis ini secara lengkap dan jujur",
                                style: TextStyle(color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                        RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: "2.2 ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              TextSpan(
                                text:
                                    "Dilakukan pemeriksaan kesehatan sebelum proses pengambilan darah",
                                style: TextStyle(color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                        RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: "2.3 ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              TextSpan(
                                text:
                                    "Diperiksa sample darahnya terhadap parameter penyakit Hepatitis B, Hepatitis C, Sifilis dan HIV",
                                style: TextStyle(color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                        RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: "2.4 ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              TextSpan(
                                text:
                                    "Diberi nformasi jika hasil pemeriksaannya terhadap sampel darah dinyatakan reaktif atau meragukan dan bersedia darahnya untuk tidak ditransfusi kepada pasien membutuhkan",
                                style: TextStyle(color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                  SizedBox(height: height * 0.15),
                  Container(
                    height: 52,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(6),
                      ),
                    ),
                    child: TextButton(
                      onPressed: () => context.goNamed('questioner'),
                      style: TextButton.styleFrom(
                        backgroundColor: const Color(0xffD91E2A),
                      ),
                      child: const Text(
                        'Saya Setuju',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Batal',
                        style: TextStyle(
                          color: Color(0xffD91E2A),
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
