import 'package:dio/dio.dart';

import '../model/article_model.dart';

class NewsRemoteDatasource {

  final Dio dio;

  NewsRemoteDatasource(

    this.dio,

  ){

    dio.interceptors.add(

      LogInterceptor(

        requestBody: true,

        responseBody: true,

      ),

    );

  }

  Future<List<ArticleModel>>

  getArticles()

  async{

    final response = await dio.get(

      'https://api.spaceflightnewsapi.net/v4/articles',

    );

    return

    (response.data['results']

    as List)

    .map(

      (e)=>

      ArticleModel.fromJson(e),

    )

    .toList();

  }

}