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
          backgroundColor: Colors.blue,
        );
}
