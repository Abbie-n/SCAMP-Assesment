import 'package:covidTracker/core/http/apiResponse.dart';
import 'package:covidTracker/core/http/fetchData.dart';
import 'package:covidTracker/core/models/models.dart';
import 'package:flutter/material.dart';

class CountriesStatsModel extends ChangeNotifier {
  TextEditingController searchController = TextEditingController();
  final DataService stats = DataService();

  APIResponse<List<CountriesModel>> countries =
      APIResponse<List<CountriesModel>>();

  List<String> filters = [
    'None',
    'Cases',
    'Recovered',
    'Deaths',
  ];

  String _selected;
  String get selected => _selected;

  set selectedFilter(String val) {
    _selected = val;
    notifyListeners();
  }

  // APIResponse<List<CountriesModel>> searchedCountries =
  //     APIResponse<List<CountriesModel>>();
  // List<CountriesModel> get stuff => countries.data.toList().reversed;
  // List<CountriesModel> anotherStuff = List<CountriesModel>();
  // void empty() {
  //   print(stuff);
  //}
  // void search(String value) {
  //   anotherStuff = stuff.where((country) {
  //     var countryName = country.country.toLowerCase();
  //     return countryName.contains(value);
  //   }).toList();
  // }

  //get countries => _countries;
  // Future<APIResponse<List<CountriesModel>>> get countriesList =>
  //     stats.fetchStatsPerCountry();

  // void search() {
  //   var hello = [];
  //   for (var item in countriesList) {
  //     hello.add(item);
  //     print(hello);
  //     notifyListeners();
  //   }
  // }

  //get countries => stats.fetchStatsPerCountry();

  // List<CountriesModel> countryInSearch = List<CountriesModel>();

  // void countriesInDisplay() {
  //   countryInSearch = countries;
  //   notifyListeners();
  // }

  // void onChanged({String value, List<CountriesModel> countriess}) {
  //   searchController.text = value.toLowerCase();

  //   countryInSearch = countriess.where((country) {
  //     var countryName = country.country.toLowerCase();
  //     return countryName.contains(value);
  //   }).toList();
  // }

}
