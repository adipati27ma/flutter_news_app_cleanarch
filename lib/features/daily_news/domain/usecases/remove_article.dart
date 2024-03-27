import 'package:flutter_news_app_cleanarch/core/constants/usecase/usecases.dart';
import 'package:flutter_news_app_cleanarch/features/daily_news/domain/entities/article.dart';
import 'package:flutter_news_app_cleanarch/features/daily_news/domain/repository/article_repository.dart';

class RemoveArticleUseCase implements UseCase<void, ArticleEntity> {
  final ArticleRepository _articleRepository;

  RemoveArticleUseCase(this._articleRepository);

  @override
  Future<void> call({ArticleEntity? params}) {
    return _articleRepository.removeArticle(params!);
  }
}
