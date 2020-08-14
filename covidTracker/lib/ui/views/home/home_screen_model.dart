import 'package:covidTracker/core/http/fetchData.dart';
import 'package:flutter/material.dart';

class HomeScreenModel extends ChangeNotifier {
  DataService stats = DataService();

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
}
