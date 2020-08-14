import 'package:covidTracker/core/http/apiResponse.dart';
import 'package:covidTracker/core/models/models.dart';
import 'package:covidTracker/ui/shared/colors.dart';
import 'package:covidTracker/ui/shared/config.dart';
import 'package:covidTracker/ui/views/countries/countries_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:covidTracker/core/http/apiResponse.dart';

class CountriesStats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var model = Provider.of<CountriesStatsModel>(context);
    rebuildAllChildren(context);
    print(model.loading);
    return Scaffold(
      backgroundColor: ThemeColors.backgroundColor,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Countries Statistics',
          style: TextStyle(color: ThemeColors.textColor),
        ),
        centerTitle: true,
        backgroundColor: ThemeColors.backgroundColor,
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(
            left: Config.xMargin(context, 5),
            right: Config.xMargin(context, 5),
            top: Config.yMargin(context, 1),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                _searchField(context),
                SizedBox(
                  height: Config.yMargin(context, 2),
                ),
                Container(
                  height: Config.yMargin(context, 80),
                  width: Config.xMargin(context, 90),
                  decoration: BoxDecoration(
                    color: ThemeColors.containerColor,
                    borderRadius:
                        BorderRadius.circular(Config.yMargin(context, 2)),
                  ),
                  child: FutureBuilder<APIResponse<List<CountriesModel>>>(
                      future: model.getStatsByCountry(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData && !model.loading) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: Config.yMargin(context, 2),
                              ),
                              Container(
                                height: Config.yMargin(context, 78),
                                width: Config.xMargin(context, 90),
                                margin: EdgeInsets.only(
                                    left: Config.xMargin(context, 5),
                                    right: Config.xMargin(context, 5)),
                                child: ListView.separated(
                                    padding: EdgeInsets.all(0),
                                    separatorBuilder: (_, __) =>
                                        Divider(color: ThemeColors.unselected),
                                    itemCount: snapshot.data.data.length,
                                    itemBuilder: (context, index) {
                                      return _countriesList(
                                          context, index, snapshot);
                                    }),
                              ),
                            ],
                          );
                        } else {
                          return Center(child: CircularProgressIndicator());
                        }
                      }),
                ),
                SizedBox(
                  height: Config.yMargin(context, 3),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void rebuildAllChildren(BuildContext context) {
    void rebuild(Element el) {
      el.markNeedsBuild();
      el.visitChildren(rebuild);
    }

    (context as Element).visitChildren(rebuild);
  }

  _searchField(BuildContext context) {
    var model = Provider.of<CountriesStatsModel>(context);
    return Column(
      children: [
        Row(
          children: <Widget>[
            Expanded(
              child: Container(
                child: TextField(
                  textCapitalization: TextCapitalization.sentences,
                  textInputAction: TextInputAction.search,
                  controller: model.searchController,
                  onChanged: model.onChanged,
                  cursorColor: ThemeColors.recovered,
                  scrollPadding: EdgeInsets.zero,
                  decoration: InputDecoration(
                    fillColor: Color(0x33757575),
                    focusColor: Color(0XFFFFFFFF),
                    hoverColor: Color(0x33757575),
                    filled: true,
                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                    //prefixIcon: Icon(CupertinoIcons.search),
                    hintText: 'Search by country name',
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(8),
                      borderSide:
                          BorderSide(color: ThemeColors.unselected, width: 2.0),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(8),
                      borderSide:
                          BorderSide(color: ThemeColors.unselected, width: 2.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(8),
                      borderSide:
                          BorderSide(color: ThemeColors.unselected, width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8
                      ),
                      borderSide:
                          BorderSide(color: ThemeColors.unselected, width: 1),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 1),
                    ),
                  ),
                ),
              ),
            ),
            
          ],
        ),
        SizedBox(height: 8),
        Padding(
          padding: EdgeInsets.only(left: 8),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
            Text(
                'Sort by:',
              ),
              SizedBox(width: 8),
            DropdownButton<String>(
              items: model.filters.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: new Text(
                    value,
                    style: TextStyle(
                      fontSize: Config.textSize(context, 4),
                      color: Color(0xaa433D57),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                );
              }).toList(),
              value: model.selected,
              onChanged: (_) {
                model.selectedFilter = _;
                //model.filter();
              },
            )
            // IconButton(
            //     icon: Icon(
            //       Icons.keyboard_arrow_down,
            //       color: ThemeColors.unselected,
            //     ),
            //     onPressed: null)
          ]),
        ),
      ],
    );
  }

  _countriesList(BuildContext context, int index,
      AsyncSnapshot<APIResponse<List<CountriesModel>>> snapshot) {
    final value = new NumberFormat("#,##0", "en_US");
    return Container(
      // height: Config.yMargin(context, 9),
      width: Config.xMargin(context, 90),
      decoration: BoxDecoration(
          color: ThemeColors.containerColor,
          borderRadius: BorderRadius.circular(Config.yMargin(context, 2))),
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      value.format(snapshot.data.data[index].totalConfirmed),
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
                      value.format(snapshot.data.data[index].totalRecovered),
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
                      value.format(snapshot.data.data[index].totalDeaths),
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
      ),
    );
  }
}