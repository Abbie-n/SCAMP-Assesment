import 'package:covidTracker/ui/shared/bottomNav.dart';
import 'package:covidTracker/ui/shared/colors.dart';
import 'package:flutter/material.dart';

class CountriesStats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.backgroundColor,
      appBar: AppBar(
        elevation: 2,
        title: Text('Countries Statistics'),
        centerTitle: true,
        backgroundColor: ThemeColors.containerColor,
      ),
      body: Container(
        child: Center(
          child: Text(
            'Countries',
            style: TextStyle(color: ThemeColors.textColor),
          ),
        ),
      ),
      //bottomNavigationBar: BottomrNav(),
    );
  }
}
