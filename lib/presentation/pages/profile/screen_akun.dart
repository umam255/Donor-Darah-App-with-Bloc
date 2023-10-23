// // ignore_for_file: sized_box_for_whitespace, prefer_typing_uninitialized_variables, non_constant_identifier_names, unnecessary_string_escapes, avoid_unnecessary_containers, unnecessary_string_interpolations, prefer_const_constructors, sort_child_properties_last, avoid_print, avoid_single_cascade_in_expression_statements, unused_local_variable, unused_field, no_leading_underscores_for_local_identifiers, unused_element, use_build_context_synchronously

// import 'package:donor_darah/presentation/pages/Profil/profile/cubit/profile_cubit.dart';
// import 'package:donor_darah/utility/commons.dart';
// import 'package:donor_darah/utility/custom_textStyle.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_router/go_router.dart';

// import 'package:image_picker/image_picker.dart';
// import 'dart:io';

// import 'package:shared_preferences/shared_preferences.dart';

// import '../../../data/repository/profile/profile_repository_impl.dart';
// import '../../navigation/routes.dart';

// class ScreenAkun extends StatefulWidget {
//   const ScreenAkun({super.key});

//   @override
//   State<ScreenAkun> createState() => _ScreenAkunState();
// }

// class _ScreenAkunState extends State<ScreenAkun> {
//   PickedFile? _imageFile;
//   final ImagePicker _picker = ImagePicker();
//   void ChoiceImage(ImageSource source) async {
//     final pickedFile = await _picker.getImage(
//       source: source,
//     );
//     setState(() {
//       _imageFile = pickedFile;
//     });
//   }

//   void _showSelectPhotoOptions(BuildContext context) {
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       builder: (context) => DraggableScrollableSheet(
//           initialChildSize: 0.17,
//           maxChildSize: 0.4,
//           minChildSize: 0.17,
//           expand: false,
//           builder: (context, scrollController) {
//             return BlocBuilder<ProfileCubit, ProfileState>(
//               builder: (context, state) {
//                 return SingleChildScrollView(
//                     controller: scrollController,
//                     child: Padding(
//                       padding: const EdgeInsets.all(16),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             'Pilih Foto',
//                             style: CustomStyle03(),
//                           ),
//                           const SizedBox(
//                             height: 20,
//                           ),
//                           Row(
//                             children: [
//                               const Icon(Icons.camera_alt_outlined),
//                               const SizedBox(
//                                 width: 12,
//                               ),
//                               InkWell(
//                                 onTap: () {
//                                   ChoiceImage(ImageSource.camera);
//                                 },
//                                 child: Text(
//                                   "Ambil Foto",
//                                   style: CustomStyle02(),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           const SizedBox(
//                             height: 10,
//                           ),
//                           Row(
//                             children: [
//                               Image.asset(
//                                 "assets/images/DD43.png",
//                                 height: 23,
//                                 width: 23,
//                               ),
//                               const SizedBox(
//                                 width: 12,
//                               ),
//                               InkWell(
//                                 onTap: () {
//                                   ChoiceImage(ImageSource.gallery);
//                                 },
//                                 child: Text(
//                                   "Unggah dari galeri",
//                                   style: CustomStyle02(),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ));
//               },
//             );
//           }),
//     );
//   }

//   void _showDialog(BuildContext context) async {
//     final result = await showDialog(
//         context: context,
//         builder: (context) => BlocBuilder<ProfileCubit, ProfileState>(
//               builder: (context, profileState) {
//                 return Card(
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12)),
//                   color: white249Color,
//                   margin: EdgeInsets.only(
//                       top: 170, left: 30, right: 30, bottom: 295),
//                   child: Padding(
//                     padding: const EdgeInsets.all(16),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Row(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(
//                               "Keluar dari Akun",
//                               style: CustomStyle452(),
//                             ),
//                             InkWell(
//                               onTap: () {
//                                 Navigator.of(context).pop(true);
//                               },
//                               child: Icon(
//                                 Icons.close,
//                                 size: 15,
//                               ),
//                             ),
//                           ],
//                         ),
//                         SizedBox(
//                           height: 12,
//                         ),
//                         Text(
//                           "Jika Anda keluar, anda tidak akan\nmendapatkan notifikasi jadwal kembali donor\n\nYakin ingin keluar ?",
//                           style: CustomStyle45(),
//                         ),
//                         SizedBox(
//                           height: 25,
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.end,
//                           children: [
//                             ElevatedButton(
//                                 onPressed: () {
//                                   Navigator.of(context).pop();
//                                 },
//                                 style: ElevatedButton.styleFrom(
//                                   backgroundColor: white249Color,
//                                 ),
//                                 child: Text(
//                                   "Batal",
//                                   style: CustomStyle2175(),
//                                 )),
//                             SizedBox(
//                               width: 12,
//                             ),
//                             ElevatedButton(
//                                 onPressed: () => context.go('/login'),
//                                 style: ElevatedButton.styleFrom(
//                                   backgroundColor: redColor,
//                                 ),
//                                 child: Text(
//                                   "Keluar",
//                                   style: CustomStyle2492(),
//                                 ))
//                           ],
//                         )
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             ));
//   }

//   // late ProfileCubit _profileCubit;

//   // @override
//   // void initState() {
//   //   _profileCubit = ProfileCubit(
//   //     ProfileRemoteRepositoryImpl(),
//   //   );
//   //   super.initState();
//   // }

//   // @override
//   // void dispose() {
//   //   _profileCubit.close();
//   //   super.dispose();
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: white249Color,
//         body: BlocConsumer<ProfileCubit, ProfileState>(
//             listener: (context, state) {
//           if (state is ProfileIsFailed) {
//             Commons().showSnackBarErrorr(context, state.message!);
//           }
//         }, builder: (context, state) {
//           if (state is ProfileIsLoading) {
//             return const Center(
//               child: LinearProgressIndicator(),
//             );
//           } else if (state is ProfileIsSucces) {
//             return Stack(children: [
//               Column(
//                 children: [
//                   Container(
//                     padding: EdgeInsets.only(
//                       bottom: 18,
//                       right: 12,
//                     ),
//                     height: 145,
//                     decoration: BoxDecoration(color: redColor),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.only(left: 24),
//                           child: InkWell(
//                               onTap: () {
//                                 _showSelectPhotoOptions(context);
//                                 setState(() {});
//                               },
//                               child: _imageFile == null
//                                   ? CircleAvatar(
//                                       backgroundImage:
//                                           AssetImage("assets/images/DD45.png"))
//                                   : CircleAvatar(
//                                       backgroundImage:
//                                           FileImage(File(_imageFile!.path)),
//                                     )),
//                         ),
//                         IconButton(
//                           onPressed: () =>
//                               context.goNamed(Routes.dashboardScreen, extra: 3),
//                           icon: Icon(Icons.edit_outlined),
//                           color: white249Color,
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     height: 52,
//                   ),
//                   DetailCard(
//                     text: "Kartu Donor",
//                     image: "assets/images/DD10.png",
//                     onTap: () => context.go('/kartudonor'),
//                   ),
//                   SizedBox(
//                     height: 15,
//                   ),
//                   DetailCard(
//                     text: "Riwayat Donor",
//                     image: "assets/images/DD12.png",
//                     onTap: () => context.go('/riwayatdonor'),
//                   ),
//                   SizedBox(
//                     height: 15,
//                   ),
//                   DetailCard(
//                     text: "Ubah Kata Sandi",
//                     image: "assets/images/DD13.png",
//                     onTap: () => context.go('/ubahsandi'),
//                   ),
//                   SizedBox(
//                     height: 15,
//                   ),
//                   DetailCard(
//                     text: "Keluar",
//                     image: "assets/images/DD9.png",
//                     onTap: () {
//                       _showDialog(context);
//                     },
//                   ),
//                 ],
//               ),
//               Positioned(
//                 top: 48,
//                 left: 75,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       "${state.data.name}",
//                       style: TextStyle(
//                           fontFamily: "Plus Jakarta Sans",
//                           fontSize: 14,
//                           fontWeight: FontWeight.w700,
//                           color: white255Color),
//                     ),
//                     SizedBox(
//                       height: 4,
//                     ),
//                     Text(
//                       "ATW1234567891011",
//                       style: TextStyle(
//                           fontFamily: "Plus Jakarta Sans",
//                           fontSize: 8,
//                           fontWeight: FontWeight.w600,
//                           color: white249Color),
//                     )
//                   ],
//                 ),
//               ),
//               Positioned(
//                 top: 103,
//                 left: 24,
//                 child: Container(
//                     padding: const EdgeInsets.fromLTRB(12, 6, 11, 12),
//                     width: 80,
//                     height: 70,
//                     decoration: BoxDecoration(
//                         color: white249Color,
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.black.withOpacity(0.2),
//                             blurRadius: 3,
//                             spreadRadius: 1,
//                             offset: const Offset(0, 0),
//                           ),
//                         ],
//                         borderRadius: BorderRadius.circular(4)),
//                     child: Column(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           Padding(padding: EdgeInsets.only(top: 6, right: 12)),
//                           Text(
//                             "Total Donor",
//                             style: CustomStyle01(),
//                           ),
//                           SizedBox(
//                             height: 16,
//                           ),
//                           Text(
//                             "0",
//                             style: CustomStyle2174(),
//                           )
//                         ])),
//               ),
//               Positioned(
//                 top: 103,
//                 left: 110,
//                 child: Container(
//                     padding: const EdgeInsets.fromLTRB(12, 10, 11, 12),
//                     width: 226,
//                     height: 70,
//                     decoration: BoxDecoration(
//                         color: white249Color,
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.black.withOpacity(0.2),
//                             blurRadius: 3,
//                             spreadRadius: 1,
//                             offset: const Offset(0, 0),
//                           ),
//                         ],
//                         borderRadius: BorderRadius.circular(4)),
//                     child: Column(
//                       children: [
//                         Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text(
//                                 "Terakhir Donor",
//                                 style: CustomStyle261(),
//                               ),
//                               Text(
//                                 "Belum Pernah",
//                                 style: CustomStyle1531(),
//                               )
//                             ]),
//                         SizedBox(
//                           height: 4,
//                         ),
//                         Divider(
//                           indent: 0,
//                           color: white230Color,
//                         ),
//                         SizedBox(
//                           height: 4,
//                         ),
//                         Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text(
//                                 "Donor Selanjutnya",
//                                 style: CustomStyle261(),
//                               ),
//                               Text(
//                                 "Belum Pernah",
//                                 style: CustomStyle1531(),
//                               )
//                             ]),
//                       ],
//                     )),
//               ),
//             ]);
//           }
//           return Center(
//             child: Text("Data"),
//           );
//         }));
//   }

//   void saveImage(String val) async {
//     final sharedPref = await SharedPreferences.getInstance();
//     sharedPref.setString('path', val);
//     loadImage();
//   }

//   void loadImage() async {
//     final sharedPref = await SharedPreferences.getInstance();
//     setState(() {
//       _imageFile = sharedPref.getString('path') as PickedFile?;
//     });
//   }

//   void deleteImage() async {
//     final sharedPref = await SharedPreferences.getInstance();
//     sharedPref.remove('path');
//     loadImage();
//   }
// }

// class DetailCard extends StatelessWidget {
//   final String text;
//   final String image;

//   final void Function()? onTap;
//   const DetailCard({
//     Key? key,
//     required this.text,
//     required this.image,
//     required this.onTap,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<ProfileCubit, ProfileState>(
//       builder: (context, profileState) {
//         return Container(
//           width: 312,
//           height: 46,
//           decoration: BoxDecoration(boxShadow: const [
//             BoxShadow(
//               offset: Offset.zero,
//               blurRadius: 1,
//               color: Color.fromRGBO(0, 0, 0, 0.25),
//             )
//           ], color: white249Color, borderRadius: BorderRadius.circular(6)),
//           child: Stack(
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Container(
//                       margin: EdgeInsets.only(left: 15),
//                       child: Image(image: AssetImage(image))),
//                   IconButton(
//                     onPressed: onTap,
//                     icon: Icon(
//                       Icons.arrow_forward_ios_rounded,
//                       size: 18,
//                       color: greyColor,
//                     ),
//                   ),
//                 ],
//               ),
//               Positioned(
//                 top: 17,
//                 left: 38,
//                 child: Container(
//                     margin: EdgeInsets.only(left: 12),
//                     child: Text(
//                       text,
//                       style: CustomStyle02(),
//                     )),
//               )
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
