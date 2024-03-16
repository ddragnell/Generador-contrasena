import 'package:flutter/material.dart';
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
  int passwordLength = 8;
  bool isEasyToSay = false;
  bool isEasyToRead = false;
  bool hasUppercase = true;
  bool hasLowercase = true;
  bool hasNumbers = true;
  bool hasSymbols = true;
  String constrain = '';
  String password = '';

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
                  password = _generatePassword();
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
                      copiar(_generatePassword());
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.refresh),
                    onPressed: () {
                      setState(() {
                        password = _generatePassword();
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
                  password = _generatePassword();
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
                  password = _generatePassword();
                });
              },
            ),
            CheckboxListTile(
              title: const Text('Mayúsculas'),
              value: hasUppercase,
              onChanged: (bool? value) {
                setState(() {
                  hasUppercase = value ?? false;
                  password = _generatePassword();
                });
              },
            ),
            CheckboxListTile(
              title: const Text('Minúsculas'),
              value: hasLowercase,
              onChanged: (bool? value) {
                setState(() {
                  hasLowercase = value ?? false;
                  password = _generatePassword();
                });
              },
            ),
            CheckboxListTile(
              title: const Text('Números'),
              value: hasNumbers,
              onChanged: (bool? value) {
                setState(() {
                  hasNumbers = value ?? false;
                  password = _generatePassword();
                });
              },
            ),
            CheckboxListTile(
              title: const Text('Símbolos'),
              value: hasSymbols,
              onChanged: (bool? value) {
                setState(() {
                  hasSymbols = value ?? false;
                  password = _generatePassword();
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  String _generatePassword() {
    return generatePassword(
      hasUppercase: hasUppercase,
      hasLowercase: hasLowercase,
      hasNumbers: hasNumbers,
      hasSymbols: hasSymbols,
      passwordLength: passwordLength,
    );
  }

  void copiar(String text) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Contraseña copiada al portapapeles')),
    );
  }
}
