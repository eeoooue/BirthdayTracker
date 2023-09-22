import 'package:flutter/material.dart';
import 'date_box_day.dart';
import 'date_box_month.dart';

class BdayBarDateBox extends StatelessWidget {
  final int month;
  final int day;

  const BdayBarDateBox(this.month, this.day, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          height: 72,
          width: 72,
          decoration: const BoxDecoration(boxShadow: [
            BoxShadow(color: Color.fromRGBO(42, 42, 42, 0.6)),
            BoxShadow(color: Color.fromRGBO(155, 80, 148, 0.2)),
            BoxShadow(
                color: Color.fromRGBO(255, 255, 255, 0.75),
                spreadRadius: -5,
                blurRadius: 50)
          ]),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                DateBoxMonth(month),
                DateBoxDay(day),
              ]),
        ),
      ),
    );
  }
}
