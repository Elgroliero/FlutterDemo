import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Demo Layout',
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.pinkAccent)),
        home: HomePage(
          title: "Démo widget de contenu",
        ));
  }
}

class HomePage extends StatelessWidget {
  String title;

  HomePage({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(children: [
        Text(
          "Hello there !",
          style: TextStyle(
              color: Theme.of(context).colorScheme.inversePrimary,
              fontSize: 32,
              fontWeight: FontWeight.bold),
        ),
        ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.amber)),
            child: Text("Cliquez ici !")),
        OutlinedButton(onPressed: null, child: Text("Cliquez là !")),
        FilledButton(onPressed: null, child: Text("Ou là !")),
        Image.network(
            "https://upload.wikimedia.org/wikipedia/commons/1/17/Google-flutter-logo.png"),
        Image.asset("assets/images/yoda.jpg"),
      ]),
    );
  }
}
