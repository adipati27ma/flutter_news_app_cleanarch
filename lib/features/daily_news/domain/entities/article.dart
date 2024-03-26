import 'package:equatable/equatable.dart';

// docs: ArticleEntity is a class that extends Equatable.
// It is used to define the properties of the news article.
// Equatable is used to compare objects for equality.
// Equatable is a package that provides a simple way to compare objects in Dart.
// It is used to compare the properties of the ArticleEntity class with each other. (using "==" operator if without Equatable)
class ArticleEntity extends Equatable {
  final int? id;
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final String? publishedAt;
  final String? content;

  const ArticleEntity({
    required this.id,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  @override
  List<Object?> get props => [
        id,
        author,
        title,
        description,
        url,
        urlToImage,
        publishedAt,
        content,
      ];
}
