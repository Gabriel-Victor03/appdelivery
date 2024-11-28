import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class MyCards extends StatefulWidget {
  @override
  _MyCardsState createState() => _MyCardsState();
}

class _MyCardsState extends State<MyCards> {
  List<Map<String, String>> products = [];

    @override
    void initState() {
      super.initState();
      fetchProdutos();
    }

  Future<void> fetchProdutos () async {
    final query = QueryBuilder<ParseObject>(ParseObject('Produto'));
    final response = await query.query();
    
    if (response.success && response.result !=  null) {
      setState(() {
        products = response.results!.map((e) {
          final product = e as ParseObject; // Cast para ParseObject
          return {
            'title': product.get<String>('nome') ?? '',
            'description': product.get<String>('descricao') ?? '',
            'image': (product.get<ParseFile>('image_produto')?.url) ?? '',
            'preco': product.get<dynamic>('preco')?.toString() ?? '',
          };
        }).toList().cast<Map<String, String>>(); // Faz o cast explícito
      });
        } else {
          print('erro ao buscar produtos');
        }       
    }

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
                        SizedBox(height: 10),
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
                        Image.network(product['image']!, height: 170),
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
                    top: 5,
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
                margin: const EdgeInsets.symmetric(vertical: 5),
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
                        child: Image.network(product['image']!),
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