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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      bottomNavigationBar: BottomNavigationBar(
          onTap: _navigateBottomBar,
          currentIndex: 2,
          items: navHelper.getNavBarItems()),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MaterialButton(
                  onPressed: () {
                    HiveHelper.clearData();
                  },
                  color: Colors.grey[300],
                  child: Text("Clear Data"),
                ),
              )
            ]),
      ),
    );
  }
}
