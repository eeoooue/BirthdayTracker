import 'package:birthdaytracker/widgets/profile_picture_element.dart';
import 'package:flutter/material.dart';

class BdarBarPicture extends StatelessWidget {
  BdarBarPicture({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 80,
      width: 80,
      child: Center(
          child: Container(
        height: 70,
        width: 70,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100), color: Colors.white),
        child: ProfilePictureElement(),
      )),
    );
  }
}
