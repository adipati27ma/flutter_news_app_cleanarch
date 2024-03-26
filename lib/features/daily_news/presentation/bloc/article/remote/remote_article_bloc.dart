import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news_app_cleanarch/core/resources/data_state.dart';
import 'package:flutter_news_app_cleanarch/features/daily_news/domain/usecases/get_article.dart';
import 'package:flutter_news_app_cleanarch/features/daily_news/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:flutter_news_app_cleanarch/features/daily_news/presentation/bloc/article/remote/remote_article_state.dart';

// docs: implementing the BLoC (Business Logic Component) pattern
// RemoteArticlesBloc is a BLoC that manages the state of the remote articles
// BLoC needs 2 types of classes: Event and State => RemoteArticlesEvent and RemoteArticleState
// it listens to GetArticles event and fetches the articles from the remote data source
// it emits RemoteArticlesLoading state when the articles are being fetched (initial state)
class RemoteArticlesBloc extends Bloc<RemoteArticlesEvent, RemoteArticleState> {
  final GetArticleUseCase _getArticleUseCase;

  RemoteArticlesBloc(this._getArticleUseCase) : super(RemoteArticlesLoading()) {
    on<GetArticles>(onGetArticles);
  }

// docs: Emitter is a class which is capable of emitting new states.
  void onGetArticles(
      GetArticles event, Emitter<RemoteArticleState> emit) async {
    final dataState = await _getArticleUseCase();

    // docs: it emits RemoteArticlesDone state when the articles are fetched successfully
    // docs: it emits RemoteArticlesError state when there is an error fetching the articles
    // "!" is used to remove the null safety warning (indicate non-nullable variable)
    if (dataState is DataSuccess) {
      emit(RemoteArticlesDone(articles: dataState.data!));
    } else if (dataState is DataFailed) {
      emit(RemoteArticlesError(error: dataState.error!));
    }
  }
}
