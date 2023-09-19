import 'package:birthdaytracker/birthdayprofile.dart';
import 'package:flutter/material.dart';

class DirectoryProfile extends StatelessWidget {
  final BirthdayProfile profile;

  const DirectoryProfile(this.profile, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
      child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: Text(
            profile.name,
            style: TextStyle(fontSize: 20),
          ),
        ),
      ]),
    );
  }
}
