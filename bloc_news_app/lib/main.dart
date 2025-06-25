import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/articles/data/article_data_provider.dart';
import 'package:news_app/features/articles/screens/articles_screen.dart';
import 'package:news_app/helpers/network_helper.dart';

import 'features/articles/domain/articles_repository.dart';

void main() {
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => ArticlesRepository(
        ArticleDataProvider(NetworkHelper()),
      ),
      child: MaterialApp(
        title: 'News App',
        theme: ThemeData(useMaterial3: true),
        home: const ArticlesScreen(),
      ),
    );
  }
}
