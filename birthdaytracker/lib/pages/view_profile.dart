import 'package:birthdaytracker/models/nav_helper.dart';
import 'package:birthdaytracker/widgets/negative_action_button.dart';
import 'package:birthdaytracker/widgets/neutral_action_button.dart';
import 'package:flutter/material.dart';
import '../models/birthday_profile.dart';
import '../models/hive_helper.dart';
import '../widgets/profile_name_card.dart';
import '../widgets/profile_picture.dart';
import '../widgets/bordered_birthday.dart';

class ViewProfile extends StatefulWidget {
  final BirthdayProfile profile;

  const ViewProfile(this.profile, {super.key});

  @override
  State<StatefulWidget> createState() {
    return _ViewProfileState(profile);
  }
}

class _ViewProfileState extends State<ViewProfile> {
  final BirthdayProfile profile;
  final NavigationHelper navHelper = NavigationHelper();

  _ViewProfileState(this.profile);

  _editProfile() {
    navHelper.editProfile(context, profile);
  }

  _deleteProfile() {
    HiveHelper.deleteProfile(profile);
    navHelper.navigateHome(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "View Profile",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Column(children: [
        ProfilePicture(profile, 150),
        ProfileNameCard(profile),
        BorderedBirthday(profile),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            NeutralActionButton("Edit", _editProfile),
            NegativeActionButton("Delete", _deleteProfile),
          ],
        ),
      ]),
    );
  }
}
