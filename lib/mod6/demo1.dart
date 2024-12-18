import 'package:flutter/material.dart';

void main() {
  runApp(PasswordInput());
}

class PasswordInput extends StatefulWidget {
  const PasswordInput({super.key});

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool _isVisible = false;

  void toggleVisibility(bool switchValue) {
    setState(() {
      _isVisible = switchValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Démo state - password visibility",
        home: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextField(
                  obscureText: !_isVisible,
                  decoration: InputDecoration(labelText: "Mot de passe ?"),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(_isVisible ? Icons.lock_open : Icons.lock),
                    Switch(value: _isVisible, onChanged: toggleVisibility)
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
