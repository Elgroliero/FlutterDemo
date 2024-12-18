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
      body: DemoForm(),
    );
  }
}

class DemoForm extends StatefulWidget {
  const DemoForm({super.key});

  @override
  State<DemoForm> createState() => _DemoFormState();
}

class _DemoFormState extends State<DemoForm> {
  bool isHungry = false;
  String radioValue = "";
  var formKey = GlobalKey<FormState>();

  String name = "";
  int age = 0;
  String bouffe = "";

  void updateRadioValue(String? newValue) {
    setState(() {
      radioValue = newValue!;
    });
  }

  String? validateName(value) {
    if (value == null || value.trim().isEmpty) {
      return "Le nom est obligatoire";
    }
    if (value.length < 3) {
      return "Le nom doit avoir au moins 3 caractères";
    }
    return null;
  }

  String? validateAge(value) {
    if (value == null || value.trim().isEmpty) {
      return "L'âge est obligatoire";
    }
    if (int.parse(value) <= 0) {
      return "L'âge ne peut pas être négatif";
    }
    return null;
  }

  String? validateBouffe(value) {
    if (value == null) {
      return "La bouffe est obligatoire";
    }
    var values = ['raclette', 'fricadelle', 'bdv'];
    if (!values.contains(value)) {
      return "La bouffe doit avoir une valeur parmi raclette, fricadelle ou blanquette de veau";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                onSaved: (value) {
                  if (value != null) {
                    name = value;
                  }
                },
                validator: validateName,
                decoration: InputDecoration(
                    label: Text("Name"), hintText: "Veuillez saisir votre nom"),
              ),
              TextFormField(
                onSaved: (value) {
                  if (value != null) {
                    age = int.parse(value);
                  }
                },
                validator: validateAge,
                decoration: InputDecoration(
                    label: Text("Age"), hintText: "Veuillez saisir votre âge"),
                keyboardType: TextInputType.number,
              ),
              DropdownButtonFormField(
                  onSaved: (value) {
                    if (value != null) {
                      bouffe = value;
                    }
                  },
                  validator: validateBouffe,
                  items: [
                    DropdownMenuItem<String>(
                        value: null,
                        child: Text('-Choisir un plat-')),
                    DropdownMenuItem<String>(
                        value: 'raclette',
                        child: Text('-Raclette-')),
                    DropdownMenuItem<String>(
                        value: 'fricadelle',
                        child: Text('-Fricadelle-')),
                    DropdownMenuItem<String>(
                        value: 'bdv',
                        child: Text('-Blanquette de veau-')),
                  ],
                  onChanged: (value) {}),
              Row(
                children: [
                  Text("T'as faim ?"),
                  Checkbox(
                      value: isHungry,
                      onChanged: (isChecked) {
                        setState(() {
                          isHungry = isChecked!;
                        });
                      }),
                ],
              ),
              Row(
                children: [
                  Radio<String>(
                      value: "sucre",
                      groupValue: radioValue,
                      onChanged: updateRadioValue),
                  Text("Sucré"),
                  Radio<String>(
                    value: "sel",
                    groupValue: radioValue,
                    onChanged: updateRadioValue,
                  ),
                  Text("Salé"),
                ],
              ),
              ElevatedButton(
                  onPressed: () {
                    //déclencher les callbacks de validation -> validator
                    if (formKey.currentState!.validate()) {
                      //déclenche les callbacks de sauvegarde -> onSaved
                      formKey.currentState!.save();
                      print(name);
                      print(age);
                      print(bouffe);
                      //traitement de sdonnées
                    }
                  },
                  child: Text("Commander"))
            ],
          ),
        ));
  }
}
