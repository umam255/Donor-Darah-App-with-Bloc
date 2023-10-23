// ignore_for_file: unused_local_variable, sized_box_for_whitespace, avoid_unnecessary_containers, non_constant_identifier_names, body_might_complete_normally_nullable, must_be_immutable

import 'package:donor_darah/controller/my_controller.dart';
import 'package:donor_darah/presentation/pages/BLOC/district/cubit/district_cubit.dart';
import 'package:donor_darah/presentation/pages/BLOC/village/cubit/village_cubit.dart';
import 'package:donor_darah/presentation/pages/register/model/model_register.dart';
import 'package:donor_darah/utility/commons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import '../../../utility/custom_textStyle.dart';
import '../../navigation/routes.dart';

class ScreenRegisterAlamat extends StatefulWidget {
  const ScreenRegisterAlamat({super.key});

  @override
  State<ScreenRegisterAlamat> createState() => _ScreenRegisterAlamatState();
}

class _ScreenRegisterAlamatState extends State<ScreenRegisterAlamat> {
  TextEditingController alamatController = TextEditingController();
  TextEditingController posController = TextEditingController();
  String? _districtSelected;
  String? _villageSelected;

  final RegisterController registerController = Get.put(RegisterController());
  final ModelRegister? getRegisterController =
      Get.find<RegisterController>().registerData;

  @override
  void initState() {
    BlocProvider.of<DistrictCubit>(context).fetchDistrict();
    BlocProvider.of<VillageCubit>(context).fetchVillage(null);
    super.initState();
  }

  bool validation() {
    if (alamatController.text.isNotEmpty &&
        posController.text.isNotEmpty &&
        _districtSelected != '' &&
        _villageSelected != '') {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return BlocBuilder<DistrictCubit, DistrictState>(
      builder: (context, state) {
        if (state is DistrictIsLoading) {
          return const Center(
            child: CircularProgressIndicator(
              color: Color(0xffD91E2A),
            ),
          );
        } else if (state is DistrictIsSucces) {
          return Scaffold(
            backgroundColor: white249Color,
            appBar: AppBar(
              backgroundColor: Colors.white,
              leading: const BackButton(
                color: Colors.black,
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Data Alamat',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '2 dari 3',
                    style: TextStyle(fontSize: 14, color: Color(0xff999999)),
                  ),
                ],
              ),
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DetailText("Informasi Alamat"),
                    TextFormField(
                      cursorColor: black26Color,
                      controller: alamatController,
                      decoration: DetailDecoration("Alamat KTP"),
                      textAlign: TextAlign.left,
                      keyboardType: TextInputType.text,
                    ),
                    const SizedBox(
                      height: 5,
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
                        hint: const Text('Pilih Kecamatan'),
                        isExpanded: false,
                        value: null,
                        decoration: const InputDecoration(
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                        items: state.data.map((data) {
                          return DropdownMenuItem<String>(
                            value: data.code,
                            child: Text(
                              data.name,
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          _districtSelected = value!;
                          context.read<VillageCubit>().fetchVillage(value);
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 5,
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
                      child: BlocBuilder<VillageCubit, VillageState>(
                        builder: (context, villageState) {
                          if (villageState is VillageIsSucces) {
                            return DropdownButtonFormField(
                              hint: const Text('Pilih Kelurahan'),
                              isExpanded: false,
                              value: null,
                              decoration: const InputDecoration(
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                              ),
                              items: villageState.data.map((data) {
                                return DropdownMenuItem<String>(
                                  value: data.code,
                                  child: Text(
                                    data.name,
                                    style: const TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                );
                              }).toList(),
                              onChanged: (value) {
                                _villageSelected = value!;
                                print("ViLLAGE: ${_villageSelected}");
                              },
                            );
                          } else if (villageState is VillageIsFailed) {
                            return Text(villageState.message.toString());
                          } else {
                            return Container();
                          }
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      cursorColor: black26Color,
                      controller: posController,
                      decoration: DetailDecoration("Kode POS"),
                      textAlign: TextAlign.left,
                      keyboardType: TextInputType.number,
                    ),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: Container(
              padding: const EdgeInsets.all(24),
              child: ElevatedButton(
                onPressed: validation()
                    ? () {
                        ModelRegister newRegisterData = ModelRegister(
                          getRegisterController!.name,
                          getRegisterController!.placeOfBirth,
                          getRegisterController!.dateOfBirth,
                          getRegisterController!.gender,
                          getRegisterController!.jobId,
                          getRegisterController!.unitId,
                          getRegisterController!.phone,
                          getRegisterController!.email,
                          alamatController.text,
                          _districtSelected,
                          _villageSelected,
                          posController.text,
                          '',
                          '',
                        );
                        registerController.setRegisterData(newRegisterData);
                        context.goNamed(Routes.screenRegS);
                      }
                    : () {
                        Commons().showSnackBarErrorr(
                          context,
                          'Field Tidak Boleh Kosong',
                        );
                      },
                style: ElevatedButton.styleFrom(
                  backgroundColor: redColor,
                  fixedSize: Size(MediaQuery.of(context).size.width, 52),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                child: Text(
                  "Lanjut",
                  style: CustomStyle2493(),
                ),
              ),
            ),
          );
        } else {
          return Container();
        }
      },
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
    return Text(text, style: CustomStyle04());
  }
}
