import 'package:flutter/material.dart';
import 'date_box_day.dart';
import 'date_box_month.dart';

class BdayBarDateBox extends StatelessWidget {
  final int month;
  final int day;

  const BdayBarDateBox(this.month, this.day, {super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Container(
      height: 80,
      width: 80,
      color: Colors.black38,
      child: Column(children: [DateBoxMonth(month), DateBoxDay(day)]),
    );
  }
}