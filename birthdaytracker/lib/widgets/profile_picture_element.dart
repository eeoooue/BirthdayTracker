import 'package:flutter/material.dart';

class ProfilePictureElement extends StatelessWidget {
  ProfilePictureElement({super.key});

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: ClipOval(
        child: FittedBox(
          fit: BoxFit.cover,
          child: Image(image: AssetImage('assets/TestPicture.jpg')),
        ),
      ),
    );
  }
}
