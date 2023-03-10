import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/helper/api.dart';
import 'package:news_app/model/article_model.dart';

class GetNewsService {
  String URL =
      "https://newsapi.org/v2/top-headlines?country=us&apiKey=AddYourAPIKey";
  Future<List<ArticleModel>> getAllNews() async {
    List<ArticleModel> articles = [];
    http.Response response = await API().getMethod(url: URL);
    dynamic data = jsonDecode(response.body);
    dynamic items = data['articles'];
    for (var item in items) {
      if (API().checkData(item)) {
        articles.add(ArticleModel.formJson(item));
      }
    }
    return articles;
  }
}
