import 'dart:convert';

import 'package:DailyNews/model/articleModel.dart';
import 'package:http/http.dart' as http;

class News {
  Future<void> getNews() async {
    List<ArticleModel> news = [];
    String url =
        "http://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=7c2b4f8adef045f29e981f0d8fd1108d";

    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach(
        (element) {
          if (element['urlToImage'] != null && element['description'] != null) {
            ArticleModel articleModel = ArticleModel(
              title: element['title'],
              author: element['author'],
              content: element['content'],
              //content: element['context'],
              description: element['description'],
              url: element['url'],
              urlToImage: element['urlToImage'],
              publishedAt: element['publishedAt'],
            );
            news.add(articleModel);
          }
        },
      );
    }
  }
}
