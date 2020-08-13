import 'package:covidTracker/ui/shared/bottomNav.dart';
import 'package:covidTracker/ui/shared/colors.dart';
import 'package:covidTracker/ui/shared/config.dart';
import 'package:covidTracker/ui/views/home/Components/country_stats.dart';
import 'package:covidTracker/ui/views/home/Components/daily_stats.dart';
import 'package:covidTracker/ui/views/home/Components/global_stats.dart';
import 'package:covidTracker/ui/views/home/Components/news.dart';
import 'package:covidTracker/ui/views/home/home_screen_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var model = Provider.of<HomeScreenModel>(context);
    return Scaffold(
      backgroundColor: ThemeColors.backgroundColor,
      body: Container(
        margin: EdgeInsets.only(
          left: Config.xMargin(context, 5),
          top: Config.yMargin(context, 8),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Text(
                  model.greeting(),
                  style: TextStyle(
                      color: ThemeColors.textColor,
                      fontSize: Config.textSize(context, 6),
                      fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                height: Config.yMargin(context, 3),
              ),
              DailyStats(),
              SizedBox(
                height: Config.yMargin(context, 2),
              ),
              GlobalStats(),
              SizedBox(
                height: Config.yMargin(context, 2),
              ),
              CountryStats(length: 3,),
              SizedBox(
                height: Config.yMargin(context, 2),
              ),
              News(length: 2,),
              SizedBox(
                height: Config.yMargin(context, 2),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
