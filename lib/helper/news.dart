import 'dart:convert';

import 'package:DailyNews/model/articleModel.dart';
import 'package:http/http.dart' as http;

class News {
  List<ArticleModel> news = [];
  Future<void> getNews() async {
    
    String url =
        "http://newsapi.org/v2/top-headlines?country=ng&apiKey=7c2b4f8adef045f29e981f0d8fd1108d";

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
              // publishedAt: element['publishedAt'],
            );
            news.add(articleModel);
          }
        },
      );
    }
  }
}

class CategoryNewsSelect {
  List<ArticleModel> news = [];
  Future<void> getNews(String category) async {
    
    String url =
        "http://newsapi.org/v2/top-headlines?country=ng&category=$category&apiKey=7c2b4f8adef045f29e981f0d8fd1108d";

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
              // publishedAt: element['publishedAt'],
            );
            news.add(articleModel);
          }
        },
      );
    }
  }
}
