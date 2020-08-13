import 'package:covidTracker/ui/shared/bottomNav.dart';
import 'package:covidTracker/ui/views/mainView/main_viewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var model = Provider.of<MainViewModel>(context);
    return Scaffold(
      body: model.views[model.currentIndex],
      bottomNavigationBar: BottomrNav(),
    );
  }
}
