import 'package:flutter/material.dart';

class MyCards extends StatelessWidget {
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

  // Função para abrir o diálogo com mais informações do produto
  Future<void> openDialog(BuildContext context, Map<String, String> product) =>
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(20), // Bordas com 20px de raio
            ),
            backgroundColor: Color.fromARGB(255, 255, 229, 184), // Cor de fundo
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Título do produto
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

                // Imagem do produto
                Image.asset(product['image']!, height: 170),
                SizedBox(height: 10),

                // Descrição do produto
                Text(
                  product['description']!,
                  style: TextStyle(fontSize: 14),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),

                Divider(
                  indent: 0,
                  endIndent: 0,
                  color: Colors.black,
                ),
                SizedBox(height: 7),

                Text(
                  "ADICIONAIS",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),

                // Preço do produto
                Text(
                  'Preço: ${product['preco']}',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 130, 30, 60),
                  ),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Fechar',
                  style: TextStyle(color: Color.fromARGB(255, 130, 30, 60)),
                ),
              ),
            ],
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
          // Título da categoria
          Text(
            'Hambúrguer',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 130, 30, 60),
            ),
          ),
          SizedBox(height: 10),

          // Linha vertical
          Container(
            width: double.infinity,
            height: 3,
            color: Color.fromARGB(255, 130, 30, 60),
            margin: EdgeInsets.only(left: 4, bottom: 10),
          ),

          // Cards de produtos
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
