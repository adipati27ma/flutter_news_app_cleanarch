import 'package:flutter_news_app_cleanarch/features/daily_news/data/models/article.dart';
import 'package:retrofit/retrofit.dart';
// import 'package:flutter_news_app_cleanarch/core/constants/constants.dart';
import '../../../../../core/constants/constants.dart';
import 'package:dio/dio.dart';
part 'news_api_service.g.dart';

// docs: NewsApiService is an abstract class that defines the methods that must be implemented by the _NewsApiService class.
// It has only one method getNewsArticles that returns a HttpResponse of List<ArticleModel>.
// It is used in the ArticleRepositoryImpl class to get the news articles.
@RestApi(baseUrl: newsAPIBaseURL)
abstract class NewsApiService {
  factory NewsApiService(Dio dio) = _NewsApiService;

  @GET('/top-headlines')
  Future<HttpResponse<List<ArticleModel>>> getNewsArticles({
    @Query("apiKey") String? apiKey,
    @Query("country") String? country,
    @Query("category") String? category,
  });
}
