import 'package:flutter_news_app_cleanarch/core/constants/usecase/usecases.dart';
import 'package:flutter_news_app_cleanarch/core/resources/data_state.dart';
import 'package:flutter_news_app_cleanarch/features/daily_news/domain/entities/article.dart';
import 'package:flutter_news_app_cleanarch/features/daily_news/domain/repository/article_repository.dart';

// docs: GetArticleUseCase is a class that implements the UseCase base class.
// It is used to get the news articles from the repository.
// It takes the ArticleRepository as a parameter and returns a DataState of List<ArticleEntity>.
//*It is used in the RemoteArticlesBloc to get the news articles.
class GetArticleUseCase
    implements UseCase<DataState<List<ArticleEntity>>, void> {
  final ArticleRepository _articleRepository;

  GetArticleUseCase(this._articleRepository);

  @override
  Future<DataState<List<ArticleEntity>>> call({void params}) {
    return _articleRepository.getNewsArticles();
  }
}
