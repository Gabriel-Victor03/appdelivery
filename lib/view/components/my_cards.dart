  import 'package:appdelivery/view/components/my_add_Cart.dart';
import 'package:appdelivery/view/controllers/addProduct_controller.dart';

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
    Map<String, List<Map<String, String>>> categoriaProduto = {};

    int _counterQuantidade = 1; // Começa com 1 por padrão
    double _valorTotal = 0.0; // Valor total inicia
    
    final adicionalController = AdicionalController(); // Instancia o controller
    final addproductController = AddproductController();

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

    void atualizarValorTotal(Map<String, String> product) {
      final precoBase = double.tryParse(product['preco'] ?? '0') ?? 0.0;
      setState(() {
        _valorTotal = _counterQuantidade * precoBase;
            print("Valor total atualizado: $_valorTotal"); // Imprime o valor no console

      });
    }
    Future<void> fetchProdutos() async {
    final query = QueryBuilder<ParseObject>(ParseObject('Produto'));
    final response = await query.query();

    if (response.success && response.result != null) {
      if (!mounted) return; // Verifica se o widget ainda está montado
      setState(() {
        categoriaProduto.clear(); // Limpa as categorias para evitar duplicação

        final productList = response.results!.map((e) async {
          final product = e as ParseObject;
          final relation = product.getRelation('categoria_produto');
          final categoria = await relation.getQuery().first();
          final categoryName = categoria != null
              ? categoria.get<String>('nome') ?? 'Sem Categoria'
              : 'Sem Categoria';

          return {
            'id': product.objectId ?? '', // Garante que o objectId seja incluído
            'category': categoryName,
            'title': product.get<String>('nome') ?? 'Nome não disponível',
            'description': product.get<String>('descricao') ?? 'Descrição não disponível',
            'image': (product.get<ParseFile>('image_produto')?.url) ?? '',
            'preco': product.get<num>('preco')?.toStringAsFixed(2) ?? '0.00',
          };
        }).toList();

        // Espera todas as operações assíncronas terminarem
        Future.wait(productList).then((products) {
          // Organiza os produtos por categoria
          products.forEach((product) {
            final category = product['category'] as String;
            if (!categoriaProduto.containsKey(category)) {
              categoriaProduto[category] = [];
            }
            categoriaProduto[category]!.add(product);
          });
        });
      });
    } else {
      print('Erro ao buscar produtos');
    }
  }
    Future<void> openDialog(BuildContext context, Map<String, String> product) async {
    // Inicializa as variáveis globais para o produto selecionado
    setState(() {
      _counterQuantidade = 1; // Reinicia a quantidade para 1
      _valorTotal = double.tryParse(product['preco'] ?? '0') ?? 0.0; // Preço inicial
    });

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setStateDialog) {
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
                        // Título e imagem do produto
                        Text(
                          product['title'] ?? 'Nome não disponível',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Divider(color: Colors.black),
                        Image.network(product['image'] ?? '', height: 150),
                        SizedBox(height: 10),
                        Text(product['description'] ?? 'Descrição não disponível'),
                        Divider(color: Colors.black),

                        // Controle de quantidade
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
                                    if (_counterQuantidade > 1) {
                                      setState(() {
                                        _counterQuantidade--;
                                        _valorTotal = _counterQuantidade *
                                            (double.tryParse(product['preco'] ?? '0') ?? 0.0);
                                      });
                                      setStateDialog(() {}); // Atualiza o diálogo
                                    }
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
                                      _valorTotal = _counterQuantidade *
                                          (double.tryParse(product['preco'] ?? '0') ?? 0.0);
                                    });
                                    setStateDialog(() {}); // Atualiza o diálogo
                                  },
                                  icon: Icon(Icons.add),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Divider(color: Colors.black),

                        // Valor total
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
                              NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$')
                                  .format(_valorTotal),
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                        Divider(color: Colors.black),

                        // Botão adicionar à sacola
                        SizedBox(height: 15),
                        AddToCartButton(
                          controller: addproductController,
                          produtoId: product['id'] ?? '',
                          quantidade: _counterQuantidade,
                          total: _valorTotal,
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
  }



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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: categoriaProduto.entries.map((entry) {
            final categoryName = entry.key;
            final categoryProducts = entry.value;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Título da categoria
                Text(
                  categoryName,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
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
                  children: categoryProducts.map<Widget>((product) {
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
                            Center(
                              child: Image.network(
                                product['image'] ?? '',
                                height: 120,
                              ),
                            ),
                            Text(
                              product['title'] ?? 'Nome não disponível',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 130, 30, 60),
                              ),
                            ),
                            Text(
                              _truncateText(
                                product['description'] ??
                                    'Descrição não disponível',
                                30,
                              ),
                              style: TextStyle(fontSize: 12),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  formatarPreco(double.tryParse(
                                          product['preco'] ?? '0.00') ??
                                      0.00),
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
                SizedBox(height: 20),
              ],
            );
          }).toList(),
        ),
      );
    }
  }
