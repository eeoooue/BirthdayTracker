import 'package:birthdaytracker/models/birthday_profile.dart';
import 'package:birthdaytracker/models/nav_helper.dart';
import 'package:flutter/material.dart';

class EditProfileButton extends StatelessWidget {
  final NavigationHelper navHelper = NavigationHelper();
  final BirthdayProfile profile;

  EditProfileButton(this.profile, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: MaterialButton(
        onPressed: () {
          navHelper.editProfile(context, profile);
        },
        child: Text("Edit Profile"),
        textColor: Colors.white,
        color: Colors.blue,
      ),
    );
  }
}
