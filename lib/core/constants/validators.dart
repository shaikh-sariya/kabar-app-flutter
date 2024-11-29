import 'package:news_app/core/constants/imports.dart';

class AppValidators {
  AppValidators._();

  // Email Validation
  static bool validateEmail(String email) {
    const pattern = r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$';
    final regex = RegExp(pattern);
    return regex.hasMatch(email);
  }

  // Strong Password Validation
  static bool validateStrongPassword(String password) {
    const pattern =
        r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$';
    final regex = RegExp(pattern);
    return regex.hasMatch(password);
  }

  // Name Validation
  static bool validateName(String name) {
    const pattern = r'^[a-zA-Z\s\-]{2,}$';
    final regex = RegExp(pattern);
    return regex.hasMatch(name);
  }

  // Username Validation
  static bool validateUsername(String username) {
    // Ensure the username is at least 3 characters long
    if (username.length < 3) {
      return false;
    }
    // Ensure the first character is a letter or number
    if (!RegExp('^[a-zA-Z0-9]').hasMatch(username)) {
      return false;
    }
    // Count valid alphanumeric characters (letters and digits)
    final validCharsCount = RegExp('[a-zA-Z0-9]').allMatches(username).length;
    // Ensure at least 2 alphanumeric characters
    return validCharsCount >= 2;
  }
}

class FirstLetterUppercaseFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    return TextEditingValue(
      text: newValue.text.isEmpty
          ? ''
          : newValue.text.split(' ').map((word) {
              if (word.isNotEmpty) {
                return word[0].toUpperCase() + word.substring(1);
              } else {
                return '';
              }
            }).join(' '),
      selection: newValue.selection,
    );
  }
}

class UsernameInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // Allow only valid characters: letters, numbers, '.', '_'
    final filteredText = newValue.text.replaceAll(RegExp('[^a-zA-Z0-9._]'), '');

    // Ensure the first character is not a symbol
    final finalText = (filteredText.isNotEmpty &&
            !RegExp('^[a-zA-Z0-9]').hasMatch(filteredText[0]))
        ? oldValue.text // Revert to old value if the first character is invalid
        : filteredText;

    return TextEditingValue(
      text: finalText,
      selection: newValue.selection.copyWith(
        baseOffset: finalText.length,
        extentOffset: finalText.length,
      ),
    );
  }
}

class NameInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    var formattedText = newValue.text.trimLeft();

    formattedText = formattedText.replaceAll(RegExp(r'\s{2,}'), ' ');

    if (formattedText.isNotEmpty && formattedText[0] == ' ') {
      formattedText = oldValue
          .text; // Revert to previous value if first character is a space
    }

    return TextEditingValue(
      text: formattedText,
      selection: newValue.selection.copyWith(
        baseOffset: formattedText.length,
        extentOffset: formattedText.length,
      ),
    );
  }
}
