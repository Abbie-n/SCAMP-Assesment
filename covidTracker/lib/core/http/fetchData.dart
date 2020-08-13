import 'dart:convert';

import 'package:covidTracker/core/http/apiRoutes.dart';
import 'package:covidTracker/core/models/models.dart';
import 'package:http/http.dart' as http;

class DataService {
  String url = ApiRoutes.baseUrl;
  String newsUrl = ApiRoutes.newsUrl;
  Future<GlobalStatsModel> fetchGlobalStats() async {
    String url = ApiRoutes.baseUrl;
    var result = await http.get(url);
    var data;
    if (result.statusCode == 200) {
      var stats = json.decode(result.body);
      data = stats['Global'] as Map;
    } else {
      throw Exception('Ooops! No Info found!');
    }

    return GlobalStatsModel.fromJson(data);
  }

  Future<List<CountryStatsModel>> fetchStatsPerCountry() async {
    var result = await http.get(url);

    List<CountryStatsModel> countryStats;

    if (result.statusCode == 200) {
      var stats = json.decode(result.body);
      var data = stats['Countries'] as List;
      //print(data);
      countryStats = data
          .map<CountryStatsModel>((json) => CountryStatsModel.json(json))
          .toList();
      print('Stats is: ${countryStats[0]}');
    } else {
      throw Exception('Ooops! No Info found!');
    }

    return countryStats;
  }

  Future<List<NewsModel>> fetchNews() async {
    String url = newsUrl;
    var result = await http.get(url);

    List<NewsModel> articles;

    if (result.statusCode == 200) {
      var news = json.decode(result.body);
      var data = news["articles"] as List;
      //print(data);
      articles = data.map<NewsModel>((json) => NewsModel.json(json)).toList();
      print('article is: ${articles[0]}');
    } else {
      throw Exception('Ooops! No News found!');
    }

    return articles;
  }
}
