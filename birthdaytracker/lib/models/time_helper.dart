import 'package:birthdaytracker/models/profile_store.dart';
import 'birthday_profile.dart';

class TimeHelper {
  final ProfileStore store = ProfileStore();

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
      if (birthdays[i].birthdayHasPassed()) {
        continue;
      }
      return i;
    }
    return 0;
  }
}
