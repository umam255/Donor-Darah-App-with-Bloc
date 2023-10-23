// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:donor_darah/presentation/navigation/routes.dart';
import 'package:donor_darah/presentation/pages/notifikasi_detail/cubit/notifikasi_detail_cubit.dart';
import 'package:donor_darah/utility/custom_textStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class NotifikasiDetailScreen extends StatefulWidget {
  const NotifikasiDetailScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<NotifikasiDetailScreen> createState() => _NotifikasiDetailScreenState();
}

class _NotifikasiDetailScreenState extends State<NotifikasiDetailScreen> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return BlocBuilder<NotifikasiDetailCubit, NotifikasiDetailState>(
      builder: (context, state) {
        if (state is NotifikasiDetailIsSuccess) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              leading: const BackButton(
                color: Colors.black,
              ),
            ),
            body: Container(
              margin: const EdgeInsets.all(24),
              child: ListTile(
                title: Text(
                  state.data.title,
                  style: TextStyle(
                    fontSize: width * 0.032,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Text(
                        state.data.desc,
                        style: TextStyle(
                          fontSize: width * 0.03,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        context.goNamed(Routes.uddPage);
                      },
                      child: Text(
                        'Ajukan Donor Darah Sekarang',
                        style: TextStyle(
                            color: redColor,
                            fontSize: width * 0.032,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        } else if (state is NotifikasiDetailIsLoading) {
          return const CircularProgressIndicator(
            color: redColor,
          );
        } else if (state is NotifikasiDetailIsFailed) {
          return Center(
            child: Text(
              state.message,
              style: const TextStyle(color: Colors.black),
            ),
          );
        }
        return Container();
      },
    );
  }
}
