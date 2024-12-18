import 'package:flutter/material.dart';

void main() {
  runApp(PasswordInput());
}

class PasswordInput extends StatefulWidget {
  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Démo state",
      home: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                obscureText: !_isVisible,
                decoration: InputDecoration(labelText: "Mot de passe"),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(_isVisible ? Icons.lock_open : Icons.lock),
                Switch(
                    value: _isVisible,
                    onChanged: (switchValue) {
                      setState(() {
                        _isVisible = switchValue;
                      });
                    })
              ],
            )
          ],
        ),
      ),
    );
  }
}
