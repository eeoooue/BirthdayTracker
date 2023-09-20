import 'package:birthdaytracker/models/nav_helper.dart';
import 'package:flutter/material.dart';
import '../models/time_helper.dart';
import '../models/birthday_profile.dart';
import '../widgets/birthday_profile_bar.dart';

class HomeFeed extends StatefulWidget {
  const HomeFeed({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomeFeedState();
  }
}

class _HomeFeedState extends State<HomeFeed> {
  final List<BirthdayProfile> profiles = TimeHelper().getClosestBirthdays();
  final NavigationHelper navHelper = NavigationHelper();

  _HomeFeedState();

  String getTodayAsText() {
    int day = DateTime.now().day;
    int month = DateTime.now().month;
    int year = DateTime.now().year;

    BirthdayProfile today = BirthdayProfile(-1, "Today", month, day);
    today.setYear(year);

    return today.getBirthdayString();
  }

  void _navigateBottomBar(int index) {
    navHelper.navigateBottomBar(context, index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "BirthdayTracker",
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      bottomNavigationBar: BottomNavigationBar(
          onTap: _navigateBottomBar, items: navHelper.getNavBarItems()),
      body: Column(children: [
        Container(
          height: 32,
          color: Colors.grey[300],
          child: Center(
              child: Text(
            getTodayAsText(),
            style: TextStyle(color: Colors.black54),
          )),
        ),
        Expanded(
            child: ListView.builder(
                itemCount: profiles.length,
                itemBuilder: (context, index) {
                  return BirthdayProfileBar(profiles[index]);
                }))
      ]),
    );
  }
}
