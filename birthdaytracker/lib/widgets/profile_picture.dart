import 'package:birthdaytracker/models/birthday_profile.dart';
import 'package:birthdaytracker/widgets/profile_picture_element.dart';
import 'package:flutter/material.dart';

class ProfilePicture extends StatelessWidget {
  final BirthdayProfile profile;

  const ProfilePicture(this.profile, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: SizedBox(
        height: 150,
        width: 150,
        child: ProfilePictureElement(profile),
      ),
    );
  }
}
