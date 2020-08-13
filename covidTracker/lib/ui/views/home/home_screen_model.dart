import 'package:covidTracker/core/http/fetchData.dart';
import 'package:covidTracker/core/models/models.dart';
import 'package:covidTracker/ui/views/countries/countries.dart';
import 'package:covidTracker/ui/views/home/home_screen.dart';
import 'package:covidTracker/ui/views/news/news.dart';
import 'package:flutter/material.dart';

class HomeScreenModel extends ChangeNotifier {
  int _index = 0;
  double _textSize = 3;

  int get index => _index;

  double get textSize => _textSize;

  

  String greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good morning,';
    }
    if (hour < 16) {
      return 'Good afternoon,';
    }
    return 'Good evening,';
  }

  DataService stats = DataService();
// Future<List<GlobalStatsModel>> get globalStats => stats.fetchGlobalStats();
  // void getStats<GlobalStatsModel>() {
  //   countryStats.fetchGlobalStats();
  //   notifyListeners();
  // }
  // Future<List<CountryStatsModel> countryStats =
}
