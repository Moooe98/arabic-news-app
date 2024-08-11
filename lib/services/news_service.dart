import 'package:dio/dio.dart';
import 'package:news_app_ui_setup/models/article_model.dart';

class NewsService{
final Dio dio;
NewsService(this.dio);


    Future<List<ArticleModel>> getTopHeadlines({required String category }) async {
    try {

      Response response = await dio.get(
          'https://gnews.io/api/v4/top-headlines?country=eg&category=$category&apikey=e48c1583cd138e9a6dbbc0c4f5db424c');

      Map<String, dynamic> JsonData = response.data;
      List<dynamic> articles = JsonData['articles'];
      List<ArticleModel> articlesList = [];
      
      for (var article in articles){
        ArticleModel articleModel = ArticleModel.fromJson(article);
        articlesList.add(articleModel);
      }
      
      
      return articlesList;
    } catch (e) {
     return [];
    }
  }



}