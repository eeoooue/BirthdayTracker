import 'package:birthdaytracker/models/birthday_profile.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveHelper {
  static final namesBox = Hive.box("names");
  static final bdaysBox = Hive.box("bdays");
  static final picsBox = Hive.box("pictures");
  static int id = 1;

  static int getUnusedKey() {
    while (namesBox.containsKey(id)) {
      id += 1;
    }
    return id;
  }

  static String getImagePath(int key) {
    if (picsBox.containsKey(key)) {
      return picsBox.get(key);
    }
    return '';
  }

  static void clearData() async {
    await namesBox.clear();
    await bdaysBox.clear();
    await picsBox.clear();
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

  static void saveProfile(BirthdayProfile profile) {
    namesBox.put(profile.key, profile.name);
    bdaysBox.put(profile.key, encodeDate(profile));
  }

  static void deleteProfile(BirthdayProfile profile) {
    namesBox.delete(profile.key);
    bdaysBox.delete(profile.key);
    picsBox.delete(profile.key);
  }

  static String encodeDate(BirthdayProfile profile) {
    String days = makeLength("${profile.day}", 2);
    String months = makeLength("${profile.month}", 2);
    String years = "0000";

    if (profile.includesYear) {
      years = makeLength("${profile.year}", 4);
    }

    return "${days}-${months}-${years}";
  }

  static String makeLength(String original, int length) {
    int extra = length - original.length;
    if (extra < 0) {
      throw Exception("attempted to extend oversized string '${original}'");
    }

    String padding = "";
    for (int i = 0; i < extra; i++) {
      padding += "0";
    }

    return padding + original;
  }

  static BirthdayProfile? getProfile(int key) {
    if (namesBox.containsKey(key) && bdaysBox.containsKey(key)) {
      String name = namesBox.get(key);
      String encodedBday = bdaysBox.get(key);
      List<int> timings = interpretDate(encodedBday);
      int days = timings[0];
      int months = timings[1];
      BirthdayProfile profile = BirthdayProfile(key, name, months, days);

      if (includesYear(encodedBday)) {
        int years = timings[2];
        profile.setYear(years);
      }

      return profile;
    }

    return null;
  }

  static void saveImagePath(BirthdayProfile profile, String path) {
    picsBox.put(profile.key, path);
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
