import 'dart:async';

import 'package:floor/floor.dart';
import 'package:flutter_news_app_cleanarch/features/daily_news/data/data_sources/local/DAO/article.dao.dart';
import 'package:flutter_news_app_cleanarch/features/daily_news/data/models/article.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
part 'app_database.g.dart';

@Database(version: 1, entities: [ArticleModel])
abstract class AppDatabase extends FloorDatabase {
  ArticleDao get articleDao;
}
