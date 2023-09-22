import 'dart:collection';
import 'package:birthdaytracker/models/profile_store.dart';
import 'package:birthdaytracker/widgets/directory_elements.dart';
import '../models/birthday_profile.dart';

class ProfileDirectory {
  static List<DirectoryElement> getElements() {
    List<DirectoryElement> elements = List.empty(growable: true);
    ProfileStore store = ProfileStore();
    HashSet<String> seen = HashSet();

    bool includeSectionMarkers = true;

    for (BirthdayProfile profile in store.getAlphabeticalOrdering()) {
      String firstChar = profile.name[0].toUpperCase();
      if (!seen.contains(firstChar)) {
        if (includeSectionMarkers) {
          elements.add(DirectorySectionMarker(firstChar));
        }

        seen.add(firstChar);
      }
      elements.add(DirectoryProfile(profile));
    }

    return elements;
  }
}
