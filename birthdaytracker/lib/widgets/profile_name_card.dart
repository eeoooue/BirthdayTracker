import 'package:birthdaytracker/models/birthdayprofile.dart';
import 'package:flutter/material.dart';

class ProfileNameCard extends StatelessWidget {
  final BirthdayProfile profile;

  ProfileNameCard(this.profile, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        profile.name,
        style: TextStyle(fontSize: 32),
      ),
    );
  }
}