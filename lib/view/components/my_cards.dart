import 'package:flutter/material.dart';

class MyCards extends StatelessWidget {
  final List<Map<String, String>> products = [
    {
      'title': 'Hambúrguer Clássico',
      'description': 'Carne 180g, queijo, alface e tomate',
      'image': 'assets/images/slider1.png',
    },
    {
      'title': 'Cheeseburger',
      'description': 'Carne 180g, queijo cheddar, cebola caramelizada',
      'image': 'assets/images/slider2.png',
    },
    {
      'title': 'Hambúrguer Vegano',
      'description': 'Hambúrguer de grão de bico, alface e tomate',
      'image': 'assets/images/slider2.png',
    },
    {
      'title': 'Double Bacon',
      'description': 'Dois hambúrgueres, bacon crocante e cheddar',
      'image': 'assets/images/slider1.png',
    },
    // Adicione mais produtos conforme necessário
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            GridView.builder(
              shrinkWrap:
                  true, // Faz o GridView se ajustar ao tamanho do conteúdo
              physics:
                  NeverScrollableScrollPhysics(), // Desativa a rolagem interna do GridView
              itemCount: products.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Dois cards por linha
                crossAxisSpacing: 10.0, // Espaçamento horizontal
                mainAxisSpacing: 10.0, // Espaçamento vertical
                childAspectRatio: 0.8, // Proporção de largura/altura
              ),
              itemBuilder: (context, index) {
                final product = products[index];
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: Image.asset(
                          product['image']!,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product['title']!,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              product['description']!,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ),
                      ButtonBar(
                        alignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: () {
                              // Ação do botão 1
                            },
                            child: Text('Detalhes'),
                          ),
                          TextButton(
                            onPressed: () {
                              // Ação do botão 2
                            },
                            child: Text('Comprar'),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
