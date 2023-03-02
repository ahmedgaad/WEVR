import 'package:flutter/services.dart';

class CardNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    String inputData = newValue.text;
    StringBuffer buffer = StringBuffer();

    for (var i = 0; i < inputData.length; i++) {
      buffer.write(inputData[i]);
      int index = i + 1;

      if (index % 4 == 0 && inputData.length != index) {
        buffer.write("  "); //double space
      }
    }
    return TextEditingValue(
        text: buffer.toString(),
        selection: TextSelection.collapsed(
          offset: buffer.toString().length,
        ));
  }
}

class CardMonthInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    var newText = newValue.text;
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    var buffer = StringBuffer();
    for (int i = 0; i < newText.length; i++) {
      buffer.write(newText[i]);
      var nonZeroIndex = i + 1;

      if (nonZeroIndex % 2 == 0 && nonZeroIndex != newText.length) {
        buffer.write('/');
      }
    }

    var string = buffer.toString();
    return newValue.copyWith(
      text: string,
      selection: TextSelection.collapsed(
        offset: string.length,
      ),
    );
  }
}

// class CardMonthInputFormatter extends TextInputFormatter {
//   @override
//   TextEditingValue formatEditUpdate(
//       TextEditingValue oldValue, TextEditingValue newValue) {
//     var newText = newValue.text;
//     if (newText.isEmpty) {
//       return newValue;
//     }

//     var buffer = StringBuffer();

//     // Add the first two characters to the buffer
//     if (newText.length >= 1) {
//       buffer.write(newText[0]);
//     }
//     if (newText.length >= 2) {
//       buffer.write(newText[1]);
//     }

//     // Add a slash if the string is long enough
//     if (newText.length >= 3) {
//       buffer.write('/');
//     }

//     // Add the rest of the characters to the buffer
//     if (newText.length >= 3) {
//       buffer.write(newText.substring(2, newText.length));
//     }

//     var string = buffer.toString();
//     return newValue.copyWith(
//       text: string,
//       selection: TextSelection.collapsed(offset: string.length),
//     );
//   }
// }
