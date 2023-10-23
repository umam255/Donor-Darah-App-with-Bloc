import 'dart:collection';

import 'package:donor_darah/base/widget/BaseColor.dart';
import 'package:donor_darah/controller/my_controller.dart';
import 'package:donor_darah/data/repository/questionaire/questionaire_repository_impl.dart';
import 'package:donor_darah/presentation/navigation/routes.dart';
import 'package:donor_darah/presentation/pages/questionaire/cubit/questionaire_cubit.dart';
import 'package:donor_darah/utility/commons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class QuestionairePage extends StatefulWidget {
  const QuestionairePage({super.key});

  @override
  State<QuestionairePage> createState() => _QuestionairePageState();
}

class _QuestionairePageState extends State<QuestionairePage> {
  Map<String, dynamic> answers = HashMap();
  final _answer7Controller = TextEditingController();
  final DonorController _donorController = Get.find<DonorController>();
  int btn1 = 0;
  int btn2 = 0;
  int btn3 = 0;
  int btn4 = 0;
  int btn5 = 0;
  int btn6 = 0;
  int btn7 = 0;
  int btn8 = 0;
  int btn9 = 0;
  int btn10 = 0;

  bool validationField() {
    if (btn1 != 0 &&
        btn2 != 0 &&
        btn3 != 0 &&
        btn4 != 0 &&
        btn5 != 0 &&
        btn6 != 0 &&
        btn7 != 0 &&
        btn8 != 0 &&
        btn9 != 0 &&
        btn10 != 0) {
      if (btn6 == 1 && _answer7Controller.text.isEmpty) {
        return false;
      }
      return true;
    } else {
      return false;
    }
  }

  bool validationValueBtn1() {
    if (btn1 == 2) {
      return true;
    } else {
      return false;
    }
  }

  bool validationObat() {
    if (btn2 == 1 || btn3 == 1 || btn4 == 1 || btn5 == 1) {
      return true;
    } else {
      return false;
    }
  }

  late QuestionaireCubit _questionaireCubit;

  void doAnswer(String questionCode, answer) {
    setState(() {
      if (answers.containsKey(questionCode)) {
        answers[questionCode] = answer;
      } else {
        answers[questionCode] = answer;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _questionaireCubit = QuestionaireCubit(QuestionaireRepositoryImpl());
  }

  @override
  void dispose() {
    _questionaireCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.black,
        ),
        title: const Text(
          'Questioner Donor Darah',
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        backgroundColor: Colors.white,
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: BlocListener<QuestionaireCubit, QuestionaireState>(
        listener: (context, questionaireState) {
          if (questionaireState is QuestionaireIsError) {
            Commons().showSnackBarErrorr(context, questionaireState.message!);
          } else if (questionaireState is QuestionaireIsSuccess) {
            if (validationObat() == true) {
              dialogListener(context, 'Akan Dihubungi Petugas PMI');
              Future.delayed(
                const Duration(seconds: 3),
                () {
                  context.goNamed(Routes.agendaScreen);
                },
              );
            } else {
              dialogListener(context, 'Pendaftaran Donor Berhasil');
              Future.delayed(
                const Duration(seconds: 3),
                () {
                  context.goNamed(Routes.agendaScreen);
                },
              );
            }
          }
        },
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(left: 24, right: 24, top: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textPeriode("Hari ini"),
                const SizedBox(height: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('1. Merasa sehat pada hari ini ?'),
                    const SizedBox(height: 14),
                    Row(
                      children: [
                        customRadio('Ya', 1, btn1, (index) {
                          setState(() {
                            btn1 = index;
                            doAnswer("Q1", "Ya");
                          });
                        }),
                        const SizedBox(width: 24),
                        customRadio('Tidak', 2, btn1, (index) {
                          setState(() {
                            btn1 = index;
                            doAnswer("Q1", "Tidak");
                          });
                        }),
                      ],
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('2. Sedang minum antibiotik ?'),
                    const SizedBox(height: 14),
                    Row(
                      children: [
                        customRadio('Ya', 1, btn2, (index) {
                          setState(() {
                            btn2 = index;
                            doAnswer("Q2", "Ya");
                          });
                        }),
                        const SizedBox(width: 24),
                        customRadio('Tidak', 2, btn2, (index) {
                          setState(() {
                            btn2 = index;
                            doAnswer("Q2", "Tidak");
                          });
                        }),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('3. Sedang minum obat lain untuk infeksi ?'),
                    const SizedBox(height: 14),
                    Row(
                      children: [
                        customRadio('Ya', 1, btn3, (index) {
                          setState(() {
                            btn3 = index;
                            doAnswer("Q3", "Ya");
                          });
                        }),
                        const SizedBox(width: 24),
                        customRadio('Tidak', 2, btn3, (index) {
                          setState(() {
                            btn3 = index;
                            doAnswer("Q3", "Tidak");
                          });
                        }),
                      ],
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
                textPeriode("Dalam waktu 48 jam terakhir"),
                const SizedBox(height: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                        '4. Apakah anda sedang minum aspirin atau obat yang mengandung aspirin ?'),
                    const SizedBox(height: 14),
                    Row(
                      children: [
                        customRadio('Ya', 1, btn4, (index) {
                          setState(() {
                            btn4 = index;
                            doAnswer("Q4", "Ya");
                          });
                        }),
                        const SizedBox(width: 24),
                        customRadio('Tidak', 2, btn4, (index) {
                          setState(() {
                            btn4 = index;
                            doAnswer("Q4", "Tidak");
                          });
                        }),
                      ],
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
                textPeriode("Dalam waktu 1 minggu terakhir"),
                const SizedBox(height: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                        '5. Apakah anda mengalami sakit kepala dan demam bersamaan ?'),
                    const SizedBox(height: 14),
                    Row(
                      children: [
                        customRadio('Ya', 1, btn5, (index) {
                          setState(() {
                            btn5 = index;
                            doAnswer("Q5", "Ya");
                          });
                        }),
                        const SizedBox(width: 24),
                        customRadio('Tidak', 2, btn5, (index) {
                          setState(() {
                            btn5 = index;
                            doAnswer("Q5", "Tidak");
                          });
                        }),
                      ],
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
                textPeriode("Dalam waktu 6 minggu terakhir"),
                const SizedBox(height: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                        '6. Untuk pendonor darah wanita : apakah anda saat ini sedang hamil/menyusui ?'),
                    const SizedBox(height: 14),
                    Row(
                      children: [
                        customRadio('Ya', 1, btn6, (index) {
                          setState(() {
                            btn6 = index;
                            doAnswer("Q6", "Ya");
                          });
                        }),
                        const SizedBox(width: 24),
                        customRadio('Tidak', 2, btn6, (index) {
                          setState(() {
                            btn6 = index;
                            doAnswer("Q6", "Tidak");
                            doAnswer("Q7", "");
                            _answer7Controller.clear();
                          });
                        }),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Text('7. Jika ya, kehamilan keberapa ?'),
                    const SizedBox(height: 14),
                    TextFormField(
                      controller: _answer7Controller,
                      onChanged: (value) {
                        setState(() {
                          doAnswer("Q7", value = _answer7Controller.text);
                        });
                      },
                      enabled: (btn6 == 2 ? false : true),
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                          hintText: "Jawab",
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                            color: BaseColor.grey,
                          ))),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
                textPeriode("Dalam waktu 16 minggu terakhir"),
                const SizedBox(height: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                        '8. Apakah anda mendonorkan darah, trombosit atau plasma ?'),
                    const SizedBox(height: 14),
                    Row(
                      children: [
                        customRadio('Ya', 1, btn7, (index) {
                          setState(() {
                            btn7 = index;
                            doAnswer("Q8", "Ya");
                          });
                        }),
                        const SizedBox(width: 24),
                        customRadio('Tidak', 2, btn7, (index) {
                          setState(() {
                            btn7 = index;
                            doAnswer("Q8", "Tidak");
                          });
                        }),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Text(
                        '9. Apakah anda menerima vaksinansi atau suntikan lainnya ?'),
                    const SizedBox(height: 14),
                    Row(
                      children: [
                        customRadio('Ya', 1, btn8, (index) {
                          setState(() {
                            btn8 = index;
                            doAnswer("Q9", "Ya");
                          });
                        }),
                        const SizedBox(width: 24),
                        customRadio('Tidak', 2, btn8, (index) {
                          setState(() {
                            btn8 = index;
                            doAnswer("Q9", "Tidak");
                          });
                        }),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Text(
                        '10. Apakah anda mendonorkan 2 kantong seld darah merah melalui proses aferasis ?'),
                    const SizedBox(height: 14),
                    Row(
                      children: [
                        customRadio('Ya', 1, btn9, (index) {
                          setState(() {
                            btn9 = index;
                            doAnswer("Q10", "Ya");
                          });
                        }),
                        const SizedBox(width: 24),
                        customRadio('Tidak', 2, btn9, (index) {
                          setState(() {
                            btn9 = index;
                            doAnswer("Q10", "Tidak");
                          });
                        }),
                      ],
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
                textPeriode("Dalam waktu 8 minggu terakhir"),
                const SizedBox(height: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                        '11. Apakah anda pernah kontak dengan orang yang menerima vaksinasi smllpox ?'),
                    const SizedBox(height: 14),
                    Row(
                      children: [
                        customRadio('Ya', 1, btn10, (index) {
                          setState(() {
                            btn10 = index;
                            doAnswer("Q11", "Ya");
                          });
                        }),
                        const SizedBox(width: 24),
                        customRadio('Tidak', 2, btn10, (index) {
                          setState(() {
                            btn10 = index;
                            doAnswer("Q11", "Tidak");
                          });
                        }),
                      ],
                    ),
                    const SizedBox(height: 149),
                  ],
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 52,
                  child: ElevatedButton(
                    onPressed: validationField()
                        ? () {
                            dialogQuestionaire(context);
                          }
                        : null,
                    style: ElevatedButton.styleFrom(
                        backgroundColor: (validationField()
                            ? BaseColor.red
                            : const Color.fromARGB(255, 243, 131, 138)),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                        side: const BorderSide(color: Colors.white),
                        elevation: 0.0),
                    child: const Text(
                      'Simpan',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 17)
              ],
            ),
          ),
        ),
      ),
    );
  }

  void dialogListener(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          icon: Image.asset(
            'assets/images/notif.png',
          ),
          content: Text(
            message,
            textAlign: TextAlign.center,
          ),
        );
      },
    );
  }

  Future<dynamic> dialogQuestionaire(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          actionsPadding: const EdgeInsets.only(
            right: 20,
            bottom: 20,
          ),
          title: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Konfirmasi",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.close,
                  size: 18,
                ),
              )
            ],
          ),
          content: const Text('Apakah kamu yakin data kuesioner sudah benar ?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: TextButton.styleFrom(
                foregroundColor: BaseColor.red,
              ),
              child: const Text(
                'Batal',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: BaseColor.red,
                ),
              ),
            ),
            TextButton(
              onPressed: validationValueBtn1()
                  ? () {
                      Commons().showSnackBarErrorr(
                        context,
                        'Anda Tidak Bisa Melakukan Donor',
                      );
                      context.goNamed(
                        Routes.berandaScreen,
                      );
                    }
                  : () {
                      BlocProvider.of<QuestionaireCubit>(context)
                          .btnQuestionaire(
                        _donorController.jadwalDonorData!.idSchedulle,
                        answers,
                      );
                      Navigator.pop(context);
                    },
              style: TextButton.styleFrom(
                foregroundColor: BaseColor.red,
              ),
              child: const Text(
                'Ya',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: BaseColor.red,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

Widget textPeriode(String judul) {
  return Container(
    alignment: Alignment.center,
    height: 28,
    color: const Color(0xffFCE9EA),
    child: Text(
      judul,
      style: const TextStyle(
        color: BaseColor.red,
      ),
    ),
  );
}

Widget customRadio(String text, int index, int selected, Function(int) onTap) {
  return SizedBox(
    height: 32,
    width: 80,
    child: OutlinedButton(
      onPressed: () {
        onTap(index);
      },
      style: OutlinedButton.styleFrom(
        elevation: 0,
        backgroundColor: (selected == index) ? BaseColor.red : Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
          side: BorderSide(
            color:
                (selected == index) ? const Color(0xff999999) : BaseColor.red,
          ),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: (selected == index ? Colors.white : const Color(0xff999999)),
        ),
      ),
    ),
  );
}
