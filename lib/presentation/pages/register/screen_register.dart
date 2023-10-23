// ignore_for_file: unused_local_variable, sized_box_for_whitespace, avoid_unnecessary_containers, non_constant_identifier_names, body_might_complete_normally_nullable, avoid_print

import 'package:donor_darah/controller/my_controller.dart';
import 'package:donor_darah/presentation/pages/BLOC/job/cubit/job_cubit.dart';
import 'package:donor_darah/presentation/pages/register/model/model_register.dart';
import 'package:donor_darah/presentation/pages/udd/cubit/unit_udd_cubit.dart';
import 'package:donor_darah/utility/commons.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../utility/custom_textStyle.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../navigation/routes.dart';

class ScreenRegister extends StatefulWidget {
  const ScreenRegister({super.key});

  @override
  State<ScreenRegister> createState() => _ScreenRegisterState();
}

class _ScreenRegisterState extends State<ScreenRegister> {
  TextEditingController namaController = TextEditingController();
  TextEditingController tempatController = TextEditingController();
  TextEditingController tanggalController = TextEditingController();
  TextEditingController nohpController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  String? _jkSelected;
  int? _jobSelected;
  int? _unitSelected;
  DateTime? _selectedDate;
  final FocusNode _focusNode = FocusNode();
  Color color = Colors.deepOrange;
  final RegisterController registerController = Get.put(RegisterController());

  @override
  void initState() {
    BlocProvider.of<JobCubit>(context).fetchJob();
    BlocProvider.of<UnitUddCubit>(context).fetchUnitUdd();
    super.initState();
  }

  bool validate() {
    if (namaController.text.isNotEmpty &&
        tempatController.text.isNotEmpty &&
        tanggalController.text.isNotEmpty &&
        nohpController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        _jkSelected != null &&
        _jobSelected != 0 &&
        _unitSelected != 0) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    _focusNode.addListener(() {
      setState(() {
        color = _focusNode.hasFocus ? Colors.blue : Colors.red;
      });
    });

    Future<void> selectDate(BuildContext context) async {
      DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1970),
        lastDate: DateTime(2100),
      );

      if (pickedDate != null && pickedDate != _selectedDate) {
        setState(() {
          _selectedDate = pickedDate;
          tanggalController.text =
              "${pickedDate.year}-${pickedDate.month.toString().padLeft(2, '0')}-${pickedDate.day.toString().padLeft(2, '0')}";
        });
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const BackButton(
          color: Colors.black,
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              'Data Diri',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '1 dari 3',
              style: TextStyle(fontSize: 14, color: Color(0xff999999)),
            ),
          ],
        ),
      ),
      body: BlocBuilder<JobCubit, JobState>(
        builder: (context, state) {
          if (state is JobIsLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: redColor,
              ),
            );
          } else if (state is JobIsSucces) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Inforamsi Probadi',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextFormField(
                    cursorColor: black26Color,
                    controller: namaController,
                    decoration: DetailDecoration("Nama Lengkap"),
                    textAlign: TextAlign.left,
                    keyboardType: TextInputType.text,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    cursorColor: black26Color,
                    controller: tempatController,
                    decoration: DetailDecoration("Tempat Lahir"),
                    textAlign: TextAlign.left,
                    keyboardType: TextInputType.text,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    cursorColor: black26Color,
                    controller: tanggalController,
                    decoration: DetailDecoration("Tanggal Lahir"),
                    textAlign: TextAlign.left,
                    keyboardType: TextInputType.text,
                    onTap: () {
                      selectDate(context);
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: DetailText('Jenis Kelamin'),
                  ),
                  Row(
                    children: [
                      Flexible(
                        flex: 1,
                        child: RadioListTile(
                          contentPadding: EdgeInsets.zero,
                          activeColor: Colors.red,
                          value: "1",
                          groupValue: _jkSelected,
                          title: const Text(
                            "Laki-laki",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            ),
                          ),
                          onChanged: (value) {
                            setState(() {
                              _jkSelected = value.toString();
                            });
                          },
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: RadioListTile(
                          contentPadding: EdgeInsets.zero,
                          activeColor: Colors.red,
                          value: "2",
                          groupValue: _jkSelected,
                          title: const Text(
                            "Perempuan",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            ),
                          ),
                          onChanged: (value) {
                            setState(() {
                              _jkSelected = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 18, bottom: 24),
                    child: DetailText("Informasi Pekerjaan"),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: 1.0,
                          color: Color(0xffD4D4D4),
                        ),
                      ),
                    ),
                    child: DropdownButtonFormField(
                      hint: const Text('Pilih Pekerjaan'),
                      isExpanded: false,
                      value: _jobSelected,
                      decoration: const InputDecoration(
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                      items: state.data!.map<DropdownMenuItem<dynamic>>((data) {
                        return DropdownMenuItem<dynamic>(
                          value: data.id,
                          child: Text(
                            data.name,
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _jobSelected = value;
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 24, bottom: 24),
                    child: DetailText("Informasi PMI"),
                  ),
                  BlocBuilder<UnitUddCubit, UnitUddState>(
                    builder: (context, unitState) {
                      if (unitState is UnitUddIsSuccess) {
                        return Container(
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                width: 1.0,
                                color: Color(0xffD4D4D4),
                              ),
                            ),
                          ),
                          child: DropdownButtonFormField(
                            hint: const Text('Pilih UDD PMI'),
                            isExpanded: false,
                            value: _unitSelected,
                            decoration: const InputDecoration(
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                            ),
                            items: unitState.data
                                .map<DropdownMenuItem<dynamic>>((data) {
                              return DropdownMenuItem<dynamic>(
                                value: data.id,
                                child: Text(
                                  data.name,
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                _unitSelected = value;
                              });
                            },
                          ),
                        );
                      } else {
                        return const Text('');
                      }
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: DetailText("Informasi Kontak"),
                  ),
                  TextFormField(
                    cursorColor: black26Color,
                    controller: nohpController,
                    decoration: DetailDecoration("Telepon/No. Handphone"),
                    textAlign: TextAlign.left,
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(
                    height: 9.5,
                  ),
                  TextFormField(
                    cursorColor: black26Color,
                    controller: emailController,
                    decoration: DetailDecoration("Email"),
                    textAlign: TextAlign.left,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  ElevatedButton(
                    onPressed: validate()
                        ? () {
                            ModelRegister newRegisterData = ModelRegister(
                              namaController.text,
                              tempatController.text,
                              tanggalController.text,
                              _jkSelected,
                              _jobSelected.toString(),
                              _unitSelected.toString(),
                              nohpController.text,
                              emailController.text,
                              '',
                              '',
                              '',
                              '',
                              '',
                              '',
                            );
                            registerController.setRegisterData(newRegisterData);
                            context.goNamed(Routes.screenRegA);
                          }
                        : () {
                            Commons().showSnackBarErrorr(
                              context,
                              'Field Tidak Boleh Kosong',
                            );
                          },
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(MediaQuery.of(context).size.width, 52),
                      backgroundColor: redColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6)),
                    ),
                    child: Text(
                      "Lanjut",
                      style: CustomStyle2493(),
                    ),
                  )
                ],
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }

  InputDecoration DetailDecoration(String text) {
    return InputDecoration(
      alignLabelWithHint: true,
      floatingLabelStyle: const TextStyle(color: redColor),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: redColor),
      ),
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: white230Color),
      ),
      labelText: text,
      labelStyle: CustomStyle1532(),
    );
  }

  Text DetailText(String text) {
    return Text(text, style: CustomStyle266());
  }
}
