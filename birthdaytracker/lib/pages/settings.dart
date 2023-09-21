import 'package:birthdaytracker/widgets/neutral_action_button.dart';
import 'package:flutter/material.dart';
import '../models/hive_helper.dart';
import '../models/nav_helper.dart';
import '../widgets/my_app_bar.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SettingsPageState();
  }
}

class _SettingsPageState extends State<SettingsPage> {
  final NavigationHelper navHelper = NavigationHelper();

  void _navigateBottomBar(int index) {
    navHelper.navigateBottomBar(context, index);
  }

  void _clearData() {
    HiveHelper.clearData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      bottomNavigationBar: navHelper.getBottomNav(_navigateBottomBar, 2),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [NeutralActionButton("Clear Data", _clearData)]),
      ),
    );
  }
}
