import 'package:flutter/material.dart';

class PositiveActionButton extends StatelessWidget {
  final String buttonText;
  final Function myFunction;

  const PositiveActionButton(this.buttonText, this.myFunction, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: MaterialButton(
        onPressed: () {
          myFunction();
        },
        color: Colors.blue,
        textColor: Colors.white,
        child: Text(buttonText),
      ),
    );
  }
}
