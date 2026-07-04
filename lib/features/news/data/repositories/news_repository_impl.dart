import '../../domain/entities/article.dart';
import '../../domain/repositories/news_repository.dart';
import '../datasource/news_remote_datasource.dart';

class NewsRepositoryImpl implements NewsRepository {

  final NewsRemoteDatasource datasource;

  NewsRepositoryImpl(this.datasource);

  @override
  Future<List<Article>> getNews() async {

    final articles = await datasource.getArticles();

    // NIM akhir 1 → descending
    articles.sort(
      (a, b) => b.title.compareTo(a.title),
    );

    return articles;
  }
}