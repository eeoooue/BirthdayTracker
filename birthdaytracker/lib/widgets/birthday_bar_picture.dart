import 'package:birthdaytracker/models/birthday_profile.dart';
import 'package:birthdaytracker/widgets/profile_picture_element.dart';
import 'package:flutter/material.dart';

class BdarBarPicture extends StatelessWidget {
  final BirthdayProfile profile;

  const BdarBarPicture(this.profile, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      width: 80,
      child: Center(
          child: SizedBox(
        height: 68,
        width: 68,
        child: ProfilePictureElement(profile),
      )),
    );
  }
}
