// ignore_for_file: unnecessary_string_interpolations

import 'package:donor_darah/presentation/pages/stok_darah/stock_darah/cubit/stock_darah_cubit.dart';
import 'package:donor_darah/utility/custom_textStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../base/widget/BaseColor.dart';
import '../../../utility/commons.dart';
import '../../navigation/routes.dart';
import '../udd/cubit/unit_udd_cubit.dart';

class ScreenStokDarah extends StatefulWidget {
  final int unitId;
  const ScreenStokDarah({super.key, required this.unitId});

  @override
  State<ScreenStokDarah> createState() => _ScreenStokDarahState();
}

class _ScreenStokDarahState extends State<ScreenStokDarah> {
  bool isOpen = false;
  int _dropdownValueUnitId = 1;

  @override
  void initState() {
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
          'Stock Darah',
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
                        items: unitState.data.map(
                          (data) {
                            return DropdownMenuItem(
                              value: data.id,
                              child: Text(data.name),
                            );
                          },
                        ).toList(),
                        onChanged: (value) {
                          setState(
                            () {
                              _dropdownValueUnitId = value!;
                              context.read<StockDarahCubit>().fetchStockDarah(
                                    unitId: _dropdownValueUnitId,
                                  );
                            },
                          );
                        },
                      ),
                    );
                  }
                  return Container();
                },
              ),
              const SizedBox(height: 14),
              BlocBuilder<StockDarahCubit, StockDarahState>(
                builder: (context, state) {
                  if (state is StockDarahIsLoading) {
                    return const Expanded(
                      child: Center(
                        child: CircularProgressIndicator(
                          color: BaseColor.red,
                        ),
                      ),
                    );
                  } else if (state is StockDarahIsError) {
                    Commons().showSnackBarErrorr(context, 'Stock Darah Kosong');
                  } else if (state is StockDarahIsSuccess) {
                    return Expanded(
                      child: state.data!.isEmpty
                          ? const Center(
                              child: Text('Stock Darah Kosong'),
                            )
                          : ListView.builder(
                              itemCount: state.data!.length,
                              itemBuilder: (BuildContext context, int index) {
                                var data = state.data![index];
                                return Padding(
                                  padding: const EdgeInsets.only(top: 18),
                                  child: Container(
                                    height: height * 0.07,
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      boxShadow: const [
                                        BoxShadow(
                                          offset: Offset.zero,
                                          blurRadius: 1,
                                          color: Color.fromRGBO(0, 0, 0, 0.25),
                                        )
                                      ],
                                      color: white249Color,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 12),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                "Golongan Darah",
                                                style: CustomStyle267(),
                                              ),
                                              const SizedBox(
                                                width: 12,
                                              ),
                                              Text(
                                                "${data.title}",
                                                style: const TextStyle(
                                                    fontSize: 19,
                                                    fontFamily:
                                                        "Plus Jakarta Sans",
                                                    color: black01Color,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ],
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              context.goNamed(
                                                  Routes.screenstokdarahA,
                                                  extra: {
                                                    'id': data.id,
                                                    'tittle': data.title,
                                                  });
                                            },
                                            icon: const Icon(
                                                Icons.arrow_forward_ios_rounded,
                                                size: 16,
                                                color: greyColor),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                    );
                  }
                  return const Text('Stock Darah Kosong');
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
