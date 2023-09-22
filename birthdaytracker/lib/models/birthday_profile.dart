import 'package:birthdaytracker/models/astrologist.dart';

class BirthdayProfile {
  final Astrologist astrologist = Astrologist();
  final List<String> months = List.from([
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ]);

  String name;
  int month;
  int day;
  int year = 0;
  int key;

  bool includesYear = false;

  BirthdayProfile(this.key, this.name, this.month, this.day);

  void setYear(int birthdayYear) {
    includesYear = true;
    year = birthdayYear;
  }

  String getZodiacSign() {
    return astrologist.getSign(month, day);
  }

  int getAge() {
    if (includesYear) {
      int currentYear = DateTime.now().year;
      int yearsOld = currentYear - year;

      if (birthdayHasPassed() == false) {
        if (birthdayIsToday() == false) {
          yearsOld -= 1;
        }
      }

      return yearsOld;
    }

    return 0;
  }

  bool birthdayIsToday() {
    DateTime present = DateTime.now();
    return (month == present.month) && (day == present.day);
  }

  bool birthdayHasPassed() {
    if (month < DateTime.now().month) {
      return true;
    }
    if (month > DateTime.now().month) {
      return false;
    }

    return (day < DateTime.now().day);
  }

  String getBirthdayString() {
    String dayAndMonth = "${getSuffixedNum(day)} ${months[month - 1]}";

    if (includesYear) {
      return "$dayAndMonth, $year";
    }

    return dayAndMonth;
  }

  String getSuffixedNum(int number) {
    switch (number) {
      case 1:
      case 21:
      case 31:
        {
          return "${number}st";
        }
      case 2:
      case 22:
        {
          return "${number}nd";
        }
      case 3:
      case 23:
        {
          return "${number}rd";
        }
    }

    return "${number}th";
  }
}
