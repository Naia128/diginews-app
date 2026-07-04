import '../../domain/entities/article.dart';

class ArticleModel extends Article{

ArticleModel({

required super.title,
required super.imageUrl,
required super.summary

});

factory ArticleModel.fromJson(

Map<String,dynamic> json

){

return ArticleModel(

title: json['title'],

imageUrl:
json['image_url'] ?? '',

summary:
json['summary'] ?? ''

);

}

}