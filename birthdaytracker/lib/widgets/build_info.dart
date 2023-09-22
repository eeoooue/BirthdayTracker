import 'package:flutter/material.dart';

class BuildInfo extends StatelessWidget {
  final String version;

  const BuildInfo(this.version, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(children: [
        Text(
          "BirthdayTracker ${version}",
          style: const TextStyle(fontSize: 20, color: Colors.black54),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "@eeoooue",
            style: TextStyle(fontSize: 16, color: Colors.black54),
          ),
        )
      ]),
    );
  }
}
