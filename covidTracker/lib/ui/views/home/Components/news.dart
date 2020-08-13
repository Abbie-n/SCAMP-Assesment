import 'package:covidTracker/core/models/models.dart';
import 'package:covidTracker/ui/shared/colors.dart';
import 'package:covidTracker/ui/shared/config.dart';
import 'package:covidTracker/ui/views/home/home_screen_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class News extends StatelessWidget {
  int length;
  News({this.length});
  @override
  Widget build(BuildContext context) {
    var model = Provider.of<HomeScreenModel>(context);
    final value = new NumberFormat("#,##0", "en_US");
    return Container(
      height: Config.yMargin(context, 42),
      width: Config.xMargin(context, 90),
      decoration: BoxDecoration(
        color: ThemeColors.containerColor,
        borderRadius: BorderRadius.circular(Config.yMargin(context, 2)),
      ),
      child: FutureBuilder<List<NewsModel>>(
          future: model.stats.fetchNews(),
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
                      'News on Covid-19',
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
                            Divider(color: ThemeColors.textColor),
                        itemCount: length,
                        itemBuilder: (context, index) {
                          return Container(
                            height: Config.yMargin(context, 32),
                            width: Config.xMargin(context, 90),
                            decoration: BoxDecoration(
                                color: ThemeColors.containerColor,
                                borderRadius: BorderRadius.circular(
                                    Config.yMargin(context, 2))),
                            child: Column(
                              children: <Widget>[
                                SizedBox(
                                  height: Config.yMargin(context, 1),
                                ),
                                Container(
                                  height: Config.yMargin(context, 20),
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: snapshot.data[index].urlImage ==
                                              null
                                          ? AssetImage('images/Coronavirus.png')
                                          : NetworkImage(
                                              snapshot.data[index].urlImage),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: Config.yMargin(context, 1),
                                ),
                                Text(
                                  snapshot.data[index].title,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: ThemeColors.textColor,
                                      decoration: TextDecoration.underline),
                                ),
                                SizedBox(
                                  height: Config.yMargin(context, 2),
                                ),
                                Text(snapshot.data[index].description,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: ThemeColors.textColor)),
                              ],
                            ),
                          );
                        }),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      left: Config.xMargin(context, 5),
                      top: Config.yMargin(context, 2),
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
                ],
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
