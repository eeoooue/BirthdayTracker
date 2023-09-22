import 'package:birthdaytracker/models/dialog_bank.dart';
import 'package:birthdaytracker/models/hive_helper.dart';
import 'package:birthdaytracker/models/nav_helper.dart';
import 'package:birthdaytracker/widgets/neutral_action_button.dart';
import 'package:birthdaytracker/widgets/positive_action_button.dart';
import 'package:birthdaytracker/widgets/negative_action_button.dart';
import 'package:flutter/material.dart';
import '../models/birthday_profile.dart';

class AddProfile extends StatefulWidget {
  const AddProfile({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AddProfileState();
  }
}

class _AddProfileState extends State<AddProfile> {
  final NavigationHelper navHelper = NavigationHelper();
  final _textController = TextEditingController();
  final DialogBank dialogBank = DialogBank();

  bool includeYear = false;
  DateTime selectedTime = DateTime.now();
  String dateButtonString = "Select Date";
  bool dateHasChanged = false;

  String getFormattedTime() {
    int month = selectedTime.month;
    int day = selectedTime.day;
    BirthdayProfile profile = BirthdayProfile(-1, "formatting", month, day);

    if (includeYear) {
      profile.setYear(selectedTime.year);
    }

    return profile.getBirthdayString();
  }

  _AddProfileState();

  void checkBoxChanged(bool? value) {
    setState(() {
      includeYear = !includeYear;
      if (dateHasChanged) {
        dateButtonString = getFormattedTime();
      }
    });
  }

  bool canSubmit() {
    if (_textController.text.isEmpty) {
      return false;
    }
    return dateHasChanged;
  }

  void _submit() {
    if (!canSubmit()) {
      return;
    }

    String name = _textController.text;
    int month = selectedTime.month;
    int day = selectedTime.day;
    int key = HiveHelper.getUnusedKey();

    BirthdayProfile profile = BirthdayProfile(key, name, month, day);

    if (includeYear) {
      profile.setYear(selectedTime.year);
    }

    HiveHelper.saveProfile(profile);
    _showSuccessDialog();
  }

  void _navigateHome() {
    navHelper.navigateHome(context);
  }

  void _showSuccessDialog() {
    List<Widget> buttons = List.empty(growable: true);
    buttons.add(PositiveActionButton("Okay", _navigateHome));

    showDialog(
        context: context,
        builder: (context) {
          return dialogBank.getDialog(
            "Success",
            "New profile saved.",
            buttons,
          );
        });
  }

  void _showDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime(DateTime.now().year),
            firstDate: DateTime(1950),
            lastDate: DateTime(2150))
        .then((value) {
      setState(() {
        selectedTime = value!;
        dateHasChanged = true;
        dateButtonString = getFormattedTime();
      });
    });
  }

  void _cancel() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Add Profile",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromRGBO(40, 30, 42, 1),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                controller: _textController,
                decoration: const InputDecoration(
                    hintText: "Name", border: OutlineInputBorder()),
              ),
            ),
            NeutralActionButton(dateButtonString, _showDatePicker),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Include Year?"),
                Checkbox(
                  value: includeYear,
                  onChanged: (value) => checkBoxChanged(value),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PositiveActionButton("Submit", _submit),
                NegativeActionButton("Cancel", _cancel),
              ],
            )
          ],
        ),
      ),
    );
  }
}
