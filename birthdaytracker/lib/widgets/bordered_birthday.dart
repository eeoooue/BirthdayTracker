import 'package:birthdaytracker/models/birthday_profile.dart';
import 'package:flutter/material.dart';

class BorderedBirthday extends StatelessWidget {
  final BirthdayProfile profile;

  const BorderedBirthday(this.profile, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          decoration: BoxDecoration(
              color: Colors.grey[300], borderRadius: BorderRadius.circular(8)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              profile.getBirthdayString(),
              style: const TextStyle(fontSize: 18),
            ),
          )),
    );
  }
}
