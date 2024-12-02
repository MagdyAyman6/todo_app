import 'package:dio/dio.dart';
import 'package:news_app/models/article_model.dart';


class ApiService {
  final _baseUrl = "https://newsapi.org";
  Dio dio = Dio();

  Future <List<ArticleModel>> getNews({required String category}) async {
    var response = await dio.get(
        "$_baseUrl/v2/top-headlines?country=us&category=$category&apiKey=e72d1912af1c41ea92fba59cd7b808ce");
    Map<String, dynamic> json = response.data;
    List articles = json["articles"];
    List <ArticleModel> articleList = [];
    for (var i in articles) {
      ArticleModel articleModel=ArticleModel.fromJson(i);
      articleList.add(articleModel);
    }
    return articleList;
  }
}
