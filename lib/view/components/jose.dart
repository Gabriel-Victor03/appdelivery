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
    {
      'title': 'Triplo Burguer',
      'description': 'Carne 180g, queijo, alface e tomate.',
      'image': 'assets/images/burguer2.jpg',
      'preco': 'R\$20,00',
    },
    {
      'title': 'Comeu Deitou',
      'description': 'Carne 180g, queijo cheddar, cebola.',
      'image': 'assets/images/burguer1.jpg',
      'preco': 'R\$22,00',
    },
  ];

  int _counterCheddar = 0;
  int _counterBacon = 0;
  int _counterCalabresa = 0;
  int _counterOvo = 0;
  int _counterBarbecue = 0;
  int _counterQuantidade = 1; // Começa com 1 por padrão

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
              width: MediaQuery.of(context).size.width * 0.9,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Stack(
                        children: [
                          Text(
                            product['title']!,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Divider(color: Colors.black),
                      Image.asset(product['image']!, height: 150),
                      SizedBox(height: 10),
                      Text(product['description']!),
                      Divider(color: Colors.black),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Quantidade:",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    if (_counterQuantidade > 1)
                                      _counterQuantidade--;
                                  });
                                },
                                icon: Icon(Icons.remove),
                              ),
                              Text(
                                '$_counterQuantidade',
                                style: TextStyle(fontSize: 18),
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    _counterQuantidade++;
                                  });
                                },
                                icon: Icon(Icons.add),
                              ),
                            ],
                          ),
                        ],
                      ),

                      Divider(color: Colors.black),

                      // Seção de Adicionais
                      Text(
                        "Adicionais",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      _buildAdditionalItem("Cheddar (R\$1,00)", _counterCheddar,
                          () {
                        setState(() {
                          if (_counterCheddar > 0) _counterCheddar--;
                        });
                      }, () {
                        setState(() {
                          _counterCheddar++;
                        });
                      }),
                      _buildAdditionalItem("Bacon (R\$2,00)", _counterBacon,
                          () {
                        setState(() {
                          if (_counterBacon > 0) _counterBacon--;
                        });
                      }, () {
                        setState(() {
                          _counterBacon++;
                        });
                      }),
                      _buildAdditionalItem(
                          "Calabresa (R\$0,50)", _counterCalabresa, () {
                        setState(() {
                          if (_counterCalabresa > 0) _counterCalabresa--;
                        });
                      }, () {
                        setState(() {
                          _counterCalabresa++;
                        });
                      }),
                      _buildAdditionalItem("Ovo (R\$1,00)", _counterOvo, () {
                        setState(() {
                          if (_counterOvo > 0) _counterOvo--;
                        });
                      }, () {
                        setState(() {
                          _counterOvo++;
                        });
                      }),
                      _buildAdditionalItem(
                          "Barbecue (R\$1,50)", _counterBarbecue, () {
                        setState(() {
                          if (_counterBarbecue > 0) _counterBarbecue--;
                        });
                      }, () {
                        setState(() {
                          _counterBarbecue++;
                        });
                      }),

                      SizedBox(height: 10),
                      Divider(color: Colors.black),

                      // Valor total (para ser ajustado com base nos contadores)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Valor total:",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            "R\$ 20,00",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                      Divider(color: Colors.black),

                      SizedBox(height: 10),
                      Text(
                        "Descrição",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      TextField(
                        maxLines: 3,
                        decoration: InputDecoration(
                          hintText: " ",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: const Color.fromARGB(255, 109, 109, 109),
                            ),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                      ),
                      SizedBox(height: 15),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 130, 30, 60),
                            padding: EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          label: Text(
                            "Adicionar na sacola",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          icon: Icon(
                            Icons.shopping_bag,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      );

  Widget _buildAdditionalItem(
      String name, int counter, VoidCallback onRemove, VoidCallback onAdd) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(name),
        Row(
          children: [
            IconButton(
              icon: Icon(Icons.remove),
              onPressed: onRemove,
            ),
            Text('$counter'),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: onAdd,
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
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
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Centralizando a imagem
                      Center(
                        child: Image.asset(
                          product['image']!,
                          height: 120,
                        ),
                      ),
                      Text(
                        product['description']!,
                        style: TextStyle(fontSize: 12),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            product['preco']!,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 130, 30,
                                  60), // Cor personalizada adicionada
                            ),
                          ),
                          Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(
                                  255, 130, 30, 60), // Cor de fundo do botão
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                              icon: Icon(
                                Icons.shopping_bag,
                                color: Colors.white, // Ícone branco
                                size: 18,
                              ),
                              onPressed: () => openDialog(context, product),
                              padding:
                                  EdgeInsets.zero, // Remove padding adicional
                              constraints:
                                  BoxConstraints(), // Limita o tamanho do botão
                            ),
                          ),
                        ],
                      ),
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
