import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/articles/domain/articles_contract.dart';
import 'package:news_app/features/articles/domain/articles_repository.dart';
import 'package:news_app/features/articles/models/article.dart';

class ArticlesBloc extends Bloc<ArticlesEvent, ArticlesData> {
  final ArticlesRepository articlesRepository;

  ArticlesBloc(this.articlesRepository) : super(ArticlesData()) {
    on<ArticlesEvent>(_fetchArticles);
  }

  Future<void> _fetchArticles(
      ArticlesEvent event, Emitter<ArticlesData> emit) async {
    try {
      List<Article> articles = [];
      final articlesResponse = await articlesRepository.getArticles();
      if (articlesResponse != null) {
        debugPrint("$articlesResponse!");
        articles = articlesResponse;
      }
      emit(state.copyWith(articles: articles));
    } catch (e) {
      debugPrint("Error occured $e");
    } finally {
      emit(
        state.copyWith(isLoading: false),
      );
    }
  }
}
