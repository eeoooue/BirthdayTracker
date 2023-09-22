import 'package:flutter/material.dart';

class DateBoxMonth extends StatelessWidget {
  final int month;
  final List<String> months = List.from([
    "JAN",
    "FEB",
    "MAR",
    "APR",
    "MAY",
    "JUN",
    "JUL",
    "AUG",
    "SEP",
    "OCT",
    "NOV",
    "DEC"
  ]);

  DateBoxMonth(this.month, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(months[month - 1],
            style: const TextStyle(color: Colors.white, fontSize: 16)));
  }
}
