import 'birthdayprofile.dart';

class ProfileStore {
  final List<BirthdayProfile> profiles = List.empty(growable: true);

  ProfileStore() {
    populateProfiles();
  }

  void populateProfiles() {
    profiles.add(BirthdayProfile("Sergey Karjakin", 1, 12));
    profiles.add(BirthdayProfile("Veselin Topalov", 3, 15));
    profiles.add(BirthdayProfile("Anatoly Karpov", 5, 23));
    profiles.add(BirthdayProfile("Vladimir Kramnik", 6, 25));
    profiles.add(BirthdayProfile("Judit Polgar", 7, 23));
    profiles.add(BirthdayProfile("Fabiano Caruana", 7, 30));
    profiles.add(BirthdayProfile("Levon Aronian", 10, 6));
    profiles.add(BirthdayProfile("Mikhail Tal", 11, 9));
    profiles.add(BirthdayProfile("Jose Capablanca", 11, 19));
    profiles.add(BirthdayProfile("Magnus Carlsen", 11, 30));
    profiles.add(BirthdayProfile("Hikaru Nakamura", 12, 9));
  }

  List<String> getNames() {
    List<String> names = List.empty(growable: true);

    for (BirthdayProfile profile in profiles) {
      names.add(profile.name);
    }
    names.sort();

    return names;
  }
}
