import 'package:birthdaytracker/models/birthday_profile.dart';
import 'package:birthdaytracker/models/hive_helper.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class ProfilePictureElement extends StatelessWidget {
  final BirthdayProfile profile;
  final blank = Container(height: 100, width: 100, color: Colors.grey[400]);

  ProfilePictureElement(this.profile, {super.key});

  Widget getChild() {
    String savedPath = HiveHelper.getImagePath(profile.key);

    if (savedPath != "") {
      try {
        return Image(image: FileImage(File(savedPath)));
      } catch (e) {
        return blank;
      }
    }

    return blank;
  }

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: FittedBox(
        fit: BoxFit.cover,
        child: getChild(),
      ),
    );
  }
}
