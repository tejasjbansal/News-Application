import 'dart:convert';

import 'package:newsapp/models/artical_model.dart';
import 'package:http/http.dart' as http;
class News{

  List<ArticleModel> news = [];
  Future<void> getNews() async{
    final url = "http://newsapi.org/v2/top-headlines?country=in&excludeDomains=stackoverflow.com&sortBy=publishedAt&language=en&apiKey=7201723c0eed485799d973e04848d4a4";
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body); 
    if(jsonData["status"]=="ok"){
      jsonData["articles"].forEach((element){
        if(element["urlToImage"] !=null && element['description']!=null){
          ArticleModel articleModel = new ArticleModel(
            author: element["author"],
            title: element["title"],
            description: element["description"],
            url: element["url"],
            urlToImage: element["urlToImage"],
            content: element["content"],
            publishedAt: DateTime.parse(element['publishedAt'])
          );
          news.add(articleModel);
        }
      });
    }
  }
  
}

class CategoryNewsClass{
  List<ArticleModel> news = [];

  Future<void> getNews(String category) async{
    final url = "http://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=7201723c0eed485799d973e04848d4a4";
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body); 
    if(jsonData["status"]=="ok"){
      jsonData["articles"].forEach((element){
        if(element["urlToImage"] !=null && element['description']!=null){
          ArticleModel articleModel = new ArticleModel(
            author: element["author"],
            title: element["title"],
            description: element["description"],
            url: element["url"],
            urlToImage: element["urlToImage"],
            content: element["content"],
            publishedAt: DateTime.parse(element['publishedAt'])
          );
          news.add(articleModel);
        }
      });
    }
  }
  
}