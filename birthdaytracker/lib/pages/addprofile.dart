import 'package:flutter/material.dart';
import '../models/birthdayprofile.dart';
import '../widgets/profileelements.dart';

class AddProfile extends StatefulWidget {
  const AddProfile({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AddProfileState();
  }
}

class _AddProfileState extends State<AddProfile> {
  final _textController = TextEditingController();

  bool includeYear = false;
  DateTime selectedTime = DateTime(2500);
  String dateButtonString = "Select Date";

  String getFormattedTime() {
    int month = selectedTime.month;
    int day = selectedTime.day;
    BirthdayProfile profile = BirthdayProfile("formatting", month, day);

    return profile.getBirthdayString();
  }

  _AddProfileState();

  void _navigateHome() {
    while (Navigator.canPop(context)) {
      Navigator.pop(context);
    }

    Navigator.popAndPushNamed(context, "/homefeed");
  }

  void checkBoxChanged(bool? value) {
    setState(() {
      includeYear = !includeYear;
    });
  }

  bool canSubmit() {
    if (_textController.text.isEmpty) {
      return false;
    }
    if (selectedTime.year == 2500) {
      return false;
    }
    return true;
  }

  void submit() {
    if (!canSubmit()) {
      return;
    }

    String name = _textController.text;
    int month = selectedTime.month;
    int day = selectedTime.day;

    BirthdayProfile profile = BirthdayProfile(name, month, day);

    if (includeYear) {
      profile.setYear(selectedTime.year);
    }
    print("submitted! '${name}' : ${profile.getBirthdayString()}");
    _navigateHome();
  }

  void _navigateBottomBar(int index) {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    }

    switch (index) {
      case 0:
        {
          Navigator.popAndPushNamed(context, "/homefeed");
        }
      case 1:
        {
          Navigator.popAndPushNamed(context, "/profiledirectory");
        }
    }
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
      bottomNavigationBar:
          BottomNavigationBar(onTap: _navigateBottomBar, items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.people), label: "People"),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
      ]),
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
