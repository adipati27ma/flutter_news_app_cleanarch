import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_news_app_cleanarch/core/constants/constants.dart';
import 'package:flutter_news_app_cleanarch/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:flutter_news_app_cleanarch/features/daily_news/data/models/article.dart';
import 'package:flutter_news_app_cleanarch/core/resources/data_state.dart';
import 'package:flutter_news_app_cleanarch/features/daily_news/domain/entities/article.dart';
import 'package:flutter_news_app_cleanarch/features/daily_news/domain/repository/article_repository.dart';

// docs: ArticleRepositoryImpl is a class that implements the ArticleRepository abstract class.
// It has a constructor that takes the NewsApiService as a parameter.
// It has only one method getNewsArticles that returns a DataState of List<ArticleModel>.
class ArticleRepositoryImpl implements ArticleRepository {
  final NewsApiService _newsApiService;
  ArticleRepositoryImpl(this._newsApiService);

  @override
  Future<DataState<List<ArticleModel>>> getNewsArticles() async {
    try {
      final httpResponse = await _newsApiService.getNewsArticles(
        apiKey: newsAPIKey,
        country: countryQuery,
        category: categoryQuery,
      );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        final articles = httpResponse.data;
        return DataSuccess(articles);
      } else {
        return DataFailed(
          DioError(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioErrorType.response,
            requestOptions: httpResponse.response.requestOptions,
          ),
        );
      }
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }
}
