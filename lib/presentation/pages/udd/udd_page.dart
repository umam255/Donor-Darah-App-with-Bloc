// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:donor_darah/base/widget/BaseColor.dart';
import 'package:donor_darah/controller/my_controller.dart';
import 'package:donor_darah/presentation/navigation/routes.dart';
import 'package:donor_darah/presentation/pages/udd/cubit/unit_udd_cubit.dart';
import 'package:donor_darah/utility/commons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class UddPage extends StatefulWidget {
  final bool stockDarah;
  const UddPage({
    Key? key,
    required this.stockDarah,
  }) : super(key: key);

  @override
  State<UddPage> createState() => _UddPageState();
}

class _UddPageState extends State<UddPage> {
  final DonorController _donorController = Get.put(DonorController());

  @override
  void initState() {
    super.initState();
    BlocProvider.of<UnitUddCubit>(context).fetchUnitUdd();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const BackButton(
            color: Colors.black,
          ),
          title: const Text(
            'Pilih UDD',
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          backgroundColor: Colors.white,
          systemOverlayStyle: SystemUiOverlayStyle.light,
        ),
        body: BlocConsumer<UnitUddCubit, UnitUddState>(
          listener: (context, state) {
            if (state is UnitUddIsError) {
              Commons().showSnackBarErrorr(context, state.message!);
            }
          },
          builder: (context, state) {
            if (state is UnitUddIsLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  color: BaseColor.red,
                ),
              );
            } else if (state is UnitUddIsSuccess) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(
                      left: 24,
                      right: 24,
                      bottom: 8,
                      top: 16,
                    ),
                    child: Text(
                      'Pilih Unit Donor Darah',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        var data = state.data[index];
                        return Padding(
                          padding: const EdgeInsets.only(
                              top: 16, right: 24, left: 24),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 56,
                            child: ListTile(
                              leading:
                                  Image.asset('assets/images/udd_icon.png'),
                              trailing: const Icon(
                                Icons.arrow_forward_ios,
                                size: 15,
                              ),
                              title: Text(data.name),
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                  color: Color(0xffCCCCCC),
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              onTap: widget.stockDarah
                                  ? () {
                                      context.goNamed(
                                        Routes.screenstokdarah,
                                        extra: data.id,
                                      );
                                    }
                                  : () {
                                      int newUnitId = data.id;
                                      _donorController.setunitId(newUnitId);
                                      context.goNamed('jadwal-donor');
                                    },
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            }
            return const Center(child: Text("Kosong"));
          },
        ));
  }
}
