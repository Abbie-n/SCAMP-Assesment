import 'package:covidTracker/ui/views/countries/countries.dart';
import 'package:covidTracker/ui/views/home/home_screen.dart';
import 'package:covidTracker/ui/views/news/news_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:connectivity/connectivity.dart';

class MainViewModel extends ChangeNotifier {
  int _currentIndex = 0;

  bool _connected = true;
  get connected => _connected;

  get currentIndex => _currentIndex;

  set currentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  var views = [HomeScreen(), CountriesStats(), NewsView()];

  void isInternet() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      // I am connected to a mobile network, make sure there is actually a net connection.
      if (await DataConnectionChecker().hasConnection) {
        // Mobile data detected & internet connection confirmed.
        print(_connected);
        _connected = true;
        notifyListeners();
      } else {
        // Mobile data detected but no internet connection found.
        print(_connected);
        _connected = false;
        notifyListeners();
      }
    } else if (connectivityResult == ConnectivityResult.wifi) {
      // I am connected to a WIFI network, make sure there is actually a net connection.
      if (await DataConnectionChecker().hasConnection) {
        // Wifi detected & internet connection confirmed.
        print(_connected);
        _connected = true;
        notifyListeners();
      } else {
        // Wifi detected but no internet connection found.
        print(_connected);
        _connected = false;
        notifyListeners();
      }
    } else {
      // Neither mobile data or WIFI detected, not internet connection found.
      print(_connected);
      _connected = false;
      notifyListeners();
    }
  }
}
