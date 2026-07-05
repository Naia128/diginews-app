class NewsRepositoryImpl
implements NewsRepository{

final NewsRemoteDatasource remote;
final Isar isar;

NewsRepositoryImpl(

this.remote,
this.isar

);

@override
Future<List<Article>> getNews()
async{

try{

final articles =
await remote.getArticles();

articles.sort(

(a,b)=>

b.title.compareTo(

a.title

)

);

await isar.writeTxn(() async{

await isar.articleModels.clear();

await isar.articleModels.putAll(

articles

);

});

return articles;

}

catch(_){

final cached=

await isar.articleModels.where()

.findAll();

return cached;

}

}

}