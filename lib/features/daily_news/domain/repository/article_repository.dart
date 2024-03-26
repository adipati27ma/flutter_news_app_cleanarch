import 'package:flutter_news_app_cleanarch/core/resources/data_state.dart';
import 'package:flutter_news_app_cleanarch/features/daily_news/domain/entities/article.dart';

abstract class ArticleRepository {
  Future<DataState<List<ArticleEntity>>> getNewsArticles();
}
