import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/articles/domain/articles_bloc.dart';
import 'package:news_app/features/articles/domain/articles_repository.dart';

import '../domain/articles_contract.dart';

class ArticlesScreen extends StatefulWidget {
  const ArticlesScreen({super.key});

  @override
  State<ArticlesScreen> createState() => _ArticlesScreenState();
}

class _ArticlesScreenState extends State<ArticlesScreen> {
  late final ArticlesBloc _articlesBloc;

  @override
  void initState() {
    super.initState();
    _articlesBloc = ArticlesBloc(context.read<ArticlesRepository>());
    _articlesBloc.add(const FetchArticles());
  }

  @override
  void dispose() {
    _articlesBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _articlesBloc,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Articles"),
        ),
        body: BlocBuilder<ArticlesBloc, ArticlesData>(
          builder: (_, data) {
            if (data.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (data.articles.isEmpty) {
              return const Center(
                child: Text("ops, something wrong happend"),
              );
            }
            return ListView.builder(
              itemCount: 10,
              itemBuilder: (_, index) {
                return Card(
                  child: Text(data.articles[index].title ?? ""),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
