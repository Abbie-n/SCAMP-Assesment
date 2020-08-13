import 'package:covidTracker/core/providers/providers.dart';
import 'package:covidTracker/core/routes/router.dart';
import 'package:covidTracker/ui/shared/bottomNav.dart';
import 'package:covidTracker/ui/views/home/home_screen_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var model = Provider.of<HomeScreenModel>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.splashScreen,
      onGenerateRoute: Router().onGenerateRoute, 
    );
  }
}
