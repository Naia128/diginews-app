// data/repositories/news_repository_impl.dart
@override
Future<List<NewsEntity>> getNews() async {
  try {
    final response = await dio.get('/v2/top-headlines?country=id');
    final List rawData = response.data['articles'];
    
    // Mapping ke Model
    List<NewsModel> newsList = rawData.map((e) => NewsModel.fromJson(e)).toList();

    // TANTANGAN ANTI-AI: NIM Ganjil -> Urutkan Z ke A berdasarkan judul
    newsList.sort((a, b) => b.title.compareTo(a.title)); 

    // Simpan ke Isar Cache untuk Offline mode
    await isarLocalStorage.saveNews(newsList);

    return newsList;
  } catch (e) {
    // Jika offline/error, ambil dari Isar
    return await isarLocalStorage.getCachedNews();
  }
}