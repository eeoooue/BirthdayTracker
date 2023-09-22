import 'package:birthdaytracker/models/birthday_profile.dart';
import 'package:birthdaytracker/pages/view_profile.dart';
import 'package:birthdaytracker/widgets/profile_picture.dart';
import 'package:flutter/material.dart';
import 'birthday_bar_datebox.dart';
import 'birthday_bar_name.dart';

class BirthdayProfileBar extends StatelessWidget {
  final BirthdayProfile profile;

  const BirthdayProfileBar(this.profile, {super.key});

  void _openProfile(BuildContext c) {
    final route = MaterialPageRoute(builder: (c) => ViewProfile(profile));
    Navigator.push(c, route);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: MaterialButton(
        onPressed: () {
          _openProfile(context);
        },
        child: Container(
          decoration: const BoxDecoration(boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.1),
              blurRadius: 15,
              spreadRadius: 2,
            )
          ]),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              color: Colors.white,
              height: 80,
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                ProfilePicture(profile, 68),
                Expanded(child: BdayBarName(profile.name)),
                BdayBarDateBox(profile.month, profile.day),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
