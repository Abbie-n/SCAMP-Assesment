import 'package:covidTracker/core/models/models.dart';
import 'package:covidTracker/ui/shared/colors.dart';
import 'package:covidTracker/ui/shared/config.dart';
import 'package:covidTracker/ui/views/news/news_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var model = Provider.of<NewsViewModel>(context);
    return Scaffold(
        backgroundColor: ThemeColors.backgroundColor,
        appBar: AppBar(
          elevation: 0,
          title: Text(
            'News on COVID-19',
            style: TextStyle(color: ThemeColors.textColor),
          ),
          centerTitle: true,
          backgroundColor: ThemeColors.backgroundColor,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  // height: Config.yMargin(context, 85),
                  width: Config.xMargin(context, 90),
                  margin: EdgeInsets.only(
                    left: Config.xMargin(context, 5),
                    right: Config.xMargin(context, 5),
                    top: Config.yMargin(context, 1),
                  ),
                  decoration: BoxDecoration(
                    color: ThemeColors.containerColor,
                    borderRadius:
                        BorderRadius.circular(Config.yMargin(context, 2)),
                  ),
                  child: FutureBuilder<List<NewsModel>>(
                      future: model.stats.fetchNews(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: Config.yMargin(context, 2),
                              ),
                              Container(
                                // height: Config.yMargin(context, 78),
                                width: Config.xMargin(context, 90),
                                margin: EdgeInsets.only(
                                    left: Config.xMargin(context, 5),
                                    right: Config.xMargin(context, 5)),
                                child: ListView.separated(
                                  primary: false,
                                  shrinkWrap: true,
                                    padding: EdgeInsets.all(0),
                                    separatorBuilder: (_, __) =>
                                        Divider(color: ThemeColors.textColor, height: 35,),
                                    itemCount: snapshot.data.length,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        // height: Config.yMargin(context, 40),
                                        width: Config.xMargin(context, 90),
                                        decoration: BoxDecoration(
                                            color: ThemeColors.containerColor,
                                            borderRadius: BorderRadius.circular(
                                                Config.yMargin(context, 2))),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            SizedBox(
                                              height:
                                                  Config.yMargin(context, 1),
                                            ),
                                            Container(
                                              height:
                                                  Config.yMargin(context, 20),
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: snapshot.data[index]
                                                              .urlImage ==
                                                          null
                                                      ? AssetImage(
                                                          'images/Coronavirus.png')
                                                      : NetworkImage(snapshot
                                                          .data[index]
                                                          .urlImage),
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height:
                                                  Config.yMargin(context, 1),
                                            ),
                                            Text(
                                              snapshot.data[index].title,
                                              style: TextStyle(
                                                  color: ThemeColors.textColor,
                                                  decoration:
                                                      TextDecoration.underline),
                                            ),
                                            SizedBox(
                                              height:
                                                  Config.yMargin(context, 2),
                                            ),
                                            Text(
                                                snapshot
                                                    .data[index].description,
                                                style: TextStyle(
                                                    color:
                                                        ThemeColors.textColor)),
                                          ],
                                        ),
                                      );
                                    }),
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
                ),
              ],
            ),
          ),
        ));
  }
}