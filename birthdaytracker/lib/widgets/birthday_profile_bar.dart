import 'package:birthdaytracker/models/birthdayprofile.dart';
import 'package:birthdaytracker/pages/viewprofile.dart';
import 'package:flutter/material.dart';

import 'birthday_bar_datebox.dart';
import 'birthday_bar_name.dart';
import 'birthday_bar_picture.dart';

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
