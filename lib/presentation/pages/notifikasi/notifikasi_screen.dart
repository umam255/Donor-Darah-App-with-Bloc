// ignore_for_file: file_names, avoid_unnecessary_containers, sort_child_properties_last, unused_local_variable, prefer_typing_uninitialized_variables, non_constant_identifier_names, unnecessary_string_interpolations, sized_box_for_whitespace, unnecessary_string_escapes

import 'package:donor_darah/presentation/navigation/routes.dart';
import 'package:donor_darah/presentation/pages/Notifikasi/cubit/notifikasi_cubit_dart_cubit.dart';
import 'package:donor_darah/presentation/pages/Notifikasi/cubit/notifikasi_cubit_dart_state.dart';
import 'package:donor_darah/presentation/pages/notifikasi_detail/cubit/notifikasi_detail_cubit.dart';
import 'package:donor_darah/utility/custom_textStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class NotifikasiScreen extends StatefulWidget {
  const NotifikasiScreen({Key? key}) : super(key: key);

  @override
  State<NotifikasiScreen> createState() => _NotifikasiScreenState();
}

bool isOpen = false;

class _NotifikasiScreenState extends State<NotifikasiScreen> {
  @override
  void initState() {
    BlocProvider.of<NotifikasiCubit>(context).fetchNotifikasi();
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
        toolbarHeight: height * 0.13,
        titleSpacing: width * 0.1,
        title: Text(
          'Notifikasi',
          style: TextStyle(
            fontSize: width * 0.045,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: width * 0.05),
            child: Image.asset(
              'assets/images/DD16.png',
              height: height * 0.1,
              width: width * 0.18,
            ),
          ),
        ],
      ),
      body: BlocBuilder<NotifikasiCubit, NotifikasiState>(
        builder: (context, state) {
          if (state is NotifikasiIsLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: redColor,
              ),
            );
          } else if (state is NotifikasiIsSucces) {
            if (state.data.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Transform.scale(
                      scale: 1.2,
                      child: Image.asset(
                        'assets/Screen_kosong/Notifikasi_Kosong.png',
                      ),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Text(
                      'Belum ada notifikasi',
                      style: TextStyle(
                        fontSize: width * 0.03,
                        color: const Color(0xFfCCCCCC),
                      ),
                    )
                  ],
                ),
              );
            } else {
              return ListView.builder(
                itemCount: state.data.length,
                itemBuilder: (context, index) {
                  var data = state.data[index];
                  return Container(
                    decoration: BoxDecoration(
                      color: data.status == 'UNREAD'
                          ? const Color(0xFFFCE9EA)
                          : Colors.white,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    margin: const EdgeInsets.all(24),
                    child: ListTile(
                      onTap: () {
                        context
                            .read<NotifikasiDetailCubit>()
                            .fetchDetailNotifikasi(data.id);
                        context.goNamed(Routes.notifikasiDetailScreen);
                      },
                      title: Text(
                        data.title,
                        style: TextStyle(
                          color: redColor,
                          fontSize: width * 0.03,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        data.desc,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: width * 0.03,
                        ),
                      ),
                    ),
                  );
                },
              );
            }
          } else if (state is NotifikasiIsLoading) {
            return const CircularProgressIndicator(
              color: redColor,
            );
          } else if (state is NotifikasiIsFailed) {
            return Center(
              child: Text('${state.message}'),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
