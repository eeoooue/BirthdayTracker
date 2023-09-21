import 'package:flutter/material.dart';

class BdayBarName extends StatelessWidget {
  final String name;

  const BdayBarName(this.name, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Text(
        name,
        style: const TextStyle(fontSize: 22, color: Colors.black54),
      ),
    );
  }
}
