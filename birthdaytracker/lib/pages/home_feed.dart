import 'package:birthdaytracker/models/dialog_bank.dart';
import 'package:birthdaytracker/models/hive_helper.dart';
import 'package:birthdaytracker/models/nav_helper.dart';
import 'package:birthdaytracker/models/profile_directory.dart';
import 'package:birthdaytracker/widgets/directory_elements.dart';
import 'package:birthdaytracker/widgets/my_app_bar.dart';
import 'package:birthdaytracker/widgets/negative_action_button.dart';
import 'package:birthdaytracker/widgets/neutral_action_button.dart';
import 'package:birthdaytracker/widgets/positive_action_button.dart';
import 'package:flutter/material.dart';
import '../models/time_helper.dart';
import '../models/birthday_profile.dart';
import '../widgets/birthday_profile_bar.dart';
import '../widgets/current_date_banner.dart';

class HomeFeed extends StatefulWidget {
  const HomeFeed({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomeFeedState();
  }
}

class _HomeFeedState extends State<HomeFeed> {
  final List<BirthdayProfile> profiles = TimeHelper().getClosestBirthdays();
  final NavigationHelper navHelper = NavigationHelper();
  final DialogBank dialogBank = DialogBank();

  int pageIndex = 0;
  Widget activePageBody = Container();
  bool showFloatingBtn = false;

  _HomeFeedState() {
    activePageBody = getHomeBody();
  }

  void _navigateBottomBar(int index) {
    pageIndex = index;

    setState(() {
      showFloatingBtn = false;

      switch (pageIndex) {
        case 1:
          {
            showFloatingBtn = true;
            activePageBody = getDirectoryBody();
          }
        case 2:
          {
            activePageBody = getSettingsBody();
          }
        default:
          {
            activePageBody = getHomeBody();
          }
      }
    });
  }

  void _confirmClearData() {
    List<Widget> buttons = List.empty(growable: true);
    buttons.add(NegativeActionButton("Confirm", _clearData));
    buttons.add(NeutralActionButton("Cancel", _cancelDeletion));

    showDialog(
        context: context,
        builder: (context) {
          return dialogBank.getDialog(
            "Confirm Deletion",
            "Permanently erase all profiles?",
            buttons,
          );
        });
  }

  void _showClearDataSuccessDialog() {
    List<Widget> buttons = List.empty(growable: true);
    buttons.add(PositiveActionButton("Okay", _navigateHome));

    showDialog(
        context: context,
        builder: (context) {
          return dialogBank.getDialog(
            "Success",
            "All profiles erased.",
            buttons,
          );
        });
  }

  void _navigateHome() {
    while (Navigator.canPop(context)) {
      Navigator.pop(context);
    }

    _navigateBottomBar(0);
  }

  void _cancelDeletion() {
    Navigator.pop(context);
  }

  void _clearData() {
    HiveHelper.clearData();
    Navigator.pop(context);
    _showClearDataSuccessDialog();
  }

  Widget getHomeBody() {
    return Column(children: [
      const CurrentDateBanner(),
      Expanded(
          child: ClipRect(
        child: ListView.builder(
            itemCount: profiles.length,
            itemBuilder: (context, index) {
              return BirthdayProfileBar(profiles[index]);
            }),
      ))
    ]);
  }

  Widget getDirectoryBody() {
    List<DirectoryElement> elements = ProfileDirectory.getElements();

    return Column(children: [
      Expanded(
          child: ListView.builder(
              itemCount: elements.length,
              itemBuilder: (context, index) {
                return elements[index];
              }))
    ]);
  }

  Widget getSettingsBody() {
    return Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [NeutralActionButton("Clear Data", _confirmClearData)]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      backgroundColor: Colors.grey[300],
      floatingActionButton: Visibility(
        visible: showFloatingBtn,
        child: SizedBox(
          height: 100,
          width: 100,
          child: FittedBox(
            child: FloatingActionButton(
                backgroundColor: const Color.fromRGBO(155, 80, 148, 1),
                onPressed: () {
                  navHelper.addProfile(context);
                },
                child: const Icon(Icons.add)),
          ),
        ),
      ),
      bottomNavigationBar:
          navHelper.getBottomNav(_navigateBottomBar, pageIndex),
      body: activePageBody,
    );
  }
}
