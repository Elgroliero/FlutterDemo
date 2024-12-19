import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Cat.dart';

class DemoApi extends StatefulWidget {
  @override
  State<DemoApi> createState() => _DemoApiState();
}

class _DemoApiState extends State<DemoApi> {
  Cat? zouzou;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            ElevatedButton(onPressed: () {}, child: Text("GET CAT !")),
            if (zouzou != null)
              Column(
                children: [
                  Image.network(zouzou?.urlImage ?? ''),
                  Row(
                    children: [
                      Text(
                          "Nom = ${zouzou?.id ?? ''}, hauteur = ${zouzou?.height ?? ''}, largeur = ${zouzou?.width ?? ''}"),
                    ],
                  ),
                ],
              )
          ],
        ),
      ),
    );
  }
}
