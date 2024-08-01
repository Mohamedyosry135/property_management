import 'package:flutter/services.dart';

class DateInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    final formattedValue = _formatDate(newValue.text);
    return newValue.copyWith(
      text: formattedValue,
      selection: TextSelection.collapsed(offset: formattedValue.length),
    );
  }

  String _formatDate(String value) {
    final cleanValue = value.replaceAll('-', ''); // Remove hyphens from the input
    final buffer = StringBuffer();
    for (var i = 0; i < cleanValue.length; i++) {
      if (i == 4 || i == 6) {
        buffer.write('-'); // Add hyphens at the appropriate positions
      }
      buffer.write(cleanValue[i]);
    }
    return buffer.toString();
  }
}
