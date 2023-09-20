import 'birthdayprofile.dart';

class ProfileStore {
  List<BirthdayProfile> getProfiles() {
    List<BirthdayProfile> profiles = List.empty(growable: true);
    return profiles;
  }

  List<String> getNames() {
    List<String> names = List.empty(growable: true);

    for (BirthdayProfile profile in getProfiles()) {
      names.add(profile.name);
    }
    names.sort();

    return names;
  }

  List<BirthdayProfile> getAlphabeticalOrdering() {
    List<BirthdayProfile> alphabetical = List.empty(growable: true);
    for (BirthdayProfile profile in getProfiles()) {
      alphabetical.add(profile);
    }

    alphabetical.sort(alphabeticalComparison);

    return alphabetical;
  }

  int alphabeticalComparison(BirthdayProfile a, BirthdayProfile b) {
    return a.name.compareTo(b.name);
  }

  List<BirthdayProfile> getChronologicalOrdering() {
    List<BirthdayProfile> chrono = getAlphabeticalOrdering();
    chrono.sort(chronologicalComparison);

    return chrono;
  }

  int chronologicalComparison(BirthdayProfile a, BirthdayProfile b) {
    if (a.month < b.month) {
      return -1;
    }

    if (a.month > b.month) {
      return 1;
    }

    if (a.day < b.day) {
      return -1;
    }

    if (a.day > b.day) {
      return 1;
    }

    return 0;
  }
}
