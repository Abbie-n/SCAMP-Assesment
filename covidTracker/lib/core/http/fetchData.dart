import 'dart:convert';

import 'package:covidTracker/core/http/apiResponse.dart';
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

  Future<APIResponse<List<CountriesModel>>> fetchStatsPerCountry() async {
    return http.get(url).then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        var countries = jsonData['Countries'] as List;
        final countriesStats = <CountriesModel>[];
        for (var item in countries) {
          final country = CountriesModel(
              country: item['Country'],
              newConfirmed: item['NewConfirmed'],
              totalConfirmed: item['TotalConfirmed'],
              newDeaths: item['NewDeaths'],
              totalDeaths: item['TotalDeaths'],
              newRecovered: item['NewRecovered'],
              totalRecovered: item['TotalRecovered']);
          countriesStats.add(country);
        }
        // print(countriesStats);
        return APIResponse<List<CountriesModel>>(data: countriesStats);
      }
      return APIResponse<List<CountriesModel>>(
          error: true, errorMessage: 'An error occured');
    }).catchError((_) => APIResponse<List<CountriesModel>>(
        error: true, errorMessage: 'An error occured'));
  }

  Future<List<NewsModel>> fetchNews() async {
    String url = newsUrl;
    var result = await http.get(url);

    List<NewsModel> articles = [];

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
