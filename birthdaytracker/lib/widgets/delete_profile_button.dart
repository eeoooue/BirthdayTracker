import 'package:birthdaytracker/models/birthday_profile.dart';
import 'package:birthdaytracker/models/hive_helper.dart';
import 'package:birthdaytracker/models/nav_helper.dart';
import 'package:flutter/material.dart';

class DeleteProfileButton extends StatelessWidget {
  final NavigationHelper navHelper = NavigationHelper();
  final BirthdayProfile profile;

  DeleteProfileButton(this.profile, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: MaterialButton(
          onPressed: () {
            HiveHelper.deleteProfile(profile);
            navHelper.navigateHome(context);
          },
          child: Icon(Icons.delete),
          color: Colors.grey[300]),
    );
  }
}
