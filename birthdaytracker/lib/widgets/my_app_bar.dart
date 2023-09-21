import 'package:flutter/material.dart';

class MyAppBar extends AppBar {
  MyAppBar({super.key})
      : super(
          title: const Center(
            child: Text(
              "BirthdayTracker",
              style: TextStyle(color: Colors.white),
            ),
          ),
          backgroundColor: const Color.fromRGBO(40, 30, 42, 1),
        );
}
