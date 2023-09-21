import 'package:flutter/material.dart';

class PositiveActionButton extends StatelessWidget {
  final String buttonText;
  final Function myFunction;

  PositiveActionButton(this.buttonText, this.myFunction);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: MaterialButton(
        onPressed: () {
          myFunction();
        },
        child: Text(buttonText),
        color: Colors.blue,
        textColor: Colors.white,
      ),
    );
  }
}
