import 'package:flutter/material.dart';

class StartupHint extends StatelessWidget {
  const StartupHint({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: SizedBox(
      width: 220,
      child: Text(
        "add someone's birthday to get started...",
        textAlign: TextAlign.center,
        style: TextStyle(color: Color.fromRGBO(0, 0, 0, 0.25), fontSize: 20),
      ),
    ));
  }
}
