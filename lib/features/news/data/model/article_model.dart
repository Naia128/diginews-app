import 'package:isar/isar.dart';

part 'article_model.g.dart';

@collection
class ArticleModel {

Id id = Isar.autoIncrement;

String title;

String summary;

ArticleModel({

required this.title,
required this.summary

});

}