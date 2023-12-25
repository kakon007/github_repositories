class RegXHelper {
  static String addCommaEveryTwoDigits(String? number) {
    RegExp regExp = RegExp(r'(\d{2})');
    Iterable<Match> matches = regExp.allMatches(number ?? "0");

    List<String> chunks = matches.map((match) => match.group(0)!).toList();

    String formattedNumber = chunks.join(',');

    return formattedNumber;
  }
}
