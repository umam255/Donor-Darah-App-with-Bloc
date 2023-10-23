import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingShimmer extends StatefulWidget {
  const LoadingShimmer({super.key});

  @override
  State<LoadingShimmer> createState() => _LoadingShimmerState();
}

class _LoadingShimmerState extends State<LoadingShimmer> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(left: 24, top: 50, right: 24),
          child: Shimmer(
            gradient: const LinearGradient(
              begin: Alignment(-1.00, -0.00),
              end: Alignment(1, 0),
              colors: [
                Color(0x0CDBDBDB),
                Color(0xFFDBDBDB),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShimmerLoading(
                    height: height * 0.02, width: width * 0.3, circular: 50),
                const SizedBox(height: 10),
                ShimmerLoading(
                  height: height * 0.02,
                  width: width * 0.4,
                  circular: 50,
                ),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        ShimmerLoading(
                          height: height * 0.12,
                          width: 100,
                          circular: 6,
                        ),
                        const SizedBox(height: 10),
                        ShimmerLoading(
                          height: height * 0.02,
                          width: 100,
                          circular: 50,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        ShimmerLoading(
                          height: height * 0.12,
                          width: 100,
                          circular: 6,
                        ),
                        const SizedBox(height: 10),
                        ShimmerLoading(
                          height: height * 0.02,
                          width: 100,
                          circular: 50,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        ShimmerLoading(
                          height: height * 0.12,
                          width: 100,
                          circular: 6,
                        ),
                        const SizedBox(height: 10),
                        ShimmerLoading(
                          height: height * 0.02,
                          width: 100,
                          circular: 50,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        ShimmerLoading(
                          height: height * 0.02,
                          width: width * 0.35,
                          circular: 50,
                        ),
                        const SizedBox(height: 10),
                        ShimmerLoading(
                          height: height * 0.02,
                          width: width * 0.35,
                          circular: 50,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        ShimmerLoading(
                          height: height * 0.02,
                          width: width * 0.35,
                          circular: 50,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                SingleChildScrollView(
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ShimmerLoading(
                            height: height * 0.18,
                            width: width * 0.35,
                            circular: 6,
                          ),
                          const SizedBox(height: 10),
                          ShimmerLoading(
                            height: height * 0.01,
                            width: width * 0.35,
                            circular: 50,
                          ),
                          const SizedBox(height: 10),
                          ShimmerLoading(
                            height: height * 0.01,
                            width: width * 0.25,
                            circular: 50,
                          ),
                        ],
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ShimmerLoading(
                            height: height * 0.18,
                            width: width * 0.35,
                            circular: 6,
                          ),
                          const SizedBox(height: 10),
                          ShimmerLoading(
                            height: height * 0.01,
                            width: width * 0.35,
                            circular: 50,
                          ),
                          const SizedBox(height: 10),
                          ShimmerLoading(
                            height: height * 0.01,
                            width: width * 0.25,
                            circular: 50,
                          ),
                        ],
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ShimmerLoading(
                            height: height * 0.18,
                            width: width * 0.35,
                            circular: 6,
                          ),
                          const SizedBox(height: 10),
                          ShimmerLoading(
                            height: height * 0.01,
                            width: width * 0.35,
                            circular: 50,
                          ),
                          const SizedBox(height: 10),
                          ShimmerLoading(
                            height: height * 0.01,
                            width: width * 0.25,
                            circular: 50,
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      // bottomNavigationBar: Shimmer(
      //   gradient: const LinearGradient(
      //     begin: Alignment(-1.00, -0.00),
      //     end: Alignment(1, 0),
      //     colors: [
      //       Color(0x0CDBDBDB),
      //       Color(0xFFDBDBDB),
      //     ],
      //   ),
      //   child: Container(
      //     height: 50,
      //     padding: const EdgeInsets.symmetric(horizontal: 41),
      //     child: Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //       children: [
      //         Column(
      //           children: [
      //             ShimmerLoading(
      //                 width: width * 0.07, height: height * 0.035, circular: 0),
      //             const SizedBox(height: 5),
      //             ShimmerLoading(
      //               width: width * 0.09,
      //               height: height * 0.01,
      //               circular: 0,
      //             ),
      //           ],
      //         ),
      //         Column(
      //           children: [
      //             ShimmerLoading(
      //                 width: width * 0.07, height: height * 0.035, circular: 0),
      //             const SizedBox(height: 5),
      //             ShimmerLoading(
      //               width: width * 0.09,
      //               height: height * 0.01,
      //               circular: 0,
      //             ),
      //           ],
      //         ),
      //         Column(
      //           children: [
      //             ShimmerLoading(
      //                 width: width * 0.07, height: height * 0.035, circular: 0),
      //             const SizedBox(height: 5),
      //             ShimmerLoading(
      //               width: width * 0.09,
      //               height: height * 0.01,
      //               circular: 0,
      //             ),
      //           ],
      //         ),
      //         Column(
      //           children: [
      //             ShimmerLoading(
      //                 width: width * 0.07, height: height * 0.035, circular: 0),
      //             const SizedBox(height: 5),
      //             ShimmerLoading(
      //               width: width * 0.09,
      //               height: height * 0.01,
      //               circular: 0,
      //             ),
      //           ],
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}

class ShimmerLoading extends StatelessWidget {
  final double width;
  final double height;
  final double circular;
  const ShimmerLoading({
    Key? key,
    required this.width,
    required this.height,
    required this.circular,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: const Color(0xffDBDBDB),
        borderRadius: BorderRadius.circular(circular),
      ),
    );
  }
}
