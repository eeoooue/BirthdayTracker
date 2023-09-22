import 'package:flutter/material.dart';

class DateBoxDay extends StatelessWidget {
  final int day;

  const DateBoxDay(this.day, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      day.toString(),
      style: const TextStyle(color: Colors.white, fontSize: 28),
    ));
  }
}
