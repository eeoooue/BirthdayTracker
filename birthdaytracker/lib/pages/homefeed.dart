import 'package:flutter/material.dart';
import '../models/timehelper.dart';
import '../models/birthdayprofile.dart';
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

  _HomeFeedState();

  String getTodayAsText() {
    int day = DateTime.now().day;
    int month = DateTime.now().month;
    int year = DateTime.now().year;

    BirthdayProfile today = BirthdayProfile("Today", month, day);
    today.setYear(year);

    return today.getBirthdayString();
  }

  void _navigateBottomBar(int index) {
    switch (index) {
      case 0:
        {
          Navigator.popAndPushNamed(context, "/homefeed");
        }
      case 1:
        {
          Navigator.popAndPushNamed(context, "/profiledirectory");
        }
    }
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
      bottomNavigationBar:
          BottomNavigationBar(onTap: _navigateBottomBar, items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.people), label: "People"),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
      ]),
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
