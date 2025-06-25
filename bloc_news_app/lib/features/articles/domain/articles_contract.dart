import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:news_app/features/articles/data/models/article.dart';

part 'articles_contract.freezed.dart';

@freezed
class ArticlesEvent with _$ArticlesEvent {
  const factory ArticlesEvent.fetchArticles() = FetchArticles;
}

@freezed
class ArticlesData with _$ArticlesData {
  factory ArticlesData({
    @Default(true) bool isLoading,
    @Default([]) List<Article> articles,
  }) = _ArticlesData;
}
