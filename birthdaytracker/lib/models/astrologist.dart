class Astrologist {
  String getSign(int month, int day) {
    if (isAries(month, day)) {
      return "Aries";
    }

    if (isTaurus(month, day)) {
      return "Taurus";
    }

    if (isGemini(month, day)) {
      return "Gemini";
    }

    if (isCancer(month, day)) {
      return "Cancer";
    }

    if (isLeo(month, day)) {
      return "Leo";
    }

    if (isVirgo(month, day)) {
      return "Virgo";
    }

    if (isLibra(month, day)) {
      return "Libra";
    }

    if (isScorpio(month, day)) {
      return "Scorpio";
    }

    if (isSagittarius(month, day)) {
      return "Sagittarius";
    }

    if (isCapricorn(month, day)) {
      return "Capricorn";
    }

    if (isAquarius(month, day)) {
      return "Aquarius";
    }

    if (isPisces(month, day)) {
      return "Pisces";
    }

    return "Unsure";
  }

  bool inStartMonth(int startMonth, int startDay, int month, int day) {
    return (month == startMonth && day >= startDay);
  }

  bool inEndMonth(int endMonth, int endDay, int month, int day) {
    return (month == endMonth && day <= endDay);
  }

  bool isAries(int month, int day) {
    return (inStartMonth(3, 21, month, day) || inEndMonth(4, 19, month, day));
  }

  bool isTaurus(int month, int day) {
    return (inStartMonth(4, 20, month, day) || inEndMonth(5, 20, month, day));
  }

  bool isGemini(int month, int day) {
    return (inStartMonth(5, 21, month, day) || inEndMonth(6, 20, month, day));
  }

  bool isCancer(int month, int day) {
    return (inStartMonth(6, 21, month, day) || inEndMonth(7, 22, month, day));
  }

  bool isLeo(int month, int day) {
    return (inStartMonth(7, 23, month, day) || inEndMonth(8, 22, month, day));
  }

  bool isVirgo(int month, int day) {
    return (inStartMonth(8, 23, month, day) || inEndMonth(9, 22, month, day));
  }

  bool isLibra(int month, int day) {
    return (inStartMonth(9, 23, month, day) || inEndMonth(10, 22, month, day));
  }

  bool isScorpio(int month, int day) {
    return (inStartMonth(10, 23, month, day) || inEndMonth(11, 21, month, day));
  }

  bool isSagittarius(int month, int day) {
    return (inStartMonth(11, 22, month, day) || inEndMonth(12, 21, month, day));
  }

  bool isCapricorn(int month, int day) {
    return (inStartMonth(12, 22, month, day) || inEndMonth(1, 19, month, day));
  }

  bool isAquarius(int month, int day) {
    return (inStartMonth(1, 20, month, day) || inEndMonth(2, 18, month, day));
  }

  bool isPisces(int month, int day) {
    return (inStartMonth(2, 19, month, day) || inEndMonth(3, 20, month, day));
  }
}
