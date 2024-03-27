import 'package:flutter_news_app_cleanarch/core/resources/data_state.dart';
import 'package:flutter_news_app_cleanarch/features/daily_news/domain/entities/article.dart';

// docs: Article Repository is an abstract class
// that defines the methods that must be implemented by the ArticleRepositoryImpl class.
// It has only one method getNewsArticles that returns a DataState of List<ArticleEntity>.
//*It is used in the GetArticleUseCase class to get the news articles.
abstract class ArticleRepository {
  // API methods
  Future<DataState<List<ArticleEntity>>> getNewsArticles();

  // Database methods
  Future<List<ArticleEntity>> getSavedArticles();

  Future<void> saveArticle(ArticleEntity article);

  Future<void> removeArticle(ArticleEntity article);
}
