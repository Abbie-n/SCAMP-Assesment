import 'package:covidTracker/ui/views/countries/countries.dart';
import 'package:covidTracker/ui/views/home/home_screen.dart';
import 'package:covidTracker/ui/views/news/news.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:covidTracker/ui/shared/colors.dart';
import 'package:covidTracker/ui/shared/config.dart';
import 'package:covidTracker/ui/views/home/home_screen_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainViewModel extends ChangeNotifier {
  int _currentIndex = 0;

  get currentIndex => _currentIndex;

  set currentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  var views = [
    HomeScreen(),
    CountriesStats(),
    NewsScreen()
  ];
}