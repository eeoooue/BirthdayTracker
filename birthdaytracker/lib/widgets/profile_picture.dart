import 'package:birthdaytracker/models/birthdayprofile.dart';
import 'package:flutter/material.dart';

class ProfilePicture extends StatelessWidget {
  final BirthdayProfile profile;

  ProfilePicture(this.profile, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        height: 150,
        width: 150,
        decoration: BoxDecoration(
          color: Colors.black26,
          borderRadius: BorderRadius.circular(1000),
        ),
      ),
    );
  }
}
