import 'package:flutter/material.dart';

class MyCards extends StatefulWidget {
  @override
  _MyCardsState createState() => _MyCardsState();
}

class _MyCardsState extends State<MyCards> {
  final List<Map<String, String>> products = [
    {
      'title': 'Duplo Burguer',
      'description': 'Carne 180g, queijo, alface e tomate.',
      'image': 'assets/images/burguer1.jpg',
      'preco': 'R\$20,00',
    },
    {
      'title': 'Cheeseburger',
      'description': 'Carne 180g, queijo cheddar, cebola.',
      'image': 'assets/images/burguer2.jpg',
      'preco': 'R\$22,00',
    },
  ];

  // Variáveis para os contadores de adicionais
  int _counterHamburguer = 0;
  int _counterBebidas = 0;

  Future<void> openDialog(BuildContext context, Map<String, String> product) =>
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            backgroundColor: Color.fromARGB(255, 255, 229, 184),
            contentPadding: EdgeInsets.zero,
            content: SizedBox(
              width: 400,
              height: 500,
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(height: 30),
                        Text(
                          product['title']!,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                        Divider(
                          indent: 0,
                          endIndent: 0,
                          color: Colors.black,
                        ),
                        SizedBox(height: 7),
                        Image.asset(product['image']!, height: 170),
                        SizedBox(height: 10),
                        Text(
                          product['description']!,
                          style: TextStyle(fontSize: 14),
                        ),
                        SizedBox(height: 10),
                        Divider(
                          indent: 0,
                          endIndent: 0,
                          color: Colors.black,
                        ),
                        SizedBox(height: 7),
                        Text(
                          "Adicionais",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                        SizedBox(
                          height: 130,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(left: 8),
                                      width: 180,
                                      child: Text(
                                        "Hambúrguer",
                                        style: TextStyle(fontSize: 14),
                                      ),
                                    ),
                                    Container(
                                      width: 70,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          IconButton(
                                            icon: Icon(Icons.remove,
                                                color: Colors.black),
                                            onPressed: () {
                                              if (_counterHamburguer > 0) {
                                                setState(() {
                                                  _counterHamburguer--;
                                                });
                                              }
                                            },
                                          ),
                                          Text(
                                            '$_counterHamburguer',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          IconButton(
                                            icon: Icon(Icons.add,
                                                color: Colors.black),
                                            onPressed: () {
                                              setState(() {
                                                _counterHamburguer++;
                                              });
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Divider(
                                  indent: 10.0,
                                  endIndent: 10.0,
                                  color: Colors.black,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(left: 8),
                                      width: 180,
                                      child: Text(
                                        "Bebidas",
                                        style: TextStyle(fontSize: 14),
                                      ),
                                    ),
                                    Container(
                                      width: 70,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          IconButton(
                                            icon: Icon(Icons.remove,
                                                color: Colors.black),
                                            onPressed: () {
                                              if (_counterBebidas > 0) {
                                                setState(() {
                                                  _counterBebidas--;
                                                });
                                              }
                                            },
                                          ),
                                          Text(
                                            '$_counterBebidas',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          IconButton(
                                            icon: Icon(Icons.add,
                                                color: Colors.black),
                                            onPressed: () {
                                              setState(() {
                                                _counterBebidas++;
                                              });
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Divider(
                                  indent: 10.0,
                                  endIndent: 10.0,
                                  color: Colors.black,
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: IconButton(
                      icon: Icon(Icons.close, color: Colors.black),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hambúrguer',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 130, 30, 60),
            ),
          ),
          SizedBox(height: 10),
          Container(
            width: double.infinity,
            height: 3,
            color: Color.fromARGB(255, 130, 30, 60),
            margin: EdgeInsets.only(left: 4, bottom: 10),
          ),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: products.map((product) {
              return Container(
                width: MediaQuery.of(context).size.width * 0.45,
                margin: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 248, 235),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 10,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: Image.asset(product['image']!),
                        height: 150,
                      ),
                      Text(
                        product['title']!,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 4),
                      Text(
                        product['description']!,
                        style: TextStyle(fontSize: 12),
                      ),
                      SizedBox(height: 6),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            product['preco']!,
                            style: TextStyle(
                              fontSize: 16,
                              color: Color.fromARGB(255, 130, 30, 60),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 130, 30, 60),
                              shape: BoxShape.circle,
                            ),
                            child: GestureDetector(
                              onTap: () {
                                openDialog(context, product);
                              },
                              child: Center(
                                child: Icon(
                                  Icons.shopping_bag,
                                  size: 18,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
