import 'package:appdelivery/view/controllers/adicional_controller.dart';
import 'package:appdelivery/view/controllers/adicional_controller.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class MyCards extends StatefulWidget {
  @override
  _MyCardsState createState() => _MyCardsState();
}

class _MyCardsState extends State<MyCards> {
  List<Map<String, String>> products = [];
  int _counterQuantidade = 1; // Começa com 1 por padrão
  final adicionalController = new AdicionalController(); // Instancia o controller

  @override
  void initState() {
    super.initState();
    fetchProdutos();
    adicionalController.getAdicionais();
  }

  String formatarPreco(num preco) {
    return NumberFormat.currency(
      locale: 'pt_BR', // Formato brasileiro
      symbol: 'R\$',
    ).format(preco);
  }

  String _truncateText(String text, int maxLength) {
    if (text.length <= maxLength) {
      return text;
    } else {
      return text.substring(0, maxLength) + '...';
    }
  }

  Future<void> fetchProdutos() async {
    final query = QueryBuilder<ParseObject>(ParseObject('Produto'));
    final response = await query.query();

    if (response.success && response.result != null) {
      if (!mounted) return; // Verifica se o widget ainda está montado
      setState(() {
        products = response.results!.map((e) {
          final product = e as ParseObject;
          return {
            'title': product.get<String>('nome') ?? 'Nome não disponível',
            'description': product.get<String>('descricao') ?? 'Descrição não disponível',
            'image': (product.get<ParseFile>('image_produto')?.url) ?? '',
            'preco': formatarPreco(product.get<num>('preco') ?? 0),
          };
        }).toList().cast<Map<String, String>>();
      });
    } else {
      print('erro ao buscar produtos');
    }
  }

  Future<void> openDialog(BuildContext context, Map<String, String> product) =>
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ListenableBuilder(
          listenable: adicionalController,
          builder: (context, snapshot) {
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
                              product['title'] ?? 'Nome não disponível',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Divider(color: Colors.black),
                        Image.network(product['image'] ?? '', height: 150),
                        SizedBox(height: 10),
                        Text(product['description'] ?? 'Descrição não disponível'),
                        Divider(color: Colors.black),
                        StatefulBuilder(
                          builder: (BuildContext context, StateSetter setState) {
                            return Row(
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
                                          if (_counterQuantidade > 1) {
                                            _counterQuantidade--;
                                          }
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
                            );
                          },
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
                        Column(
                          children: adicionalController.adicionais.map((adicional) {
                            final nomeAdicional = adicional['nomeAdicional'] ?? 'Adicional';
                            final contador = adicionalController.adicionaisCounter[nomeAdicional] ?? 0;

                            return _buildAdditionalItem(
                              nomeAdicional,
                              contador,
                              () {
                                adicionalController.decrement(nomeAdicional);
                              },
                              () {
                                adicionalController.incrementar(nomeAdicional);
                              },
                            );
                          }).toList(),
                        ),
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
                        child: Image.network(
                          product['image'] ?? '',
                          height: 120,
                        ),
                      ),
                      Text(
                        _truncateText(product['description'] ?? 'Descrição não disponível', 30),
                        style: TextStyle(fontSize: 12),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            product['preco'] ?? 'R\$ 0,00',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 130, 30, 60),
                            ),
                          ),
                          Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 130, 30, 60),
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                              icon: Icon(
                                Icons.shopping_bag,
                                color: Colors.white,
                                size: 18,
                              ),
                              onPressed: () => openDialog(context, product),
                              padding: EdgeInsets.zero,
                              constraints: BoxConstraints(),
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