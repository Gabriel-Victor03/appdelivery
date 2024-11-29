import 'package:flutter/material.dart';

class MyCardsPopup extends StatefulWidget {
  final Map<String, String> product;
  final int counterHamburguer;
  final int counterBebidas;

  MyCardsPopup({
    required this.product,
    required this.counterHamburguer,
    required this.counterBebidas,
  });

  @override
  _MyCardsPopupState createState() => _MyCardsPopupState();
}

class _MyCardsPopupState extends State<MyCardsPopup> {
  late int _counterHamburguer;
  late int _counterBebidas;

  @override
  void initState() {
    super.initState();
    _counterHamburguer = widget.counterHamburguer;
    _counterBebidas = widget.counterBebidas;
  }

  void _incrementCounterHamburguer() {
    setState(() {
      _counterHamburguer++;
    });
  }

  void _incrementCounterBebidas() {
    setState(() {
      _counterBebidas++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product['title']!),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset(
              widget.product['image']!,
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20),
            Text(
              widget.product['description']!,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              widget.product['preco']!,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text('Quantidade de Hambúrgueres: $_counterHamburguer'),
            ElevatedButton(
              onPressed: _incrementCounterHamburguer,
              child: Text('Adicionar Hambúrguer'),
            ),
            SizedBox(height: 20),
            Text('Quantidade de Bebidas: $_counterBebidas'),
            ElevatedButton(
              onPressed: _incrementCounterBebidas,
              child: Text('Adicionar Bebida'),
            ),
          ],
        ),
      ),
    );
  }
}
