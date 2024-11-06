import 'package:flutter/material.dart';

class MyCards extends StatelessWidget {
  final List<Map<String, String>> products = [
    {
      'title': 'Hambúrguer',
      'description': 'Carne 180g, queijo, alface e tomate',
      'image': 'assets/images/burguer1.jpg',
      'preco': 'R\$20,00',
    },
    {
      'title': 'Cheeseburger',
      'description': 'Carne 180g, queijo cheddar, cebola.',
      'image': 'assets/images/burguer2.jpg',
      'preco': 'R\$22,00',
    },
    {
      'title': 'Cheeseburger',
      'description': 'Carne 180g, queijo cheddar, cebola.',
      'image': 'assets/images/burguer2.jpg',
      'preco': 'R\$22,00',
    },
    {
      'title': 'Cheeseburger',
      'description': 'Carne 180g, queijo cheddar, cebola.',
      'image': 'assets/images/burguer1.jpg',
      'preco': 'R\$22,00',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Wrap(
        spacing: 10,
        runSpacing: 10,
        children: products.map((product) {
          return Container(
            width:
                MediaQuery.of(context).size.width * 0.45, // Largura responsiva
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
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                        width: 30, // Ajusta a largura do botão
                        height: 30, // Ajusta a altura do botão
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 130, 30, 60),
                          shape: BoxShape.circle,
                        ),
                        child: GestureDetector(
                          onTap: () {
                            // Ação do botão
                            print("Carrinho pressionado");
                          },
                          child: Center(
                            child: Icon(
                              Icons.shopping_cart,
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
    );
  }
}
