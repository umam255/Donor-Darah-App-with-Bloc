// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:donor_darah/base/widget/BaseColor.dart';
import 'package:donor_darah/presentation/pages/jadwal_donor/cubit/jadwal_donor_cubit.dart';
import 'package:donor_darah/presentation/pages/udd/cubit/unit_udd_cubit.dart';
import 'package:donor_darah/utility/commons.dart';

class RescheduleDonorScreen extends StatefulWidget {
  final int idAgenda;
  final int idUnit;
  const RescheduleDonorScreen({
    Key? key,
    required this.idAgenda,
    required this.idUnit,
  }) : super(key: key);

  @override
  State<RescheduleDonorScreen> createState() => _RescheduleDonorScreenState();
}

class _RescheduleDonorScreenState extends State<RescheduleDonorScreen> {
  int _dropdownValueUnitId = 0;
  int idUnit = 0;
  @override
  void initState() {
    super.initState();
    BlocProvider.of<UnitUddCubit>(context).fetchUnitUdd();
    _dropdownValueUnitId = widget.idUnit;
    BlocProvider.of<JadwalDonorCubit>(context).fetchSchedule(
      unitId: widget.idAgenda,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.black,
        ),
        title: const Text(
          'Jadwal Donor',
          style: TextStyle(
            color: Colors.black,
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: Colors.white,
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 14, left: 24, right: 24),
        child: SafeArea(
          child: Column(
            children: [
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
                        value: _dropdownValueUnitId,
                        decoration: InputDecoration(
                          prefixIcon: Image.asset(
                            'assets/images/udd_icon.png',
                            alignment: Alignment.centerLeft,
                          ),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                        items: unitState.data.map((data) {
                          return DropdownMenuItem(
                            value: data.id,
                            child: Text(data.name),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            _dropdownValueUnitId = value!;
                            context.read<JadwalDonorCubit>().fetchSchedule(
                                  unitId: _dropdownValueUnitId,
                                );
                          });
                        },
                      ),
                    );
                  }
                  return Container();
                },
              ),
              const SizedBox(height: 14),
              BlocBuilder<JadwalDonorCubit, JadwalDonorState>(
                builder: (context, state) {
                  if (state is JadwalDonorIsLoading) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: BaseColor.red,
                      ),
                    );
                  } else if (state is JadwalDonorIsError) {
                    Commons().showSnackBarErrorr(context, 'Jadwal donor error');
                  } else if (state is JadwalDonorIsSuccess) {
                    return Expanded(
                      child: state.data!.isEmpty
                          ? const Center(
                              child: Text('Tidak Ada Jadwal'),
                            )
                          : ListView.builder(
                              itemCount: state.data!.length,
                              itemBuilder: (BuildContext context, int index) {
                                var date = state.data![index];
                                return Column(
                                  children: [
                                    Container(
                                      height: 36,
                                      color: const Color(0xffFCE9EA),
                                      child: Row(
                                        children: [
                                          const SizedBox(width: 20),
                                          Image.asset(
                                              'assets/images/kalender_icon.png'),
                                          const SizedBox(width: 12),
                                          Text(
                                            Commons().formatTanggal(date.date),
                                            style: const TextStyle(
                                              color: Color(0xffD91E2A),
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 18),
                                    ListView.builder(
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemCount:
                                          state.data![index].schedule.length,
                                      itemBuilder: (BuildContext context,
                                          int schedulleIndex) {
                                        var schedule = state.data![index]
                                            .schedule[schedulleIndex];
                                        return Column(
                                          children: [
                                            ListTile(
                                              dense: true,
                                              contentPadding: EdgeInsets.zero,
                                              minLeadingWidth: 0,
                                              leading: Image.asset(
                                                'assets/images/udd_icon.png',
                                                scale: 1.1,
                                              ),
                                              title: Text(schedule.name),
                                              subtitle: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const SizedBox(height: 8),
                                                  Text(schedule.address),
                                                  const SizedBox(height: 8),
                                                  Text(
                                                    "${Commons().formatJam(schedule.timeStart, date.date)} - ${Commons().formatJam(schedule.timeEnd, date.date)} WIB",
                                                    style: const TextStyle(
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              trailing: SizedBox(
                                                height: 24,
                                                child: ElevatedButton(
                                                  onPressed:
                                                      (schedule.type == 'Umum')
                                                          ? () {
                                                              // context.goNamed(
                                                              //   Routes
                                                              //       .detailJadwalPage,
                                                              // );
                                                            }
                                                          : null,
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        const Color(0xffCCCCCC),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4),
                                                    ),
                                                    elevation: 0,
                                                  ),
                                                  child: Text(
                                                    schedule.type,
                                                    style: const TextStyle(
                                                      fontSize: 8,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 18),
                                          ],
                                        );
                                      },
                                    ),
                                    const SizedBox(height: 18),
                                  ],
                                );
                              },
                            ),
                    );
                  }
                  return const Text('');
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
