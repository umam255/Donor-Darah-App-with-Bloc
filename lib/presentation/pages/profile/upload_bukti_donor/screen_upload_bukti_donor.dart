import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import 'package:donor_darah/presentation/navigation/routes.dart';
import 'package:donor_darah/presentation/pages/profile/upload_bukti_donor/cubit/upload_image_cubit.dart';
import 'package:donor_darah/utility/commons.dart';
import 'package:donor_darah/utility/custom_textStyle.dart';

class ScreenUploadBuktiDonor extends StatefulWidget {
  final File image;
  final String idRiwayat;
  const ScreenUploadBuktiDonor({
    Key? key,
    required this.image,
    required this.idRiwayat,
  }) : super(key: key);

  @override
  State<ScreenUploadBuktiDonor> createState() => _ScreenUploadBuktiDonorState();
}

class _ScreenUploadBuktiDonorState extends State<ScreenUploadBuktiDonor> {
  bool _isLoading = false;
  File? _image;
  String? _idRiwayat;

  Future<void> _uploadImage() async {
    setState(() {
      _isLoading = true;
    });

    await BlocProvider.of<UploadImageCubit>(context).fetchUploadImage(
      _image!,
      _idRiwayat!,
    );

    setState(() {
      _isLoading = false;
    });
  }

  Future<void> _getImageFromCamera() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.camera);

    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  @override
  void initState() {
    _idRiwayat = widget.idRiwayat;
    _image = widget.image;
    super.initState();
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
        title: const Text(
          'Upload Bukti Donor',
          style: TextStyle(
            color: Colors.black,
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: Colors.white,
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: BlocListener<UploadImageCubit, UploadImageState>(
        listener: (BuildContext context, state) {
          if (state is UploadImageIsSucces) {
            context.goNamed(Routes.profileScreen);
            Commons().showSnackBarSuccess(
              context,
              'Upload Bukti Donor Berhasil',
            );
          } else if (state is UploadImageIsFailed) {
            Commons().showSnackBarErrorr(
              context,
              'Upload Bukti Donor Gagal',
            );
          }
        },
        child: _isLoading
            ? const Center(
                child: CircularProgressIndicator(
                  color: redColor,
                ),
              )
            : Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: height * 0.03),
                          child: _image != null
                              ? Image.file(
                                  _image!,
                                  scale: 5.1,
                                )
                              : const Text('Tidak Ada Gambar Terpilih'),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            _getImageFromCamera();
                          },
                          style: ElevatedButton.styleFrom(
                            fixedSize: Size(width * 0.45, height * 0.06),
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                color: redColor,
                              ),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            backgroundColor: Colors.white,
                          ),
                          child: Text(
                            "Ambil Ulang",
                            style: CustomStyle2177(),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            _uploadImage();
                          },
                          style: ElevatedButton.styleFrom(
                            fixedSize: Size(width * 0.45, height * 0.06),
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                color: Color.fromRGBO(217, 30, 42, 1),
                              ),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            backgroundColor:
                                const Color.fromRGBO(217, 30, 42, 1),
                          ),
                          child: Text(
                            "Upload",
                            style: CustomStyle2493(),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
