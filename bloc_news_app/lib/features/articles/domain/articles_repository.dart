import 'dart:convert';

import 'package:news_app/features/articles/data/article_data_provider.dart';
import 'package:news_app/features/articles/models/article.dart';

class ArticlesRepository {
  const ArticlesRepository(this._articleDataProvider);

  final ArticleDataProvider _articleDataProvider;

  Future<List<Article>?> getArticles() async {
    try {
      final response = await _articleDataProvider.getArticles();
      if (response != null && response.statusCode == 200) {
        final jsonMap = json.decode(response.body);
        final articlesJson = jsonMap['articles'] as List<dynamic>;
        return articlesJson.map((json) => Article.fromJson(json)).toList();
      } else {
        return null;
      }
    } on Exception catch (e) {
      throw Exception("Exception has occurred: $e");
    }
  }
}
