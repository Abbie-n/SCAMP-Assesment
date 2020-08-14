import 'package:covidTracker/ui/views/countries/countries.dart';
import 'package:covidTracker/ui/views/home/home_screen.dart';
import 'package:covidTracker/ui/views/mainView/main_view.dart';
import 'package:covidTracker/ui/views/news/news_view.dart';
import 'package:covidTracker/ui/views/splash_screen/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class Routes {
  static const splashScreen = 'splashScreen';
  static const mainView = 'mainView';
  static const homeScreen = 'homeScreen';
  static const countriesStats = 'countriesStats';
  static const newsScreen = 'newsScreen';
}

class Router {
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashScreen:
        return CupertinoPageRoute<dynamic>(
          builder: (context) => SplasScreen(),
          settings: settings,
        );
        case Routes.mainView:
        return CupertinoPageRoute<dynamic>(
          builder: (context) => MainView(),
          settings: settings,
        );
        case Routes.homeScreen:
        return CupertinoPageRoute<dynamic>(
          builder: (context) => HomeScreen(),
          settings: settings,
        );
        case Routes.countriesStats:
        return CupertinoPageRoute<dynamic>(
          builder: (context) => CountriesStats(),
          settings: settings,
        );
        case Routes.newsScreen:
        return CupertinoPageRoute<dynamic>(
          builder: (context) => NewsView(),
          settings: settings,
        );
      default:
        return unknownScreen(settings.name);
    }
  }
}

PageRoute unknownScreen(String routeName) => CupertinoPageRoute(
      builder: (_) => Scaffold(
        body: Container(
          color: Colors.redAccent,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                child: Text(
                  routeName == "/"
                      ? 'Initial route not found! \n did you forget to annotate your home page with @initial or @MaterialRoute(initial:true)?'
                      : 'Route name $routeName is not found!',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
              ),
              OutlineButton.icon(
                label: Text('Back'),
                icon: Icon(Icons.arrow_back),
                onPressed: () => Navigator.of(_).pop(),
              )
            ],
          ),
        ),
      ),
    );