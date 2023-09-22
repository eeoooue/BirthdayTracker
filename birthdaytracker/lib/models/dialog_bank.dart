import 'package:flutter/material.dart';

class DialogBank {
  AlertDialog getDialog(
      String titleText, String contentText, List<Widget> buttons) {
    return AlertDialog(
      alignment: Alignment.center,
      title: Text(titleText, textAlign: TextAlign.center),
      content: Text(contentText, textAlign: TextAlign.center),
      actionsAlignment: MainAxisAlignment.center,
      actions: buttons,
    );
  }
}
