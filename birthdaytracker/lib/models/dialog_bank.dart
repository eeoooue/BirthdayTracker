import 'package:flutter/material.dart';

class DialogBank {
  AlertDialog getDialog(
      String titleText, String contentText, List<Widget> buttons) {
    return AlertDialog(
      alignment: Alignment.center,
      title: const Text(
        "Success",
        textAlign: TextAlign.center,
      ),
      content: const Text(
        "New profile saved.",
        textAlign: TextAlign.center,
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: buttons,
    );
  }
}
