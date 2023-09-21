import 'package:birthdaytracker/models/hive_helper.dart';
import 'package:birthdaytracker/models/nav_helper.dart';
import 'package:birthdaytracker/widgets/negative_action_button.dart';
import 'package:birthdaytracker/widgets/neutral_action_button.dart';
import 'package:birthdaytracker/widgets/positive_action_button.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import '../models/birthday_profile.dart';
import 'package:image_picker/image_picker.dart';

class EditProfile extends StatefulWidget {
  final BirthdayProfile profile;

  const EditProfile(this.profile, {super.key});

  @override
  State<StatefulWidget> createState() {
    return _EditProfileState(profile);
  }
}

class _EditProfileState extends State<EditProfile> {
  final BirthdayProfile profile;
  final NavigationHelper navHelper = NavigationHelper();
  final _textController = TextEditingController();

  DateTime selectedTime = DateTime.now();
  String dateButtonString = "";
  bool dateHasChanged = false;
  bool includesYear = false;

  String photoPath = "";
  String photoButtonText = "Add Photo";
  XFile? profilePhoto;

  _EditProfileState(this.profile) {
    dateButtonString = profile.getBirthdayString();
    includesYear = profile.includesYear;
    _textController.text = profile.name;
  }

  String getFormattedTime() {
    int month = profile.month;
    int day = profile.day;

    if (dateHasChanged) {
      month = selectedTime.month;
      day = selectedTime.day;
    }

    BirthdayProfile temp = BirthdayProfile(-1, "formatting", month, day);

    if (includesYear) {
      if (dateHasChanged) {
        temp.setYear(selectedTime.year);
      } else {
        temp.setYear(profile.year);
      }
    }

    return temp.getBirthdayString();
  }

  void checkBoxChanged(bool? value) {
    setState(() {
      includesYear = !includesYear;
      dateButtonString = getFormattedTime();
    });
  }

  void _cancel() {
    Navigator.pop(context);
  }

  void submitChanges() {
    if (_textController.text.isEmpty) {
      return;
    }

    profile.name = _textController.text;

    if (includesYear) {
      profile.includesYear = true;
    }

    if (dateHasChanged) {
      profile.month = selectedTime.month;
      profile.day = selectedTime.day;
      if (profile.includesYear) {
        profile.setYear(selectedTime.year);
      }
    }

    if (!includesYear) {
      profile.includesYear = false;
    }

    HiveHelper.saveProfile(profile);

    if (profilePhoto != null) {
      savePhoto(profile);
    }

    navHelper.navigateHome(context);
  }

  Future<String> savePhoto(BirthdayProfile profile) async {
    final dir = await getApplicationDocumentsDirectory();
    String dirpath = dir.path;
    String newpath = "${dirpath}/photo_${profile.key}.jpg";

    if (profilePhoto != null) {
      profilePhoto!.saveTo(newpath);
      HiveHelper.saveImagePath(profile, newpath);
    }
    return newpath;
  }

  Future _addPhoto() async {
    profilePhoto = await ImagePicker().pickImage(source: ImageSource.gallery);
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
          "Edit Profile",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Column(
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
          NeutralActionButton(photoButtonText, _addPhoto),
          NeutralActionButton(dateButtonString, _showDatePicker),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Include Year?"),
              Checkbox(
                value: includesYear,
                onChanged: (value) => checkBoxChanged(value),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PositiveActionButton("Save", submitChanges),
              NegativeActionButton("Cancel", _cancel),
            ],
          )
        ],
      ),
    );
  }
}
