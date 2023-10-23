// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: unused_local_variable

import 'package:donor_darah/presentation/pages/stok_darah/stock_darah/cubit/detail_stock_darah/cubit/detail_stock_darah_cubit.dart';
import 'package:donor_darah/utility/custom_textStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../base/widget/BaseColor.dart';
import '../../../utility/commons.dart';

class ScreenStokDarahA extends StatefulWidget {
  final String tittle;
  const ScreenStokDarahA({
    Key? key,
    required this.tittle,
  }) : super(key: key);

  @override
  State<ScreenStokDarahA> createState() => _ScreenStokDarahAState();
}

String? groupValue;

class _ScreenStokDarahAState extends State<ScreenStokDarahA> {
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
          children: [
            const Text(
              'Stock Darah',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              widget.tittle,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: BlocBuilder<DetailStockDarahCubit, DetailStockDarahState>(
        builder: (context, state) {
          if (state is DetailStockDarahIsLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: BaseColor.red,
              ),
            );
          } else if (state is DetailStockDarahIsError) {
            Commons().showSnackBarErrorr(
              context,
              'Detail Stock Darah Kosong',
            );
          } else if (state is DetailStockDarahIsSuccess) {
            return ListView.builder(
              itemCount: state.data!.length,
              itemBuilder: (BuildContext context, int index) {
                var data = state.data![index];
                return SafeArea(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 25, left: 24, right: 24),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              data.Title,
                              style: CustomStyle266(),
                            ),
                            Text(
                              "${data.Stock}",
                              style: const TextStyle(
                                color: redColor,
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                                fontFamily: "plus jakarta sans",
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        const Divider(
                          thickness: 1,
                          color: white230Color,
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
          return const Text('Detail Stock Darah Kosong');
        },
      ),
    );
  }
}
