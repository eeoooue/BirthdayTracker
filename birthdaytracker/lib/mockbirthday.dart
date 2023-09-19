import 'package:flutter/material.dart';

class BirthdayProfileBar extends StatelessWidget {
  BirthdayProfileBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      height: 80,
      margin: const EdgeInsets.all(10),
      child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
        BdarBarPicture(),
        BdayBarName(),
        BdayBarDateBox(),
      ]),
    );
  }
}

class BdarBarPicture extends StatelessWidget {
  BdarBarPicture({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 80,
      width: 80,
      child: Center(
          child: Container(
        height: 70,
        width: 70,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100), color: Colors.white),
      )),
    );
  }
}

class BdayBarName extends StatelessWidget {
  BdayBarName({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.all(16),
      child: Text("Person"),
    ));
  }
}

class BdayBarDateBox extends StatelessWidget {
  BdayBarDateBox({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Container(
      height: 80,
      width: 80,
      color: Colors.black38,
      child: Column(children: [DateBoxMonth(), DateBoxDay()]),
    );
  }
}

class DateBoxMonth extends StatelessWidget {
  DateBoxMonth({super.key});

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      flex: 2,
      child: Center(
          child:
              Text("MAR", style: TextStyle(color: Colors.white, fontSize: 16))),
    );
  }
}

class DateBoxDay extends StatelessWidget {
  DateBoxDay({super.key});

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      flex: 3,
      child: Center(
          child: Text(
        "20",
        style: TextStyle(color: Colors.white, fontSize: 28),
      )),
    );
  }
}
