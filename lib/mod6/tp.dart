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
          title: "TP Calcul panier produit",
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
      body: ArticleList(),
    );
  }
}

class ArticleList extends StatefulWidget{
  const ArticleList({super.key});


  @override
  State<ArticleList> createState() => _ArticleListState();
}

class _ArticleListState extends State<ArticleList> {

  double total = 0;

  void updateTotal(double price){
    setState(() {
      total += price;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ArticleItem(name: "Chocolat", price: 1, totalItems: updateTotal),
        ArticleItem(name: "Eponge", price: 2.5, totalItems: updateTotal),
        ArticleItem(name: "Ordinateur quantique", price: 1500, totalItems: updateTotal),
        ArticleItem(name: "T-Shirt", price: 15.45, totalItems: updateTotal),
        Text("Total du panier  = $total")
      ],
    );
  }
}

class ArticleItem extends StatefulWidget {
  final String name;
  final double price;
  final Function(double) totalItems;

  const ArticleItem({super.key, required this.name, required this.price, required this.totalItems});

  @override
  State<ArticleItem> createState() => _ArticleItemState();
}

class _ArticleItemState extends State<ArticleItem> {
  int quantity = 0;

  void addArticle() {
    setState(() {
      quantity++;
      widget.totalItems(widget.price);
    });

  }

  void removeArticle() {
    setState(() {
      if(quantity > 0){
        quantity--;
        widget.totalItems(-widget.price);
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(widget.name),
        Text("${widget.price} €"),
        IconButton(onPressed: addArticle, icon: Icon(Icons.add), color: Colors.blueAccent),
        Text("$quantity"),
        IconButton(onPressed: removeArticle, icon: Icon(Icons.remove), color: Colors.redAccent),
        Text("Total = ${quantity * widget.price}")
      ],
    );
  }
}
