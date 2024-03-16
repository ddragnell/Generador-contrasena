/*import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter/services.dart';
import 'package:flutter_application_5/models/password.dart';

class PasswordCustomizationScreen extends StatefulWidget {
  const PasswordCustomizationScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PasswordCustomizationScreenState createState() =>
      _PasswordCustomizationScreenState();
}

class _PasswordCustomizationScreenState
    extends State<PasswordCustomizationScreen> {
  int passwordLength = 12;
  bool hasUppercase = true;
  bool hasLowercase = true;
  bool hasNumbers = true;
  bool hasSymbols = true;
  String constrain = '';
  String password = '';

  String generatePassword() {
    const String upperCaseLetters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    const String lowerCaseLetters = 'abcdefghijklmnopqrstuvwxyz';
    const String numbers = '0123456789';
    const String symbols = '!@#%^&*()-_=+{}[]|;:,.<>?°~/¿¡¬';

    String chars = '';
    if (hasUppercase) chars += upperCaseLetters;
    if (hasLowercase) chars += lowerCaseLetters;
    if (hasNumbers) chars += numbers;
    if (hasSymbols) chars += symbols;

    return List.generate(passwordLength, (index) {
      final int randomIndex = Random.secure().nextInt(chars.length);
      return chars[randomIndex];
    }).join('');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Generador de contraseñas'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Slider(
              value: passwordLength.toDouble(),
              min: 8,
              max: 50,
              divisions: 42,
              label: passwordLength.toString(),
              onChanged: (double value) {
                setState(() {
                  passwordLength = value.toInt();
                  password = generatePassword();
                });
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                        readOnly: true,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        controller: TextEditingController(text: password)),
                  ),
                  IconButton(
                    icon: const Icon(Icons.content_copy),
                    onPressed: () {
                      copiar(generatePassword());
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.refresh),
                    onPressed: () {
                      setState(() {
                        password = generatePassword();
                      });
                    }, 
                  ),
                ],
              ),
            ),
            RadioListTile(
              title: const Text("Fácil de decir"),
              value: 'tipo1',
              groupValue: constrain,
              onChanged: (value) {
                setState(() {
                  constrain = value.toString();
                  hasUppercase = true;
                  hasLowercase = true;
                  hasNumbers = false;
                  hasSymbols = false;
                  password = generatePassword();
                });
              },
            ),
            RadioListTile(
              title: const Text("Todos los caracteres"),
              value: 'tipo2',
              groupValue: constrain,
              onChanged: (value) {
                setState(() {
                  constrain = value.toString();
                  hasUppercase = true;
                  hasLowercase = true;
                  hasNumbers = true;
                  hasSymbols = true;
                  password = generatePassword();
                });
              },
            ),
            CheckboxListTile(
              title: const Text('Mayúsculas'),
              value: hasUppercase,
              onChanged: (bool? value) {
                setState(() {
                  hasUppercase = value ?? false;
                  password = generatePassword();
                });
              },
            ),
            CheckboxListTile(
              title: const Text('Minúsculas'),
              value: hasLowercase,
              onChanged: (bool? value) {
                setState(() {
                  hasLowercase = value ?? false;
                  password = generatePassword();
                });
              },
            ),
            CheckboxListTile(
              title: const Text('Números'),
              value: hasNumbers,
              onChanged: (bool? value) {
                setState(() {
                  hasNumbers = value ?? false;
                  password = generatePassword();
                });
              },
            ),
            CheckboxListTile(
              title: const Text('Símbolos'),
              value: hasSymbols,
              onChanged: (bool? value) {
                setState(() {
                  hasSymbols = value ?? false;
                  password = generatePassword();
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  void copiar(String text) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Contraseña copiada al portapapeles')),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: PasswordCustomizationScreen(),
  ));
}
*/