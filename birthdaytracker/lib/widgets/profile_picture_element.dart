import 'package:birthdaytracker/models/birthday_profile.dart';
import 'package:birthdaytracker/models/hive_helper.dart';
import 'package:flutter/material.dart';

class ProfilePictureElement extends StatelessWidget {
  final BirthdayProfile profile;

  ProfilePictureElement(this.profile, {super.key});

  String getImagePath() {
    return HiveHelper.getImagePath(profile.key);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ClipOval(
        child: FittedBox(
          fit: BoxFit.cover,
          child: Image(image: AssetImage(getImagePath())),
        ),
      ),
    );
  }
}
