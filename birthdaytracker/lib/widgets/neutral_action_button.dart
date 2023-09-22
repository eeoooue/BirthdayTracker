import 'package:flutter/material.dart';

class NeutralActionButton extends StatelessWidget {
  final String buttonText;
  final Function myFunction;

  const NeutralActionButton(this.buttonText, this.myFunction, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: MaterialButton(
        onPressed: () {
          myFunction();
        },
        color: Colors.grey[200],
        child: Text(buttonText),
      ),
    );
  }
}
