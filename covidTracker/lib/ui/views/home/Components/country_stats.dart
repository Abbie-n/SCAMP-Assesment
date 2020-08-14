
import 'package:covidTracker/core/http/apiResponse.dart';
import 'package:covidTracker/core/models/models.dart';
import 'package:covidTracker/core/routes/router.dart';
import 'package:covidTracker/ui/shared/colors.dart';
import 'package:covidTracker/ui/shared/config.dart';
import 'package:covidTracker/ui/views/home/home_screen_model.dart';
import 'package:covidTracker/ui/views/mainView/main_viewModel.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CountryStats extends StatelessWidget {
  final int length;
  CountryStats({this.length});
  @override
  Widget build(BuildContext context) {
    var model = Provider.of<HomeScreenModel>(context);
    var mainViewModel = Provider.of<MainViewModel>(context);
    final value = new NumberFormat("#,##0", "en_US");
    return Container(
      // height: Config.yMargin(context, 42),
      width: Config.xMargin(context, 90),
      decoration: BoxDecoration(
        color: ThemeColors.containerColor,
        borderRadius: BorderRadius.circular(Config.yMargin(context, 2)),
      ),
      child: FutureBuilder<APIResponse<List<CountriesModel>>>(
          future: model.stats.fetchStatsPerCountry(),
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
                      'Statistics Per Country',
                      style: TextStyle(
                          color: ThemeColors.textColor,
                          fontSize: Config.textSize(context, 5),
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                  Container(
                    height: Config.yMargin(context, 30),
                    width: Config.xMargin(context, 90),
                    margin: EdgeInsets.only(
                        left: Config.xMargin(context, 5),
                        right: Config.xMargin(context, 5)),
                    child: ListView.separated(
                        padding: EdgeInsets.all(0),
                        separatorBuilder: (_, __) =>
                            Divider(color: ThemeColors.unselected),
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: length,
                        itemBuilder: (context, index) {
                          return Container(
                            // height: Config.yMargin(context, 9),
                            width: Config.xMargin(context, 90),
                            decoration: BoxDecoration(
                                color: ThemeColors.containerColor,
                                borderRadius: BorderRadius.circular(
                                    Config.yMargin(context, 2))),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: Config.yMargin(context, 2),
                                ),
                                Text(snapshot.data.data[index].country,
                                    style: TextStyle(
                                        color: ThemeColors.textColor,
                                        fontSize: Config.textSize(context, 3))),
                                SizedBox(
                                  height: Config.yMargin(context, 1),
                                ),
                                Container(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            value.format(snapshot.data
                                                .data[index].totalConfirmed),
                                            style: TextStyle(
                                              color: ThemeColors.infected,
                                              fontSize:
                                                  Config.textSize(context, 4.5),
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          Text(
                                            'Infected',
                                            style: TextStyle(
                                                color: ThemeColors.textColor,
                                                fontSize: Config.textSize(
                                                    context, 3.5),
                                                fontWeight: FontWeight.w300),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            value.format(snapshot.data
                                                .data[index].totalRecovered),
                                            style: TextStyle(
                                              color: ThemeColors.recovered,
                                              fontSize:
                                                  Config.textSize(context, 4.5),
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          Text(
                                            'Recovered',
                                            style: TextStyle(
                                                color: ThemeColors.textColor,
                                                fontSize: Config.textSize(
                                                    context, 3.5),
                                                fontWeight: FontWeight.w300),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            value.format(snapshot
                                                .data.data[index].totalDeaths),
                                            style: TextStyle(
                                              color: ThemeColors.deaths,
                                              fontSize:
                                                  Config.textSize(context, 4.5),
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          Text(
                                            'Deaths',
                                            style: TextStyle(
                                                color: ThemeColors.textColor,
                                                fontSize: Config.textSize(
                                                    context, 3.5),
                                                fontWeight: FontWeight.w300),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                  ),
                  InkWell(
                    onTap: () {
                      mainViewModel.currentIndex = 1;
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                        left: Config.xMargin(context, 5),
                        top: Config.yMargin(context, 2),
                        bottom: Config.yMargin(context, 2),
                      ),
                      child: Text(
                        'See all',
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: ThemeColors.textColor,
                            fontSize: Config.textSize(context, 4),
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return Padding(
                padding: const EdgeInsets.all(30.0),
                child: Center(child: CircularProgressIndicator()),
              );
            }
          }),
    );
  }
}