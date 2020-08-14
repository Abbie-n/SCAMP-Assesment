import 'package:covidTracker/core/routes/router.dart';
import 'package:covidTracker/ui/shared/colors.dart';
import 'package:covidTracker/ui/shared/config.dart';
import 'package:flutter/material.dart';

class SplasScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.backgroundColor,
      body: Container(
        child: Column(
          children: [
            // Align(
            //   alignment: Alignment.topRight,
            //   child: Text('Testing',
            //       style: TextStyle(
            //         color: ThemeColors.textColor,
            //       )),
            // ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                margin: EdgeInsets.only(
                    top: Config.yMargin(context, 30),
                    left: Config.xMargin(context, 10)),
                child: Text(
                  'Welcome to Covid Tracker!',
                  style: TextStyle(
                      color: ThemeColors.textColor,
                      fontSize: Config.textSize(context, 6)),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: InkWell(
                onTap: () {
                  Navigator.pushReplacementNamed(context, Routes.mainView);
                },
                child: Container(
                  height: Config.yMargin(context, 10),
                  width: Config.xMargin(context, 20),
                  margin: EdgeInsets.only(
                      right: Config.xMargin(context, 20),
                      top: Config.yMargin(context, 50)),
                  child: Text(
                    'View Stats',
                    style: TextStyle(
                        color: ThemeColors.textColor,
                        fontSize: Config.textSize(context, 4)),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
