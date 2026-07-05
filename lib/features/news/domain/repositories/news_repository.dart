class NewsRepository {

  final NewsRemoteDatasource datasource;

  NewsRepository(
    this.datasource,
  );

  Future<List<Article>> getNews() async {

    final articles =
        await datasource.getNews();

    articles.sort(

      (a, b) =>

          b.title.compareTo(

            a.title,

          ),

    );

    return articles;

  }

}