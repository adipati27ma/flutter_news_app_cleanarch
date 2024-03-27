import 'package:equatable/equatable.dart';
import 'package:flutter_news_app_cleanarch/features/daily_news/domain/entities/article.dart';

abstract class LocalArticlesState extends Equatable {
  final List<ArticleEntity>? articles;

  const LocalArticlesState({this.articles});

  @override
  List<Object> get props => [];
}

class LocalArticlesLoading extends LocalArticlesState {
  const LocalArticlesLoading();
}

class LocalArticlesDone extends LocalArticlesState {
  const LocalArticlesDone({required List<ArticleEntity> articles})
      : super(articles: articles);
}
