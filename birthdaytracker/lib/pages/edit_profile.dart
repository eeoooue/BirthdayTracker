import 'package:birthdaytracker/models/dialog_bank.dart';
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
    return _EditProfileState();
  }
}

class _EditProfileState extends State<EditProfile> {
  final NavigationHelper navHelper = NavigationHelper();
  final _textController = TextEditingController();
  final DialogBank dialogBank = DialogBank();

  DateTime selectedTime = DateTime.now();
  String dateButtonString = "";
  bool dateHasChanged = false;
  bool includesYear = false;

  String photoPath = "";
  String photoButtonText = "Add Photo";
  XFile? profilePhoto;

  _EditProfileState() {
    dateButtonString = widget.profile.getBirthdayString();
    includesYear = widget.profile.includesYear;
    _textController.text = widget.profile.name;
  }

  String getFormattedTime() {
    int month = widget.profile.month;
    int day = widget.profile.day;

    if (dateHasChanged) {
      month = selectedTime.month;
      day = selectedTime.day;
    }

    BirthdayProfile temp = BirthdayProfile(-1, "formatting", month, day);

    if (includesYear) {
      if (dateHasChanged) {
        temp.setYear(selectedTime.year);
      } else {
        temp.setYear(widget.profile.year);
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

    widget.profile.name = _textController.text;

    if (includesYear) {
      widget.profile.includesYear = true;
    }

    if (dateHasChanged) {
      widget.profile.month = selectedTime.month;
      widget.profile.day = selectedTime.day;
      if (widget.profile.includesYear) {
        widget.profile.setYear(selectedTime.year);
      }
    }

    if (!includesYear) {
      widget.profile.includesYear = false;
    }

    HiveHelper.saveProfile(widget.profile);

    if (profilePhoto != null) {
      savePhoto(widget.profile);
    }

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
            "Changes saved.",
            buttons,
          );
        });
  }

  Future<String> savePhoto(BirthdayProfile profile) async {
    final dir = await getApplicationDocumentsDirectory();
    String dirpath = dir.path;
    String newpath = "$dirpath/photo_${profile.key}.jpg";

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
      ),
    );
  }
}
