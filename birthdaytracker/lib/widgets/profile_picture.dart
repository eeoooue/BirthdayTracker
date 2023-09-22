import 'package:birthdaytracker/models/birthday_profile.dart';
import 'package:birthdaytracker/widgets/profile_picture_element.dart';
import 'package:flutter/material.dart';

class ProfilePicture extends StatelessWidget {
  final BirthdayProfile profile;
  final double size;

  const ProfilePicture(this.profile, this.size, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size + 12,
      width: size + 12,
      child: Center(
          child: SizedBox(
        height: size,
        width: size,
        child: ProfilePictureElement(profile),
      )),
    );
  }
}
