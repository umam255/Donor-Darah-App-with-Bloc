// ignore_for_file: file_names, avoid_unnecessary_containers, sort_child_properties_last, unused_local_variable, prefer_typing_uninitialized_variables, non_constant_identifier_names, unnecessary_string_interpolations, sized_box_for_whitespace, unnecessary_string_escapes
import 'package:donor_darah/presentation/pages/agenda/cubit/agenda_cubit.dart';
import 'package:donor_darah/utility/custom_textStyle.dart';
import 'package:donor_darah/presentation/navigation/routes.dart';
import 'package:donor_darah/utility/commons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class AgendaScreen extends StatefulWidget {
  const AgendaScreen({Key? key}) : super(key: key);

  @override
  State<AgendaScreen> createState() => _AgendaScreenState();
}

class _AgendaScreenState extends State<AgendaScreen> {
  @override
  void initState() {
    BlocProvider.of<AgendaCubit>(context).fetchAgenda();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: redColor,
        elevation: 0,
        titleSpacing: width * 0.1,
        toolbarHeight: height * 0.13,
        title: Text(
          'Agenda Donor Darah',
          style: TextStyle(
            fontSize: width * 0.045,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: width * 0.1),
            child: Image.asset(
              'assets/images/DD17.png',
              height: height * 0.1,
              width: width * 0.11,
            ),
          ),
        ],
      ),
      body: BlocBuilder<AgendaCubit, AgendaState>(
        builder: (context, agendaState) {
          if (agendaState is AgendaIsLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: redColor,
              ),
            );
          } else if (agendaState is AgendaIsSucces) {
            return ListView.builder(
              itemCount: agendaState.data.length,
              itemBuilder: (context, index) {
                final data = agendaState.data[index];
                return Padding(
                  padding: const EdgeInsets.only(left: 24, right: 24, top: 30),
                  child: IntrinsicHeight(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: const Color(0xffE6E6E6),
                          style: BorderStyle.solid,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${data.name}",
                              style: TextStyle(
                                letterSpacing: 0.5,
                                fontSize: width * 0.03,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 17,
                            ),
                            Container(
                              child: Row(
                                children: [
                                  const Image(
                                    image: AssetImage("assets/images/DD18.png"),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 10),
                                    child: Text(
                                      "${Commons().formatTanggal(data.date)}",
                                      style: TextStyle(
                                        fontSize: width * 0.025,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Container(
                              child: Row(
                                children: [
                                  const Image(
                                    image: AssetImage("assets/images/DD19.png"),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(
                                      left: 10,
                                    ),
                                    child: Text(
                                      "${Commons().formatJam(data.timeStart, data.date)}-${Commons().formatJam(data.timeEnd, data.date)} WIB",
                                      style: TextStyle(fontSize: width * 0.025),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Container(
                              child: Row(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(
                                      right: 10,
                                      // bottom: 25,
                                    ),
                                    child: const Image(
                                      image: AssetImage(
                                        "assets/images/DD20.png",
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      '${data.address}',
                                      style: TextStyle(
                                        fontSize: width * 0.025,
                                      ),
                                      textAlign: TextAlign.left,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 5,
                                      softWrap: true,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(top: 55),
                              alignment: Alignment.bottomRight,
                              child: ElevatedButton(
                                onPressed: () {
                                  print('LIHAT TIKET DONOR ID: ${data.id}');
                                  return context.goNamed(
                                    Routes.agendaDetailScreen,
                                    extra: data.id,
                                  );
                                },
                                child: Text(
                                  "Lihat Tiket Donor",
                                  style: CustomStyle2492(),
                                ),
                                style: ElevatedButton.styleFrom(
                                  fixedSize: Size(
                                    width * 0.45,
                                    height * 0.055,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                      8,
                                    ),
                                  ),
                                  elevation: 0,
                                  backgroundColor: const Color(0xffD91E2A),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          } else if (agendaState is AgendaIsOpenIsEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Transform.scale(
                    scale: 1.2,
                    child: SvgPicture.asset(
                      'assets/Screen_kosong/Agenda-kosong.svg',
                      color: const Color(0xFFE6E6E6),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Text(
                    'Anda Tidak Memiliki Agenda',
                    style: TextStyle(
                      fontSize: width * 0.03,
                      color: const Color(0xFfCCCCCC),
                    ),
                  )
                ],
              ),
            );
          } else if (agendaState is AgendaIsFailed) {
            return Center(
              child: Text('${agendaState.message}'),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
