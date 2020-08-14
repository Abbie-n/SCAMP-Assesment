import 'package:covidTracker/core/http/apiResponse.dart';
import 'package:covidTracker/core/http/fetchData.dart';
import 'package:covidTracker/core/models/models.dart';
import 'package:flutter/material.dart';

class CountriesStatsModel extends ChangeNotifier {
  TextEditingController searchController = TextEditingController();
  final DataService stats = DataService();

  APIResponse<List<CountriesModel>> countries =
      APIResponse<List<CountriesModel>>();

  bool loading = true;

  List<String> filters = [
    'None',
    'Highest Cases',
    'Highest Recovered',
    'Highest Deaths',
  ];

  String _selected;
  String get selected => _selected ?? filters[0];

  set selectedFilter(String val) {
    _selected = val;
    loading = true;
    notifyListeners();
  }

  List<CountriesModel> countryInSearch = List<CountriesModel>();

  Future<APIResponse<List<CountriesModel>>> getStatsByCountry() async {
    APIResponse<List<CountriesModel>> response =
        await stats.fetchStatsPerCountry();
    response.data = response.data
        .where((element) => element.country
            .toLowerCase()
            .contains(searchController.text.toLowerCase()))
        .toList();
    if (selected != 'None') {
      response.data.sort(compareCountries);
    }
    loading = false;
    return response;
  }

  int compareCountries(CountriesModel a, CountriesModel b) {
    switch (selected) {
      case 'Highest Cases':
        return b.totalConfirmed.compareTo(a.totalConfirmed);
      case 'Highest Recovered':
        return b.totalRecovered.compareTo(a.totalRecovered);
      case 'Highest Deaths':
        return b.totalDeaths.compareTo(a.totalDeaths);
      case 'None':
      default:
        return 0;
    }
  }
  void onChanged(String value, {List<CountriesModel> countriess}) {
    // searchController.text = value.toLowerCase();
    // _keyWord = value;
    loading = true;
    notifyListeners();

  }
}