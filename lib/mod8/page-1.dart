import 'package:flutter/material.dart';

class PageOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Page 1")),
      body: Column(
        children: [
          Text('PAGE 1', style: TextStyle(fontSize: 32)),
          ElevatedButton(onPressed: () {
            Navigator.pushNamed(context, '/page-2', arguments: 123);
          }, child: Text('Go to page 2'))
        ],
      ),
    );
  }
}