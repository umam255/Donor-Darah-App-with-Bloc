import 'package:donor_darah/presentation/pages/agenda/cubit/agenda_cubit.dart';
import 'package:donor_darah/presentation/pages/detail_agenda/cancel_donor/cubit/cancel_donor_cubit.dart';
import 'package:donor_darah/utility/commons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:donor_darah/presentation/navigation/routes.dart';
import 'package:donor_darah/presentation/pages/detail_agenda/cubit/agenda_detail_cubit.dart';
import 'package:donor_darah/utility/custom_textStyle.dart';

class DetailAgendaScreen extends StatefulWidget {
  final String idAgenda;
  const DetailAgendaScreen({
    Key? key,
    required this.idAgenda,
  }) : super(key: key);

  @override
  State<DetailAgendaScreen> createState() => _DetailAgendaScreenState();
}

class _DetailAgendaScreenState extends State<DetailAgendaScreen> {
  String idAgenda = '';

  @override
  void initState() {
    BlocProvider.of<AgendaDetailCubit>(context)
        .fetchAgendaDetail(widget.idAgenda);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: redColor,
        leading: const BackButton(),
        title: Text(
          'Bukti Pengajuan Donor',
          style: TextStyle(fontSize: width * 0.033),
        ),
      ),
      backgroundColor: const Color.fromRGBO(252, 233, 234, 1),
      body: BlocListener<CancelDonorCubit, CancelDonorState>(
        listener: (context, cancelState) {
          if (cancelState is CancelDonorIsSucces) {
            context.read<AgendaCubit>().fetchAgenda();
            Commons().showFlashMessage(
              context,
              'Agenda Donor Darah Berhasil Dibatalkan',
            );
            context.goNamed(Routes.agendaScreen);
          } else if (cancelState is CancelDonorIsFailed) {
            Commons().showSnackBarErrorr(context, 'Cancel Agenda is failed');
          }
        },
        child: BlocBuilder<AgendaDetailCubit, AgendaDetailState>(
          builder: (context, agendaDetailState) {
            if (agendaDetailState is AgendaDetailIsLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  color: redColor,
                ),
              );
            } else if (agendaDetailState is AgendaDetailIsSucces) {
              final dataAgenda = agendaDetailState.data;
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Column(
                        children: [
                          Container(
                            child: Text(
                              "Donor Darah",
                              style: TextStyle(
                                fontSize: width * 0.03,
                                fontFamily: "Plus Jakarta Sans",
                                color: redColor,
                              ),
                            ),
                          ),
                          SizedBox(height: width * 0.01),
                          Container(
                            child: Text(
                              dataAgenda.unit.name,
                              style: TextStyle(
                                fontSize: width * 0.04,
                                fontFamily: "Plus Jakarta Sans",
                                color: redColor,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white,
                      ),
                      child: Container(
                        margin: const EdgeInsets.only(left: 24, top: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Text(
                                "Bukti Pengajuan Donor",
                                style: TextStyle(
                                  fontSize: width * 0.04,
                                  fontFamily: "Plus Jakarta Sans",
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: width * 0.06,
                            ),
                            Text(
                              "ID Donor",
                              style: TextStyle(
                                fontSize: width * 0.03,
                                color: greyColor,
                              ),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              dataAgenda.code,
                              style: TextStyle(
                                fontSize: width * 0.03,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 14,
                            ),
                            Text(
                              "Nama Pendonor",
                              style: TextStyle(
                                fontSize: width * 0.03,
                                color: greyColor,
                              ),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              dataAgenda.user.name,
                              style: TextStyle(
                                fontSize: width * 0.03,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 14,
                            ),
                            Text(
                              "Jadwal Donor",
                              style: TextStyle(
                                fontSize: width * 0.03,
                                color: grey107Color,
                              ),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              Commons().formatTanggal(dataAgenda.date),
                              style: TextStyle(
                                fontSize: width * 0.03,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 14,
                            ),
                            Text(
                              "Jam",
                              style: TextStyle(
                                fontSize: width * 0.03,
                                color: greyColor,
                              ),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              "${Commons().formatJam(dataAgenda.timeStart, dataAgenda.date)} - ${Commons().formatJam(dataAgenda.timeEnd, dataAgenda.date)} WIB",
                              style: TextStyle(
                                fontSize: width * 0.03,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 14,
                            ),
                            Text(
                              "Lokasi",
                              style: TextStyle(
                                fontSize: width * 0.03,
                                color: greyColor,
                              ),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              dataAgenda.unit.name,
                              style: TextStyle(
                                fontSize: width * 0.03,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: width * 0.14,
                            ),
                            Center(
                              child: Text(
                                "Tunjukan Bukti Pengajuan Donor ini kepada petugas PMI",
                                style: TextStyle(
                                  fontSize: width * 0.02,
                                  fontFamily: "Plus Jakarta Sans",
                                  color: redColor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            } else if (agendaDetailState is AgendaDetailIsFailed) {
              return Center(
                child: Text(agendaDetailState.message!),
              );
            } else {
              return Container();
            }
          },
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(24),
        child: ElevatedButton(
          onPressed: () {
            print('AgendaID : ${widget.idAgenda}');
            dialogBatalkan(context, width, height, widget.idAgenda);
          },
          style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            backgroundColor: redColor,
            fixedSize: Size(width, height * 0.06),
          ),
          child: Text(
            "Batalkan",
            style: TextStyle(
              fontSize: width * 0.035,
              fontFamily: "Plus Jakarta Sans",
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  Future<dynamic> dialogBatalkan(BuildContext context, double width,
      double height, String idAgendaDialod) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          actionsPadding: const EdgeInsets.all(25),
          elevation: null,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Batalkan Donor",
                style: TextStyle(
                  fontSize: width * 0.03,
                  fontWeight: FontWeight.bold,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pop(true);
                },
                child: const Icon(
                  Icons.close,
                  size: 20,
                ),
              ),
            ],
          ),
          content: Text(
            "Apakah kamu yakin ingin membatalkan agenda donor darah ?",
            style: TextStyle(fontSize: width * 0.03),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                "Kembali",
                style: TextStyle(
                  fontSize: width * 0.03,
                  color: redColor,
                ),
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            ElevatedButton(
              onPressed: () {
                BlocProvider.of<CancelDonorCubit>(context).putCancelDonor(
                  idAgendaDialod,
                );
              },
              style: ElevatedButton.styleFrom(
                fixedSize: Size(width * 0.2, height * 0.03),
                elevation: 0,
                backgroundColor: redColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                "Ya",
                style: TextStyle(
                  fontSize: width * 0.03,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
