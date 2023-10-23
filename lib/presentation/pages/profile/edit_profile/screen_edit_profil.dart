// ignore_for_file: import_of_legacy_library_into_null_safe

import 'dart:io';
import 'package:donor_darah/domain/model/request/update_profil/update_profile-request.dart';
import 'package:donor_darah/presentation/navigation/routes.dart';
import 'package:donor_darah/presentation/pages/BLOC/district/cubit/district_cubit.dart';
import 'package:donor_darah/presentation/pages/BLOC/job/cubit/job_cubit.dart';
import 'package:donor_darah/presentation/pages/BLOC/village/cubit/village_cubit.dart';
import 'package:donor_darah/presentation/pages/profile/edit_profile/cubit/update_profile_cubit.dart';
import 'package:donor_darah/presentation/pages/profile/model/user_model.dart';
import 'package:donor_darah/presentation/pages/profile/profile/cubit/profile_cubit.dart';
import 'package:donor_darah/presentation/pages/udd/cubit/unit_udd_cubit.dart';
import 'package:donor_darah/utility/commons.dart';
import 'package:donor_darah/utility/custom_textStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

class ScreenEditProfil extends StatefulWidget {
  final UserDataModel userData;
  const ScreenEditProfil({
    Key? key,
    required this.userData,
  }) : super(key: key);

  @override
  State<ScreenEditProfil> createState() => _ScreenEditProfilState();
}

class _ScreenEditProfilState extends State<ScreenEditProfil> {
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _tempatController = TextEditingController();
  final TextEditingController _tanggalController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _alamatController = TextEditingController();
  final TextEditingController _posController = TextEditingController();

  String _urlImage = '';
  String _jenisKelamin = '';
  int _jobSelected = 0;
  int _unitPmiSelected = 0;
  DateTime? _selectedDate;
  String _subDistrickIdSelected = '';
  String _villageIdSelected = '';
  File? _image;

  bool _isUpdating = false;

  Future<void> _getImageFromCamera() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.camera);

    if (pickedImage != null) {
      setState(
        () {
          _image = File(pickedImage.path);
          _urlImage = '';
        },
      );
    }
  }

  Future<void> _getImageFromGallery() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
        _urlImage = '';
      });
    }
  }

  Future<void> selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1970),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(
        () {
          _selectedDate = pickedDate;
          _tanggalController.text =
              "${pickedDate.year}-${pickedDate.month.toString().padLeft(2, '0')}-${pickedDate.day.toString().padLeft(2, '0')}";
        },
      );
    }
  }

  @override
  void initState() {
    _namaController.text = widget.userData.name;
    _tempatController.text = widget.userData.placeOfBirth;
    _tanggalController.text = widget.userData.dateOfBirth;
    _phoneController.text = widget.userData.phone;
    _emailController.text = widget.userData.email;
    _alamatController.text = widget.userData.address;
    _posController.text = widget.userData.postalCode;
    _urlImage = widget.userData.urlImage;
    _jenisKelamin = widget.userData.gender;
    _jobSelected = int.parse(widget.userData.jobId);
    _subDistrickIdSelected = widget.userData.subDistrict.code.toString();
    _villageIdSelected = widget.userData.village.code.toString();
    _unitPmiSelected = int.parse(widget.userData.unitId);
    BlocProvider.of<ProfileCubit>(context).fetchProfile();
    BlocProvider.of<JobCubit>(context).fetchJob();
    BlocProvider.of<UnitUddCubit>(context).fetchUnitUdd();
    BlocProvider.of<DistrictCubit>(context).fetchDistrict();
    BlocProvider.of<VillageCubit>(context).fetchVillage(_subDistrickIdSelected);
    super.initState();
  }

  @override
  void dispose() {
    _namaController.dispose();
    _tempatController.dispose();
    _tanggalController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _alamatController.dispose();
    _posController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.black,
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Edit Profile',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
            TextButton(
              onPressed: () async {
                setState(() {
                  _isUpdating = true;
                });

                await BlocProvider.of<UpdateProfileCubit>(context)
                    .submitUpdateProfile(
                  UpdateProfileRequest(
                    _namaController.text,
                    _jenisKelamin,
                    _tempatController.text,
                    _tanggalController.text,
                    _jobSelected.toString(),
                    _unitPmiSelected.toString(),
                    _phoneController.text,
                    _emailController.text,
                    _villageIdSelected,
                    _alamatController.text,
                    _subDistrickIdSelected,
                    _posController.text,
                    _image,
                  ),
                );

                setState(() {
                  _isUpdating = false;
                });
              },
              child: const Text(
                'Simpan',
                style: TextStyle(
                  fontSize: 16,
                  color: redColor,
                ),
              ),
            )
          ],
        ),
        backgroundColor: Colors.white,
      ),
      body: BlocListener<UpdateProfileCubit, UpdateProfileState>(
        listener: (context, updateProfileState) {
          if (updateProfileState is UpdateProfileIsLoading) {
            const CircularProgressIndicator(
              color: redColor,
            );
          } else if (updateProfileState is UpdateProfileIsFailed) {
            Commons().showSnackBarErrorr(context, 'Update Profile Gagal');
          } else if (updateProfileState is UpdateProfileIsSucces) {
            Commons().showFlashMessage(context, 'Update Profile Berhasil');
            context.read<ProfileCubit>().fetchProfile();
            context.goNamed(Routes.profileScreen);
          }
        },
        child: _isUpdating
            ? const Center(
                child: CircularProgressIndicator(
                  color: redColor,
                ),
              )
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return IntrinsicHeight(
                                child: Container(
                                  padding: const EdgeInsets.all(24),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Pilih Foto',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      ListTile(
                                        contentPadding: const EdgeInsets.only(
                                          left: 0,
                                        ),
                                        minLeadingWidth: 0,
                                        leading: SvgPicture.asset(
                                          'assets/images/take-picture/camera.svg',
                                        ),
                                        title: const Text('Ambil Foto'),
                                        onTap: () {
                                          _getImageFromCamera();
                                          Navigator.pop(context);
                                        },
                                      ),
                                      ListTile(
                                        onTap: () {
                                          _getImageFromGallery();
                                          Navigator.pop(context);
                                        },
                                        contentPadding: const EdgeInsets.only(
                                          left: 0,
                                        ),
                                        minLeadingWidth: 0,
                                        leading: SvgPicture.asset(
                                          'assets/images/take-picture/gallery.svg',
                                        ),
                                        title: const Text('Gallery'),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.only(top: 24, bottom: 50),
                          alignment: Alignment.center,
                          child: _urlImage != ''
                              ? CircleAvatar(
                                  backgroundImage: NetworkImage(_urlImage),
                                  maxRadius: 50,
                                )
                              : CircleAvatar(
                                  backgroundColor: greyColor,
                                  maxRadius: 50,
                                  child: _image != null
                                      ? CircleAvatar(
                                          backgroundColor: greyColor,
                                          maxRadius: 50,
                                          backgroundImage: Image.memory(
                                            _image!.readAsBytesSync(),
                                          ).image,
                                        )
                                      : Container(
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: greyColor,
                                          ),
                                          child: Transform.scale(
                                            scale: 2.0,
                                            child: SvgPicture.asset(
                                              'assets/images/take-picture/Foto_profile_kosong.svg',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                ),
                        ),
                      ),
                      //informasi Pribadi
                      const Text(
                        'Informasi Pribadi',
                        style: TextStyle(fontSize: 16),
                      ),
                      _InputText(
                        judulInput: 'Nama Lengkap',
                        controller: _namaController,
                        texInputType: TextInputType.text,
                      ),
                      _InputText(
                        judulInput: 'Tempat Lahir',
                        controller: _tempatController,
                        texInputType: TextInputType.text,
                      ),
                      ListTile(
                        contentPadding: const EdgeInsets.only(top: 10),
                        dense: true,
                        title: const Text(
                          'Tanggal Lahir',
                          style: TextStyle(color: greyColor),
                        ),
                        subtitle: TextFormField(
                          maxLength: 10,
                          controller: _tanggalController,
                          onTap: () {
                            selectDate(context);
                            print('Tanggal :${_tanggalController.text}');
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Jenis Kelamin',
                        style: TextStyle(fontSize: 16),
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: RadioListTile(
                              // enableFeedback: true,
                              value: '1',
                              title: const Text('Laki-Laki'),
                              activeColor: redColor,
                              groupValue: _jenisKelamin,
                              onChanged: (value) {
                                setState(() {
                                  _jenisKelamin = value!;
                                });
                              },
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: RadioListTile(
                              value: '2',
                              title: const Text('Perempuan'),
                              activeColor: redColor,
                              groupValue: _jenisKelamin,
                              onChanged: (value) {
                                setState(() {
                                  _jenisKelamin = value!;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const Text(
                        'Informasi Pekerjaan',
                        style: TextStyle(fontSize: 16),
                      ),
                      BlocBuilder<JobCubit, JobState>(
                        builder: (context, jobState) {
                          if (jobState is JobIsSucces) {
                            return Container(
                              padding: const EdgeInsets.only(top: 10),
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
                                items: jobState.data!
                                    .map<DropdownMenuItem<int>>((data) {
                                  return DropdownMenuItem<int>(
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
                                  _jobSelected = value!;
                                  print('JOB:${_jobSelected}');
                                },
                              ),
                            );
                          }
                          return Container();
                        },
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const Text(
                        'Informasi PMI',
                        style: TextStyle(fontSize: 16),
                      ),
                      BlocBuilder<UnitUddCubit, UnitUddState>(
                        builder: (context, unitState) {
                          if (unitState is UnitUddIsSuccess) {
                            return Container(
                              padding: const EdgeInsets.only(top: 10),
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
                                value: _unitPmiSelected,
                                decoration: const InputDecoration(
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                ),
                                items: unitState.data
                                    .map<DropdownMenuItem<int>>((data) {
                                  return DropdownMenuItem<int>(
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
                                  _unitPmiSelected = value!;
                                  print('PMI:${_unitPmiSelected}');
                                },
                              ),
                            );
                          } else {
                            return const Text('');
                          }
                        },
                      ),

                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Informasi Kontak',
                        style: TextStyle(fontSize: 16),
                      ),
                      _InputText(
                        judulInput: 'Telepon / No Handphone',
                        controller: _phoneController,
                        texInputType: TextInputType.number,
                      ),
                      _InputText(
                        judulInput: 'Email',
                        controller: _emailController,
                        texInputType: TextInputType.emailAddress,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Informasi Alamat',
                        style: TextStyle(fontSize: 16),
                      ),
                      _InputText(
                        judulInput: 'Alamat KTP',
                        controller: _alamatController,
                        texInputType: TextInputType.text,
                      ),
                      BlocBuilder<DistrictCubit, DistrictState>(
                        builder: (context, distickState) {
                          if (distickState is DistrictIsSucces) {
                            return ListTile(
                              contentPadding: const EdgeInsets.only(top: 20),
                              title: const Text(
                                'Kecamatan',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: greyColor,
                                ),
                              ),
                              subtitle: Container(
                                padding: const EdgeInsets.only(top: 10),
                                decoration: const BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      width: 1.0,
                                      color: Color(0xffD4D4D4),
                                    ),
                                  ),
                                ),
                                child: DropdownButtonFormField(
                                  hint: Text(widget.userData.subDistrict.name!),
                                  isExpanded: false,
                                  value: null,
                                  decoration: const InputDecoration(
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                  ),
                                  items: distickState.data.map((data) {
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
                                    setState(() {
                                      _subDistrickIdSelected = value!;
                                      context
                                          .read<VillageCubit>()
                                          .fetchVillage(_subDistrickIdSelected);
                                    });
                                    print(
                                      'DISTRICK CODE : ${_subDistrickIdSelected}',
                                    );
                                  },
                                ),
                              ),
                            );
                          } else {
                            return const Text('');
                          }
                        },
                      ),

                      BlocBuilder<VillageCubit, VillageState>(
                        builder: (context, villageState) {
                          if (villageState is VillageIsSucces) {
                            return ListTile(
                              contentPadding: const EdgeInsets.only(top: 20),
                              title: const Text(
                                'Kelurahan',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: greyColor,
                                ),
                              ),
                              subtitle: Container(
                                padding: const EdgeInsets.only(top: 10),
                                decoration: const BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      width: 1.0,
                                      color: Color(0xffD4D4D4),
                                    ),
                                  ),
                                ),
                                child: DropdownButtonFormField(
                                  hint: Text(widget.userData.village.name!),
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
                                    // setState(() {
                                    _villageIdSelected = value!;
                                    // });
                                    print('VillAGE ID:${_villageIdSelected}');
                                  },
                                ),
                              ),
                            );
                          } else {
                            return const Text('');
                          }
                        },
                      ),
                      _InputText(
                        judulInput: 'Kode Pos',
                        controller: _posController,
                        texInputType: TextInputType.number,
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}

class _InputText extends StatelessWidget {
  final String judulInput;
  final TextInputType texInputType;
  final TextEditingController controller;
  const _InputText({
    Key? key,
    required this.judulInput,
    required this.texInputType,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          contentPadding: const EdgeInsets.only(top: 20),
          title: Text(
            judulInput,
            style: const TextStyle(fontSize: 12, color: greyColor),
          ),
          subtitle: TextFormField(
            controller: controller,
            keyboardType: texInputType,
            textInputAction: TextInputAction.none,
          ),
        )
      ],
    );
  }
}
