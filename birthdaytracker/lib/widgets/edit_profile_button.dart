import 'package:birthdaytracker/models/birthdayprofile.dart';
import 'package:flutter/material.dart';

class EditProfileButton extends StatelessWidget {
  final BirthdayProfile profile;

  EditProfileButton(this.profile, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: MaterialButton(
        onPressed: () {},
        child: Text("Edit Profile"),
        textColor: Colors.white,
        color: Colors.blue,
      ),
    );
  }
}
