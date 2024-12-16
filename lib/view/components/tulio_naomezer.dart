/*Future<void> openDialog(BuildContext context, Map<String, String> product) async {
    setState(() {
      _counterQuantidade = 1; // Reinicia a quantidade para 1
      _valorTotal = double.tryParse(product['preco'] ?? '0') ?? 0.0; // Preço inicial
    });

  await showDialog(
    context: context,
    builder: (BuildContext context) {
      return ListenableBuilder(
        listenable: adicionalController, // Mantém o adicionalController
        builder: (context, _) {
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
                      StatefulBuilder(
                        builder: (BuildContext context, StateSetter setStateDialog) {
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
                                      if (_counterQuantidade > 1) {
                                        setState(() {
                                          _counterQuantidade--;
                                          _valorTotal = _counterQuantidade * (double.tryParse(product['preco'] ?? '0') ?? 0.0);
                                           print("Quantidade diminuida: $_counterQuantidade"); // Imprime a quantidade
                                          print("Valor total atualizado: $_valorTotal"); // Imprime o valor                                                                                                                                     
                                        });
                                          setStateDialog(() {});
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
                                           _valorTotal = _counterQuantidade * (double.tryParse(product['preco'] ?? '0') ?? 0.0);
                                          print("Quantidade aumentada: $_counterQuantidade"); // Imprime a quantidade
                                          print("Valor total atualizado: $_valorTotal"); // Imprime o valor
                                        
                                      });
                                      setStateDialog(() {});
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
                             NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$').format(_valorTotal),
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                      Divider(color: Colors.black),

                      // Seção de Adicionais (mantida, mas sem lógica implementada)
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
                      Divider(color: Colors.black),

                      // Botão adicionar à sacola
                      SizedBox(height: 15),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          onPressed: () {
                             atualizarValorTotal(product); // Chama o método que atualiza o valor total
                             Navigator.pop(context);
                          },
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
}
*/
