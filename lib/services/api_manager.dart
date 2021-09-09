import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rest_test/Constants/Strings.dart';
import 'package:rest_test/Models/newsInfo.dart';

class ApiManager {
  Future<Welcome> getNews() async {
    var client = http.Client();
    var newsModel;
    try {
      var response = await client.get(Uri.parse(Strings.newsurl));
      //200 sucess status reads the response body get's the jsonstring
      if (response.statusCode == 200) {
        var jsonString = response.body;
        //Mapping a JsonString to a JsonMap
        var jsonMap = json.decode(jsonString);
        //fetching the model class
        newsModel = Welcome.fromJson(jsonMap);
      }
    } catch (Exception) {
      return newsModel;
    }
    return newsModel;
  }
}
