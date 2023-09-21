import 'package:birthdaytracker/models/nav_helper.dart';
import 'package:birthdaytracker/widgets/my_app_bar.dart';
import 'package:flutter/material.dart';
import '../models/time_helper.dart';
import '../models/birthday_profile.dart';
import '../widgets/birthday_profile_bar.dart';
import '../widgets/current_date_banner.dart';

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

  Widget getHomeBody() {
    return Column(children: [
      const CurrentDateBanner(),
      Expanded(
          child: ClipRect(
        child: ListView.builder(
            itemCount: profiles.length,
            itemBuilder: (context, index) {
              return BirthdayProfileBar(profiles[index]);
            }),
      ))
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      backgroundColor: Colors.grey[300],
      bottomNavigationBar: navHelper.getBottomNav(_navigateBottomBar, 0),
      body: getHomeBody(),
    );
  }
}
