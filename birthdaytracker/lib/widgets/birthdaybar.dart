import 'package:birthdaytracker/models/birthdayprofile.dart';
import 'package:birthdaytracker/pages/viewprofile.dart';
import 'package:flutter/material.dart';

class BirthdayProfileBar extends StatelessWidget {
  final BirthdayProfile profile;

  BirthdayProfileBar(this.profile, {super.key});

  void _openProfile(BuildContext c) {
    final route = MaterialPageRoute(builder: (c) => ViewProfile(profile));
    Navigator.push(c, route);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        _openProfile(context);
      },
      child: Container(
        color: Colors.grey,
        height: 80,
        margin: const EdgeInsets.all(10),
        child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
          BdarBarPicture(),
          BdayBarName(profile.name),
          BdayBarDateBox(profile.month, profile.day),
        ]),
      ),
    );
  }
}

class BdarBarPicture extends StatelessWidget {
  BdarBarPicture({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 80,
      width: 80,
      child: Center(
          child: Container(
        height: 70,
        width: 70,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100), color: Colors.white),
      )),
    );
  }
}

class BdayBarName extends StatelessWidget {
  final String name;

  BdayBarName(this.name, {super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.all(16),
      child: Text(
        name,
        style: TextStyle(fontSize: 18),
      ),
    ));
  }
}

class BdayBarDateBox extends StatelessWidget {
  final int month;
  final int day;

  const BdayBarDateBox(this.month, this.day, {super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Container(
      height: 80,
      width: 80,
      color: Colors.black38,
      child: Column(children: [DateBoxMonth(month), DateBoxDay(day)]),
    );
  }
}

class DateBoxMonth extends StatelessWidget {
  final int month;
  final List<String> months = List.from([
    "JAN",
    "FEB",
    "MAR",
    "APR",
    "MAY",
    "JUN",
    "JUL",
    "AUG",
    "SEP",
    "OCT",
    "NOV",
    "DEC"
  ]);

  DateBoxMonth(this.month, {super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Center(
          child: Text(months[month - 1],
              style: const TextStyle(color: Colors.white, fontSize: 16))),
    );
  }
}

class DateBoxDay extends StatelessWidget {
  final int day;

  DateBoxDay(this.day, {super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Center(
          child: Text(
        day.toString(),
        style: const TextStyle(color: Colors.white, fontSize: 28),
      )),
    );
  }
}
