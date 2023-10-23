// ignore_for_file: avoid_print

import 'package:donor_darah/data/repository/info_berita/info_berita_repository_impl.dart';
import 'package:donor_darah/presentation/pages/BLOC/info_berita/info_berita_cubit.dart';
import 'package:donor_darah/presentation/pages/BLOC/info_berita/info_berita_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ArticleScreen extends StatefulWidget {
  const ArticleScreen({super.key});

  @override
  State<StatefulWidget> createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {
  late InfoBeritaCubit infoBeritaCubit;

  @override
  void initState() {
    super.initState();
    infoBeritaCubit = InfoBeritaCubit(InfoBeritaRepositoryImpl());
  }

  @override
  void dispose() {
    infoBeritaCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    infoBeritaCubit.fetchArticle("categoryId", "page", "limit");
    return BlocProvider.value(
      value: infoBeritaCubit,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Article"),
        ),
        body: BlocBuilder<InfoBeritaCubit, InfoBeritaState>(
            builder: (context, state) {
          if (state is InfoBeritaIsEmpty) {
            print("ARTICLE : EMPTY");
            return Container(
              margin: const EdgeInsets.fromLTRB(10, 50, 10, 50),
              child: const Text(
                "Tidak ada artikel saat ini",
                style: TextStyle(fontSize: 24),
              ),
            );
          } else if (state is InfoBeritaLoaded) {
            print("ARTICLE : LOADED");
            return ListView.builder(
              itemCount: state.data.length,
              itemBuilder: (context, index) {
                final item = state.data[index];

                return Card(
                  child: Column(
                    children: [
                      Image.network(
                        item.image,
                        fit: BoxFit.cover,
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 5),
                        child: Text(
                          item.title,
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: Text(
                          item.createdAt,
                          style: const TextStyle(fontSize: 16),
                        ),
                      )
                    ],
                  ),
                );
              },
            );
          } else if (state is InfoBeritaLoading) {
            print("ARTICLE : LOADING");
            return Container(
              margin: const EdgeInsets.fromLTRB(10, 50, 10, 50),
              child: const Text(
                "Loading data",
                style: TextStyle(fontSize: 24),
              ),
            );
          } else {
            print("ARTICLE : ELSE");
            return Container(
              margin: const EdgeInsets.fromLTRB(10, 50, 10, 50),
              child: const Text(
                "Gagal menerima data artikel",
                style: TextStyle(fontSize: 24),
              ),
            );
          }
        }),
      ),
    );
  }
}
