import 'package:flutter/material.dart';

class NegativeActionButton extends StatelessWidget {
  final String buttonText;
  final Function myFunction;

  const NegativeActionButton(this.buttonText, this.myFunction, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: MaterialButton(
        onPressed: () {
          myFunction();
        },
        color: Colors.grey[200],
        textColor: Color.fromRGBO(206, 45, 79, 1),
        child: Text(buttonText),
      ),
    );
  }
}
