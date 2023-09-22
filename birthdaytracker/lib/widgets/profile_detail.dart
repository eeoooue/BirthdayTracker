import 'package:flutter/material.dart';

class ProfileDetail extends StatelessWidget {
  final String text;

  const ProfileDetail(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: const Color.fromRGBO(155, 80, 148, 1)),
            borderRadius: BorderRadius.circular(8),
            color: const Color.fromRGBO(155, 80, 148, 0.2)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            text,
            style: const TextStyle(color: Color.fromRGBO(155, 80, 148, 1)),
          ),
        ),
      ),
    );
  }
}
