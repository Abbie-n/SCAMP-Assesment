import 'package:covidTracker/ui/shared/colors.dart';
import 'package:covidTracker/ui/shared/config.dart';
import 'package:covidTracker/ui/views/mainView/main_viewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomrNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var model = Provider.of<MainViewModel>(context);
    return BottomNavigationBar(
      selectedFontSize: Config.textSize(context, 3.1),
      unselectedFontSize: Config.textSize(context, 3.1),
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      backgroundColor: ThemeColors.containerColor,
      selectedItemColor: ThemeColors.textColor,
      unselectedItemColor: ThemeColors.unselected,
      currentIndex: model.currentIndex,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          title: Column(
            children: <Widget>[
              SizedBox(
                height: Config.textSize(context, 1.3),
              ),
              Text('Home'),
            ],
          ),
          icon: Icon(
            Icons.home,
            size: Config.textSize(context, 4),
            color: ThemeColors.unselected,
          ),
          activeIcon: Icon(
            Icons.home,
            size: Config.textSize(context, 4),
            color: ThemeColors.selected,
          ),
        ),
        BottomNavigationBarItem(
          title: Column(
            children: <Widget>[
              SizedBox(
                height: Config.textSize(context, 1.3),
              ),
              Text('Countries'),
            ],
          ),
          icon: Icon(
            Icons.flag,
            size: Config.textSize(context, 4),
            color: ThemeColors.unselected,
          ),
          activeIcon: Icon(
            Icons.flag,
            size: Config.textSize(context, 4),
            color: ThemeColors.selected,
          ),
        ),
        BottomNavigationBarItem(
          title: Column(
            children: <Widget>[
              SizedBox(
                height: Config.textSize(context, 1.3),
              ),
              Text('News'),
            ],
          ),
          icon: Icon(
            Icons.new_releases,
            size: Config.textSize(context, 4),
            color: ThemeColors.unselected,
          ),
          activeIcon: Icon(
            Icons.new_releases,
            size: Config.textSize(context, 4),
            color: ThemeColors.selected,
          ),
        ),
      ],
      onTap: (index) {
        model.currentIndex = index;
      },
    );
  }
}
