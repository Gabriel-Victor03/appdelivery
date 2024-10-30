import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MyCards extends StatelessWidget {
  final List<Map<String, String>> products = [
    {
      'title': 'Hambúrguer',
      'description': 'Carne 180g, queijo, alface e tomate',
      'image': 'assets/images/burguer1.jpg',
      'preco': 'R\$20,00',
    },
    // {
    //   'title': 'Cheeseburger',
    //   'description': 'Carne 180g, queijo cheddar, cebola.',
    //   'image': 'assets/images/burguer2.jpg',
    // },
    // {
    //   'title': 'Hambúrguer Vegano',
    //   'description': 'Hambúrguer de grão de bico, alface e tomate',
    //   'image': 'assets/images/burguer3.jpg',
    // },
    // {
    //   'title': 'Double Bacon',
    //   'description': 'Dois hambúrgueres, bacon crocante e cheddar',
    //   'image': 'assets/images/burguer4.jpg',
    // },
    // Adicione mais produtos conforme necessário
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: products.map((product) {
        return Expanded(
          child: Container(
            width: 200,
            margin: const EdgeInsets.symmetric(
                vertical: 10), // Margem entre os cards
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
              padding: const EdgeInsets.symmetric(horizontal: 10),
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
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(
                    product['description']!,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        product['preco']!,
                        style: TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 130, 30, 60),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          // Ação do botão 2
                        },
                        child: Text(
                          'Comprar',
                          style: TextStyle(
                            fontSize: 18,
                            color: Color.fromARGB(255, 130, 30, 60),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
