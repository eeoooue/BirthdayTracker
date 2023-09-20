import 'package:birthdaytracker/models/birthdayprofile.dart';
import 'package:flutter/material.dart';

class DeleteProfileButton extends StatelessWidget {
  final BirthdayProfile profile;
  DeleteProfileButton(this.profile, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: MaterialButton(
          onPressed: () {}, child: Icon(Icons.delete), color: Colors.grey[300]),
    );
  }
}
