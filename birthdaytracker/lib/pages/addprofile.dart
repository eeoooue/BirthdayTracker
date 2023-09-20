import 'package:birthdaytracker/models/hive_helper.dart';
import 'package:birthdaytracker/models/nav_helper.dart';
import 'package:flutter/material.dart';
import '../models/birthdayprofile.dart';

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

  void submit() {
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
    navHelper.navigateHome(context);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Add Profile",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: TextField(
              controller: _textController,
              decoration: const InputDecoration(
                  hintText: "Name", border: OutlineInputBorder()),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MaterialButton(
              onPressed: _showDatePicker,
              color: Colors.grey[300],
              child: Text(dateButtonString),
            ),
          ),
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MaterialButton(
                  onPressed: () {
                    submit();
                  },
                  child: Text("Submit"),
                  color: Colors.blue,
                  textColor: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Cancel"),
                  color: Colors.grey[200],
                  textColor: Colors.red,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
