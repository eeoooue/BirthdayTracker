import 'package:flutter/material.dart';

class NegativeActionButton extends StatelessWidget {
  final String buttonText;
  final Function myFunction;

  NegativeActionButton(this.buttonText, this.myFunction);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: MaterialButton(
        onPressed: () {
          myFunction();
        },
        child: Text(buttonText),
        color: Colors.grey[200],
        textColor: Colors.red,
      ),
    );
  }
}
