import 'package:birthdaytracker/models/birthday_profile.dart';
import 'package:birthdaytracker/pages/view_profile.dart';
import 'package:flutter/material.dart';

abstract class DirectoryElement extends StatelessWidget {
  const DirectoryElement({super.key});
}

class DirectoryProfile extends DirectoryElement {
  final BirthdayProfile profile;

  const DirectoryProfile(this.profile, {super.key});

  void _openProfile(BuildContext c) {
    final route = MaterialPageRoute(builder: (c) => ViewProfile(profile));
    Navigator.push(c, route);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: MaterialButton(
        onPressed: () {
          _openProfile(context);
        },
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey), color: Colors.white),
          child: Row(children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                profile.name,
                style: const TextStyle(fontSize: 20, color: Colors.black54),
              ),
            ),
          ]),
        ),
      ),
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
