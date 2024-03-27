import 'package:floor/floor.dart';
import 'package:flutter_news_app_cleanarch/features/daily_news/data/models/article.dart';

// docs: @dao annotation is used to mark this as Data Access Object (DAO) abstract class.
@dao
abstract class ArticleDao {
  @Insert()
  Future<void> insertArticle(ArticleModel article);

  @Query('SELECT * FROM article')
  Future<List<ArticleModel>> getArticles();

  @delete
  Future<void> deleteArticle(ArticleModel articleModel);
}
