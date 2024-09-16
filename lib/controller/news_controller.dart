import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/all_news_model.dart';




class NewsController{

  static Future<AllNewsModel?> allNewsController()async{
    try{
      const allNews= "https://newsapi.org/v2/everything?q=bitcoin&apiKey=f96278aa72ba4ec8b7c431d52fedd06a";


      final response = await http.get(Uri.parse(allNews));

      if(response.statusCode == 200){
        print("Success all news get");
        final jsonData = jsonDecode(response.body);
        return AllNewsModel.fromJson(jsonData);

      }else{
        print("response failed");
      }

    }catch(e){
      print(e);
    }
    return null;
  }


  // top head line news controller
  static Future<AllNewsModel?> headLineController()async{
    try{
      const headLine = "https://newsapi.org/v2/top-headlines?country=us&apiKey=f96278aa72ba4ec8b7c431d52fedd06a";


      final response = await http.get(Uri.parse(headLine));

      if(response.statusCode == 200){
        print("Success all news get");
        final jsonData = jsonDecode(response.body);
        return AllNewsModel.fromJson(jsonData);

      }else{
        print("response failed");
      }

    }catch(e){print(e);}
    return null;
  }
}