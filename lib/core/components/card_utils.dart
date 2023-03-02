import 'package:awesome_card/awesome_card.dart';
import 'package:flutter/material.dart';

class PaymentCard {
  CardType? type;
  String? number;
  String? name;
  int? month;
  int? year;
  int? cvv;

  PaymentCard({
    this.type,
    this.number,
    this.name,
    this.month,
    this.year,
    this.cvv,
  });

  @override
  String toString() {
    return '[Type: $type, Number: $number, Name: $name, Month: $month, Year: $year, CVV: $cvv]';
  }
}

class CardUtils {
  static String? validateCVV(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a CVV code';
    }
    if (value.length < 3 || value.length > 4) {
      return 'Please enter a valid CVV code';
    }
    return null;
  }

  static String? validateDate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a card expiry date';
    }

    int year;
    int month;

    /// The value containes a forward slash if the month and year has been
    /// entered
    if (value.contains(RegExp(r'(/)'))) {
      var split = value.split(RegExp(r'(/)'));

      /// The value before the slash is the month while the value
      /// to right of it is year
      month = int.parse(split[0]);
      year = int.parse(split[1]);
    } else {
      //only the month was entered
      month = int.parse(value.substring(0, (value.length)));
      year = -1;
    }

    if ((month < 1) || (month > 12)) {
      return 'Expiry month is valid';
    }

    var fourDigitsYear = convertYearTo4Digits(year);
    if ((fourDigitsYear < 1) || (fourDigitsYear > 2099)) {
      //We are assuming a valid should be between 1 and 2099
      return 'Expity year is invalid';
    }

    if (!hasDateExpired(month, year)) {
      return 'Card has expired';
    }
    return null;
  }

  static int convertYearTo4Digits(int year) {
    if (year < 100 && year >= 0) {
      var now = DateTime.now();
      String currentYear = now.year.toString();
      String prefix = currentYear.substring(0, (currentYear.length - 2));
      year = int.parse('$prefix${year.toString().padLeft(2, '0')}');
    }
    return year;
  }

  static bool hasDateExpired(int month, int year) {
    return isNotExpired(year, month);
  }

  static bool isNotExpired(int year, int month) {
    //It has not expired of both the year and date has not passed
    return !hasYearPassed(year) && !hasMonthPassed(year, month);
  }

  static List<int> getExpiryDate(String value) {
    var split = value.split(RegExp(r'/'));
    return [int.parse(split[0]), int.parse(split[1])];
  }

  static bool hasMonthPassed(int year, int month) {
    var now = DateTime.now();

    /// The month has passed if:
    /// 1.The year in the past. In this case, we just assume that the
    /// month has passed.
    /// 2.Card's month (plus another month) is more than current month.
    return hasYearPassed(year) ||
        convertYearTo4Digits(year) == now.year && (month < now.month + 1);
  }

  static bool hasYearPassed(int year) {
    int fourDigitsYear = convertYearTo4Digits(year);
    var now = DateTime.now();
    // The year has passed if the year we are currnetly is more than
    // card's year
    return fourDigitsYear < now.year;
  }

  static String getCleanedNumber(String text) {
    RegExp regExp = RegExp(r"[^0-9]");
    return text.replaceAll(regExp, '');
  }

  static Widget? getCardIcon(CardType? cardType) {
    String img = "";
    Icon? icon;
    switch (cardType) {
      case CardType.masterCard:
        img = 'mastercard.png';
        break;
      case CardType.visa:
        img = 'visa.png';
        break;
      case CardType.americanExpress:
        img = 'AmericanExpress.png';
        break;
      case CardType.dinersClub:
        img = 'dinnersclub.png';
        break;
      case CardType.discover:
        img = 'discover.png';
        break;
      case CardType.elo:
        img = 'elo.png';
        break;
      case CardType.jcb:
        img = 'jcb.png';
        break;
      case CardType.maestro:
        img = 'maestro.png';
        break;
      case CardType.rupay:
        img = 'rupay.png';
        break;
      case CardType.other:
        icon = const Icon(
          Icons.credit_card,
          size: 24.0,
          color: Color(0xFFB8B5C3),
        );
        break;
      default:
        icon = const Icon(
          Icons.warning,
          size: 24.0,
          color: Color(0xFFB8B5C3),
        );
    }

    Widget? widget;
    if (img.isNotEmpty) {
      widget = Image.asset(
        'assets/images/credit/$img',
        width: 40,
      );
    } else {
      widget = icon;
    }
    return widget;
  }

  // Validating credit card numbers can be done
  // using the Luhn algorithm
  // https://en.wikipedia.org//wiki/Luhn_algorithm
  static String? validateCardNumber(String? input) {
    if (input == null || input.isEmpty) {
      return 'Please enter a card number';
    }

    input = getCleanedNumber(input);
    if (input.length < 8) {
      return 'Numbers is not valid';
    }

    int sum = 0;
    int length = input.length;
    for (var i = 0; i < length; i++) {
      // Get digits in reverse order
      int digit = int.parse(input[length - i - 1]);

      // Every 2nd number multiply with 2
      if (i % 2 == 1) {
        digit *= 2;
      }
      sum += digit > 9 ? (digit - 9) : digit;
    }

    if (sum % 10 == 0) {
      return null;
    }

    return 'Numbers is not valid';
  }

  static CardType getCardTypeFromNumber(String input) {
    CardType cardType;
    if (input.startsWith(RegExp(
        r'((5[1-5])|(222[1-9]|22[3-9][0-9]|2[3-6][0-9]{2}|27[01][0-9]|2720))'))) {
      cardType = CardType.masterCard;
    } else if (input.startsWith(RegExp(r'[4]'))) {
      cardType = CardType.visa;
    } else if (input.startsWith(RegExp(r'((34)|(37))'))) {
      cardType = CardType.americanExpress;
    } else if (input.startsWith(RegExp(r'((6[45])|(6011))'))) {
      cardType = CardType.discover;
    } else if (input.startsWith(RegExp(r'((30[0-5])|(3[89])|(36)|(3095))'))) {
      cardType = CardType.dinersClub;
    } else if (input.startsWith(RegExp(r'(352[89]|35[3-8][0-9])'))) {
      cardType = CardType.jcb;
    } else if (input.length <= 8) {
      cardType = CardType.other;
    } else {
      cardType = CardType.other;
    }
    return cardType;
  }
}
