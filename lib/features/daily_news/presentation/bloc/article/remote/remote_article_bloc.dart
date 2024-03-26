import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news_app_cleanarch/core/resources/data_state.dart';
import 'package:flutter_news_app_cleanarch/features/daily_news/domain/usecases/get_article.dart';
import 'package:flutter_news_app_cleanarch/features/daily_news/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:flutter_news_app_cleanarch/features/daily_news/presentation/bloc/article/remote/remote_article_state.dart';

class RemoteArticlesBloc extends Bloc<RemoteArticlesEvent, RemoteArticleState> {
  final GetArticleUseCase _getArticleUseCase;

  RemoteArticlesBloc(this._getArticleUseCase) : super(RemoteArticlesLoading()) {
    on<GetArticles>(onGetArticles);
  }

  void onGetArticles(
      GetArticles event, Emitter<RemoteArticleState> emit) async {
    final dataState = await _getArticleUseCase();

    if (dataState is DataSuccess) {
      emit(RemoteArticlesDone(articles: dataState.data!));
    } else if (dataState is DataFailed) {
      emit(RemoteArticlesError(error: dataState.error!));
    }
  }
}
