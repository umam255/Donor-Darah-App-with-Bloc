// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_router/go_router.dart';
// import '../../../utility/custom_textStyle.dart';
// import '../../../utility/commons.dart';
// import '../../navigation/routes.dart';
// import '../BLOC/job/cubit/job_cubit.dart';
// import '../udd/cubit/unit_udd_cubit.dart';

// class UnitTest extends StatefulWidget {
//   final int unitId;
//   const UnitTest({
//     Key? key,
//     required this.unitId,
//   }) : super(key: key);

//   @override
//   State<UnitTest> createState() => _UnitTestState();
// }

// class _UnitTestState extends State<UnitTest> {
//   @override
//   void initState() {
//     super.initState();
//     isPush = isPush;
//     pilihPekerjaan = pilihPekerjaan;
//   }

//   bool isPush = false;
//   String pilihPekerjaan = 'Pilih Pekerjaan';
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: white249Color,
//       appBar: PreferredSize(
//         preferredSize: const Size.fromHeight(48),
//         child: AppBar(
//           shadowColor: const Color.fromRGBO(0, 0, 0, 0.25),
//           title: Row(
//             children: [
//               IconButton(
//                   onPressed: () {
//                     context.go('/dashboard');
//                   },
//                   icon: const Icon(
//                     Icons.arrow_back,
//                     size: 20,
//                     color: black01Color,
//                   )),
//               Text(
//                 'Stok Darah',
//                 style: CustomStyle04(),
//               ),
//             ],
//           ),
//           backgroundColor: white249Color,
//         ),
//       ),
//       body: SafeArea(
//         child: Stack(
//           children: [
//             Container(
//               height: 45,
//               decoration: const BoxDecoration(
//                 border: Border(
//                     bottom:
//                         BorderSide(color: Color.fromRGBO(212, 212, 212, 1))),
//               ),
//               width: 312,
//               margin: const EdgeInsets.fromLTRB(24, 14, 24, 0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Row(
//                     children: [
//                       const Image(image: AssetImage("assets/images/DD38.png")),
//                       const SizedBox(
//                         width: 14,
//                       ),
//                       Text(pilihPekerjaan, style: CustomStyle267()),
//                     ],
//                   ),
//                   InkWell(
//                     onTap: () {
//                       isPush = true;
//                       setState(() {});
//                     },
//                     child: Icon(
//                         isPush ? Icons.arrow_drop_up : Icons.arrow_drop_down),
//                   ),
//                 ],
//               ),
//             ),
//             BlocConsumer<StokDarahCubit, StokDarahState>(
//               listener: (context, state) {
//                 if (state is UnitUddIsError) {
//                   Commons().showSnackBarErrorr(context, state.toString());
//                 }
//               },
//               builder: (context, state) {
//                 if (state is StokDarahIsLoading) {
//                   return const Center(
//                     child: CircularProgressIndicator(
//                       color: redColor,
//                     ),
//                   );
//                 } else if (state is StokDarahIsSucces) {
//                   return Padding(
//                     padding: const EdgeInsets.only(top: 60),
//                     child: Expanded(
//                         child: ListView.builder(
//                             itemCount: state.data.length,
//                             itemBuilder: (BuildContext context, int index) {
//                               var date = state.data[index];
//                               return Container(
//                                 height: 40,
//                                 margin: const EdgeInsets.only(
//                                     left: 24, right: 24, bottom: 13),
//                                 decoration: BoxDecoration(
//                                     boxShadow: const [
//                                       BoxShadow(
//                                         offset: Offset.zero,
//                                         blurRadius: 1,
//                                         color: Color.fromRGBO(0, 0, 0, 0.25),
//                                       )
//                                     ],
//                                     color: white249Color,
//                                     borderRadius: BorderRadius.circular(8)),
//                                 child: Padding(
//                                   padding: const EdgeInsets.only(left: 12),
//                                   child: Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: <Widget>[
//                                       Container(
//                                         child: Row(
//                                           children: [
//                                             Text(
//                                               "Golongan Darah",
//                                               style: CustomStyle267(),
//                                             ),
//                                             const SizedBox(
//                                               width: 12,
//                                             ),
//                                             Text(
//                                               date.bloodType!,
//                                               style: const TextStyle(
//                                                   fontSize: 19,
//                                                   fontFamily:
//                                                       "Plus Jakarta Sans",
//                                                   color: black01Color,
//                                                   fontWeight: FontWeight.w600),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                       IconButton(
//                                           onPressed: () {
//                                             context.goNamed(
//                                                 Routes.screenstokdarahA);
//                                           },
//                                           icon: const Icon(
//                                               Icons.arrow_forward_ios_rounded,
//                                               size: 16,
//                                               color: greyColor))
//                                     ],
//                                   ),
//                                 ),
//                               );
//                             })),
//                   );
//                 }
//                 return Container();
//               },
//             ),
//             if (isPush)
//               BlocBuilder<JobCubit, JobState>(
//                 builder: (context, state) {
//                   if (state is JobIsSucces) {
//                     return ListUDD(
//                       shrinkWrap: true,
//                       child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: state.data
//                               .map((data) => Padding(
//                                     padding: const EdgeInsets.only(bottom: 22),
//                                     child: InkWell(
//                                       onTap: () {
//                                         isPush = false;
//                                         pilihPekerjaan = data.name!;
//                                         setState(() {});
//                                       },
//                                       child: Text(
//                                         data.name!,
//                                         style: const TextStyle(
//                                             fontFamily: "Plus Jakarta Sans",
//                                             fontSize: 14,
//                                             fontWeight: FontWeight.w500,
//                                             color:
//                                                 Color.fromRGBO(45, 45, 45, 1)),
//                                       ),
//                                     ),
//                                   ))
//                               .toList()),
//                     );
//                   }
//                   return Container();
//                 },
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class ListUDD extends StatelessWidget {
//   final bool shrinkWrap;
//   final Widget child;

//   const ListUDD({
//     Key? key,
//     required this.shrinkWrap,
//     required this.child,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.only(top: 25, left: 16),
//       margin: const EdgeInsets.only(top: 59, left: 24, right: 24),
//       height: 180,
//       width: 312,
//       decoration: BoxDecoration(boxShadow: const [
//         BoxShadow(blurRadius: 5, color: Color.fromRGBO(0, 0, 0, 0.25))
//       ], color: white255Color, borderRadius: BorderRadius.circular(4)),
//       child: child,
//     );
//   }
// }
