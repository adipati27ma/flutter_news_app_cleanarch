abstract class RemoteArticlesEvent {
  const RemoteArticlesEvent();
}

class GetArticles extends RemoteArticlesEvent {
  // final String? country;
  // final String? category;

  // const GetArticles({this.country, this.category});
  const GetArticles();
}
