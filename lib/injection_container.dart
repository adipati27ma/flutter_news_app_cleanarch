import 'package:flutter_news_app_cleanarch/features/daily_news/data/repository/article_repository_impl.dart';
import 'package:flutter_news_app_cleanarch/features/daily_news/domain/repository/article_repository.dart';
import 'package:flutter_news_app_cleanarch/features/daily_news/domain/usecases/get_article.dart';
import 'package:flutter_news_app_cleanarch/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:flutter_news_app_cleanarch/features/daily_news/data/data_sources/remote/news_api_service.dart';

/*
  docs: GetIt is a simple Service Locator for Dart and Flutter projects with some additional goodies highly inspired by Splat.
  It can be used for both DI (dependency injection) and to obtain services using a Service Locator pattern.
*/
final sl = GetIt.instance;

// docs: Service Locator Pattern is a design pattern that allows you to decouple the interface from a concrete implementation
// this is useful for testing, as you can swap out the implementation of a class with a mock
/*
* initializeDependencies() will be called before runApp() in main.dart

  Classes/dependencies can be registered as a:
✔️1. Singleton: when request an instance of the class from the Service Locator, the same instance will be returned (Lifetime)
  2. Factory: when request an instance of the class, a new instance will be created (good for view models)
  3. Lazy singleton: when request an instance of the class, the instance will be created only when it is first requested
*/
Future<void> initializeDependencies() async {
  // Dio
  sl.registerSingleton<Dio>(Dio());

  // Dependencies
  sl.registerSingleton<NewsApiService>(NewsApiService(sl<Dio>()));
  sl.registerSingleton<ArticleRepository>(
      ArticleRepositoryImpl(sl<NewsApiService>()));

  // Use Cases
  sl.registerSingleton<GetArticleUseCase>(
      GetArticleUseCase(sl<ArticleRepository>()));

  // BLoC (Presentation Layer, Factory)
  sl.registerFactory<RemoteArticlesBloc>(
      () => RemoteArticlesBloc(sl<GetArticleUseCase>()));
}
