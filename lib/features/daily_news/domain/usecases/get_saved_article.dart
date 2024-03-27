import 'package:flutter_news_app_cleanarch/core/constants/usecase/usecases.dart';
import 'package:flutter_news_app_cleanarch/features/daily_news/domain/entities/article.dart';
import 'package:flutter_news_app_cleanarch/features/daily_news/domain/repository/article_repository.dart';

// docs: GetSavedArticleUseCase is a class that implements the UseCase base class.
// It takes the ArticleRepository as a parameter and returns a List<ArticleEntity>.
class GetSavedArticleUseCase implements UseCase<List<ArticleEntity>, void> {
  final ArticleRepository _articleRepository;

  GetSavedArticleUseCase(this._articleRepository);

  @override
  Future<List<ArticleEntity>> call({void params}) {
    return _articleRepository.getSavedArticles();
  }
}
