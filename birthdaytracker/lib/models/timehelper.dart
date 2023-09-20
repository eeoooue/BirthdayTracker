import 'package:birthdaytracker/models/profilestore.dart';

import 'birthdayprofile.dart';

class TimeHelper {
  final ProfileStore store = ProfileStore();

  bool birthdayHasPassed(BirthdayProfile profile) {
    if (profile.month < DateTime.now().month) {
      return true;
    }
    if (profile.month > DateTime.now().month) {
      return false;
    }

    return (profile.day < DateTime.now().day);
  }

  List<BirthdayProfile> getClosestBirthdays() {
    List<BirthdayProfile> birthdays = store.getChronologicalOrdering();
    int j = getNextBirthdayIndex(birthdays);
    int n = birthdays.length;

    List<BirthdayProfile> closest = List.empty(growable: true);
    for (int i = j; i < n; i++) {
      closest.add(birthdays[i]);
    }
    for (int i = 0; i < j; i++) {
      closest.add(birthdays[i]);
    }

    return closest;
  }

  int getNextBirthdayIndex(List<BirthdayProfile> birthdays) {
    int n = birthdays.length;

    for (int i = 0; i < n; i++) {
      if (birthdayHasPassed(birthdays[i])) {
        continue;
      }
      return i;
    }
    return 0;
  }
}
