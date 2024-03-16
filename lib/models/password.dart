// password_generator.dart
import 'dart:math';

String generatePassword({
  required bool hasUppercase,
  required bool hasLowercase,
  required bool hasNumbers,
  required bool hasSymbols,
  required int passwordLength,
}) {
  const String upperCaseLetters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  const String lowerCaseLetters = 'abcdefghijklmnopqrstuvwxyz';
  const String numbers = '0123456789';
  const String symbols = '!@#%^&*()-_=+{}[]|;:,.<>?°~/¿¡¬';

  String chars = '';
  if (hasUppercase) chars += upperCaseLetters;
  if (hasLowercase) chars += lowerCaseLetters;
  if (hasNumbers) chars += numbers;
  if (hasSymbols) chars += symbols;

  var password = List.generate(passwordLength, (index) {
    final int randomIndex = Random.secure().nextInt(chars.length);
    return chars[randomIndex];
  }).join('');

  return password;
}
