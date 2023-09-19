import 'package:birthdaytracker/birthdayprofile.dart';
import 'package:flutter/material.dart';

abstract class DirectoryElement extends StatelessWidget {
  const DirectoryElement({super.key});
}

class DirectoryProfile extends DirectoryElement {
  final BirthdayProfile profile;

  const DirectoryProfile(this.profile, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
      child: Row(children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: Text(
            profile.name,
            style: TextStyle(fontSize: 20),
          ),
        ),
      ]),
    );
  }
}

class DirectorySectionMarker extends DirectoryElement {
  final String character;

  const DirectorySectionMarker(this.character, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(6, 4, 6, 4),
        child: Text(
          character,
          style: const TextStyle(fontSize: 16, color: Colors.white),
        ),
      ),
    );
  }
}
