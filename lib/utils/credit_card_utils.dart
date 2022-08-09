import 'dart:developer';

import 'package:flutter/services.dart';

class CardMonthInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var newText = newValue.text;
    if (newText.length == 5) {
      String yearText = newText.substring(3, 5);
      if (int.parse(yearText) <
              int.parse(DateTime.now().year.toString().substring(2, 4)) ||
          int.parse(yearText) > 12) {
        newText = newText.replaceRange(3, 5,
            '${int.parse(DateTime.now().year.toString().substring(2, 4))}');
        //newText = '0${yearText.substring(1)}';
      }
    } else if (newText.length == 2) {
      if (int.parse(newText) < 0 || int.parse(newText) > 12) {
        newText = '0${newText.substring(1)}';
      }
    }

    if (oldValue.text.length == 4 && newValue.text.length == 3) {
      // 45/9 => 45/ => 45
      String lessSlash = newText.substring(0, 2);
      return newValue.copyWith(
          text: lessSlash,
          selection: TextSelection.collapsed(offset: lessSlash.length));
    } else if (oldValue.text.length == 2 && newValue.text.length == 3) {
      // 45 => 459 => 45/9
      String plusSlash =
          newText.substring(0, 2) + '/' + newText.substring(2, 3);
      return newValue.copyWith(
          text: plusSlash,
          selection: TextSelection.collapsed(offset: plusSlash.length));
    } else if (oldValue.text.length == 1 && newValue.text.length == 2) {
      // 4 => 45 => 45/
      String plusSlash = newText + '/';
      return newValue.copyWith(
          text: plusSlash,
          selection: TextSelection.collapsed(offset: plusSlash.length));
    }
    return newValue.copyWith(
        text: newText,
        selection: TextSelection.collapsed(offset: newText.length));
  }
}
