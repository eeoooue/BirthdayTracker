import 'package:flutter/material.dart';

class BdayBarName extends StatelessWidget {
  final String name;

  BdayBarName(this.name, {super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.all(16),
      child: Text(
        name,
        style: TextStyle(fontSize: 18),
      ),
    ));
  }
}
