import 'package:covidTracker/ui/shared/bottomNav.dart';
import 'package:flutter/material.dart';

class NewsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Container(
        child: Center(child: Text('News'),),
      ),
      //bottomNavigationBar: BottomrNav(),
    );
  }
}