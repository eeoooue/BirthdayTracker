import 'package:flutter/material.dart';
import '../models/birthday_profile.dart';

class CurrentDateBanner extends StatelessWidget {
  const CurrentDateBanner({super.key});

  String getTodayAsText() {
    int day = DateTime.now().day;
    int month = DateTime.now().month;
    int year = DateTime.now().year;

    BirthdayProfile today = BirthdayProfile(-1, "Today", month, day);
    today.setYear(year);

    return today.getBirthdayString();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(155, 80, 148, 1),
      height: 32,
      child: Center(
          child: Text(
        getTodayAsText(),
        style: const TextStyle(color: Colors.white),
      )),
    );
  }
}
