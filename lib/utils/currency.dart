import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class CurrencyFormat extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    // TODO: implement formatEditUpdate
    if(newValue.selection.baseOffset == 0){
      return newValue;
    }
    double value = double.parse(newValue.text);
    final money = NumberFormat("###,###,###", "en_US");

    String newText = money.format(value);
    
    return newValue.copyWith(
      text: newText.replaceAll(",", "."),
      selection: TextSelection.collapsed(offset: newText.length)
    );
  }
}