import 'package:birthdaytracker/models/birthdayprofile.dart';
import 'package:flutter/material.dart';

class FormattedBirthdayWithBorder extends StatelessWidget {
  final BirthdayProfile profile;

  FormattedBirthdayWithBorder(this.profile, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          decoration: BoxDecoration(
              color: Colors.grey[300], borderRadius: BorderRadius.circular(8)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              profile.getBirthdayString(),
              style: TextStyle(fontSize: 18),
            ),
          )),
    );
  }
}

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
