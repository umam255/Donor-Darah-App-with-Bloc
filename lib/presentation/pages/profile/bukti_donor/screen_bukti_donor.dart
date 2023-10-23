import 'package:donor_darah/presentation/pages/BLOC/lihat_bukti_donor/cubit/lihat_bukti_donor_cubit.dart';
import 'package:donor_darah/utility/custom_textStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScreenBuktiDonor extends StatefulWidget {
  const ScreenBuktiDonor({super.key});

  @override
  State<ScreenBuktiDonor> createState() => _ScreenBuktiDonorState();
}

class _ScreenBuktiDonorState extends State<ScreenBuktiDonor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Bukti Donor',
          style: TextStyle(
            fontSize: 14,
            color: Colors.black,
          ),
        ),
        leading: const BackButton(
          color: Colors.black,
        ),
      ),
      body: BlocBuilder<LihatBuktiDonorCubit, LihatBuktiDonorState>(
        builder: (context, state) {
          if (state is LihatBuktiDonorIsLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: redColor,
              ),
            );
          } else if (state is LihatBuktiDonorIsSucces) {
            return Container(
              padding: const EdgeInsets.all(24),
              child: Image.network(state.data.url!),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
