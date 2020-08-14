import 'package:covidTracker/ui/views/news/news_viewmodel.dart';
import 'package:covidTracker/ui/views/countries/countries_model.dart';
import 'package:covidTracker/ui/views/home/home_screen_model.dart';
import 'package:covidTracker/ui/views/mainView/main_viewModel.dart';
import 'package:provider/provider.dart';

final providers = <SingleChildCloneableWidget>[
  ChangeNotifierProvider(create: (_) => MainViewModel()),
  ChangeNotifierProvider(create: (_) => HomeScreenModel()),
  ChangeNotifierProvider(create: (_) => CountriesStatsModel()),
  ChangeNotifierProvider(create: (_) => NewsViewModel())
];
