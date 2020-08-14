import 'package:covidTracker/core/models/models.dart';
import 'package:covidTracker/ui/shared/colors.dart';
import 'package:covidTracker/ui/shared/config.dart';
import 'package:covidTracker/ui/views/home/home_screen_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class DailyStats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var model = Provider.of<HomeScreenModel>(context);
    final value = new NumberFormat("#,##0", "en_US");
    return Container(
      width: Config.xMargin(context, 90),
              decoration: BoxDecoration(
                  color: ThemeColors.containerColor,
                  borderRadius:
                      BorderRadius.circular(Config.yMargin(context, 2))),
      child: FutureBuilder<GlobalStatsModel>(
          future: model.stats.fetchGlobalStats(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      left: Config.xMargin(context, 5),
                      top: Config.yMargin(context, 2),
                    ),
                    child: Text(
                      'Daily Global Statistics',
                      style: TextStyle(
                          color: ThemeColors.textColor,
                          fontSize: Config.textSize(context, 5),
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                  SizedBox(
                    height: Config.yMargin(context, 2),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: Config.xMargin(context, 5),
                        right: Config.xMargin(context, 5), bottom: Config.yMargin(context, 2),),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              value.format(snapshot.data.newConfirmed),
                              style: TextStyle(
                                color: ThemeColors.infected,
                                fontSize: Config.textSize(context, 4.5),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              'Infected',
                              style: TextStyle(
                                  color: ThemeColors.textColor,
                                  fontSize: Config.textSize(context, 3.5),
                                  fontWeight: FontWeight.w300),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              value.format(snapshot.data.newRecovered),
                              style: TextStyle(
                                color: ThemeColors.recovered,
                                fontSize: Config.textSize(context, 4.5),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              'Recovered',
                              style: TextStyle(
                                  color: ThemeColors.textColor,
                                  fontSize: Config.textSize(context, 3.5),
                                  fontWeight: FontWeight.w300),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              value.format(snapshot.data.newDeaths),
                              style: TextStyle(
                                color: ThemeColors.deaths,
                                fontSize: Config.textSize(context, 4.5),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              'Deaths',
                              style: TextStyle(
                                  color: ThemeColors.textColor,
                                  fontSize: Config.textSize(context, 3.5),
                                  fontWeight: FontWeight.w300),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }
          else {
            return Padding(
              padding: const EdgeInsets.all(30.0),
              child: Center(child: CircularProgressIndicator()),
            );
          }
          }),
    );
  }
}