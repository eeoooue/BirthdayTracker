import 'package:birthdaytracker/models/birthdayprofile.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveHelper {
  static final namesBox = Hive.box("names");
  static final bdaysBox = Hive.box("bdays");
  static int id = 1;

  static int getUnusedKey() {
    while (namesBox.containsKey(id)) {
      id += 1;
    }
    return id;
  }

  static List<BirthdayProfile> getAllProfiles() {
    List<BirthdayProfile> profiles = List.empty(growable: true);

    for (int k in namesBox.keys) {
      BirthdayProfile? profile = getProfile(k);
      if (profile != null) {
        profiles.add(profile);
      }
    }

    return profiles;
  }

  static BirthdayProfile? getProfile(int key) {
    if (namesBox.containsKey(key) && bdaysBox.containsKey(key)) {
      String name = namesBox.get(key);
      String encodedBday = bdaysBox.get(key);

      List<int> timings = interpretDate(encodedBday);

      BirthdayProfile profile =
          BirthdayProfile(key, name, timings[1], timings[0]);

      if (includesYear(encodedBday)) {
        profile.setYear(timings[2]);
      }

      return profile;
    }

    return null;
  }

  static List<int> interpretDate(String encodedBday) {
    List<String> arr = encodedBday.split('-');

    if (arr.length != 3) {
      print("the arr split didn't work");
      throw Exception("the arr split didn't work");
    }

    List<int> result = List.empty(growable: true);
    result.add(int.parse(arr[0]));
    result.add(int.parse(arr[1]));
    result.add(int.parse(arr[2]));
    return result;
  }

  static bool includesYear(String encodedBday) {
    List<String> arr = encodedBday.split('-');

    if (arr.length == 3 && arr[2] != "0000") {
      return true;
    }

    return false;
  }
}
