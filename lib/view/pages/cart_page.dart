import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

// exemplo dado pelo Chat de como criar essas classes
class _CartPageState extends State<CartPage> {
  final List<Map<String, dynamic>> products = [
    {'name': 'X-Salada', 'price': 19.0, 'quantity': 2},
    {'name': 'X-Ratão', 'price': 23.0, 'quantity': 1},
  ];

// Exemplo dado pelo Chat de como criar os controllers
  String? deliveryType = 'entrega';
  String? paymentMethod = 'cartao';
  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double total = products.fold(
        0, (sum, item) => sum + (item['price'] * item['quantity']));

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 229, 184),
      body: Padding(
        padding: const EdgeInsets.all(0.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'SACOLA',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 130, 30, 60)),
                ),
              ),
              Divider(
                indent: 10.0,
                endIndent: 10.0,
                color: Colors.black,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return Column(
                    children: [
                      ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  '${product['quantity']}x',
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 18,
                                    fontFamily: 'Arial',
                                    color: Color.fromARGB(255, 0, 0, 0),
                                  ),
                                ),
                                SizedBox(width: 20.0), // Espaço entre os textos
                                Text(
                                  '${product['name']}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 19,
                                    fontFamily: 'Arial',
                                    color: Color.fromARGB(255, 0, 0, 0),
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              'Total: R\$${product['price'] * product['quantity']}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 19,
                                fontFamily: 'Arial',
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
                            ),
                          ],
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(left: 30.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Preço Unitário: R\$${product['price']}'),
                              Text(
                                  'Adicionais: 2x Bacon'), // Lista a quantidade de adicional e quais
                              Text(
                                  'Observações: '), // Campo para listar observações
                              Align(
                                alignment: Alignment.centerRight,
                                heightFactor: 0.5,
                                child: IconButton(
                                  icon: Icon(Icons.delete),
                                  color:
                                      Colors.black, // Define o ícone como preto
                                  onPressed: () {
                                    // Função para remover o item do carrinho
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        subtitleTextStyle: TextStyle(
                          fontFamily: 'Arial',
                          fontWeight: FontWeight.normal,
                          color: Color.fromARGB(255, 68, 66, 66),
                        ),
                      ),
                      Divider(
                        indent: 10.0,
                        endIndent: 10.0,
                        color: Colors.black,
                      ), // Divider após cada ListTile
                    ],
                  );
                },
              ),

              // Função para calcular e exibir o subtotal da sacola

              const SizedBox(height: 28),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      color: const Color.fromARGB(
                          255, 130, 30, 60), // Cor de fundo
                      padding: const EdgeInsets.symmetric(
                          vertical: 3.0), // Espaçamento vertical
                      child: Center(
                        child: Text(
                          'Dados',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              // ,

              Container(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start, // Alinha os textos à esquerda
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: 14.0), // Padding na esquerda para o texto
                        child: Text(
                          'Nome',
                          style: TextStyle(
                            fontFamily: 'arial',
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 14.0), // Padding na esquerda para o TextField
                        child: Container(
                          width: MediaQuery.of(context).size.width /
                              2, // Ajusta a largura do TextField
                          height: 40.0,
                          child: TextField(
                            textAlignVertical: TextAlignVertical.center,
                            controller: nameController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Nome e sobrenome",
                              filled: true,
                              fillColor: Colors.white,
                              // contentPadding: EdgeInsets.symmetric(
                              //     vertical: 9.0, horizontal: 10.0)
                            ),
                            style: TextStyle(fontSize: 13),
                          ),
                        ),
                      ),
                      SizedBox(height: 17),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 14.0), // Padding na esquerda para o texto
                        child: Text(
                          'Telefone',
                          style: TextStyle(
                            fontFamily: 'arial',
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 14.0), // Padding na esquerda para o TextField
                        child: Container(
                          height: 40.0,

                          width: MediaQuery.of(context).size.width /
                              2, // Ajusta a largura do TextField
                          child: TextField(
                            textAlignVertical: TextAlignVertical.center,
                            controller: phoneController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "(xx) xxxxx-xxxx",
                              filled: true,
                              fillColor: Colors.white,
                            ),
                            style: TextStyle(fontSize: 13),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 17),

              Row(
                children: [
                  Expanded(
                    child: Container(
                      color: const Color.fromARGB(
                          255, 130, 30, 60), // Cor de fundo
                      padding: const EdgeInsets.symmetric(
                          vertical: 3.0), // Espaçamento vertical
                      child: Center(
                        child: Text(
                          'Forma de Entrega',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Container(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment
                      .center, // Centraliza o Row no eixo horizontal
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment
                            .center, // Centraliza os elementos dentro da coluna
                        children: [
                          Radio<String>(
                            value: 'Retirada no balcão',
                            groupValue: deliveryType,
                            onChanged: (value) {
                              setState(() {
                                deliveryType = value;
                              });
                            },
                          ),
                          const Text('Retirada no balcão',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal,
                                  fontFamily: 'Arial')),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Radio<String>(
                            value: 'Delivery',
                            groupValue: deliveryType,
                            onChanged: (value) {
                              setState(() {
                                deliveryType = value;
                              });
                            },
                          ),
                          const Text('Delivery',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal,
                                  fontFamily: 'Arial')),
                          const Text(
                            '(R\$5,00)',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 15,
                                fontStyle: FontStyle.italic,
                                fontFamily: 'Arial',
                                color: Color.fromARGB(150, 50, 50, 50)),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              Row(
                children: [
                  Expanded(
                    child: Container(
                      color: const Color.fromARGB(
                          255, 130, 30, 60), // Cor de fundo
                      padding: const EdgeInsets.symmetric(
                          vertical: 3.0), // Espaçamento vertical
                      child: Center(
                        child: Text(
                          'Forma de Pagamento',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.only(right: 30.0, left: 30, top: 9),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment
                      .spaceBetween, // Distribui as opções de forma uniforme
                  children: [
                    Row(
                      children: [
                        Radio<String>(
                          value: 'cartao',
                          groupValue: paymentMethod,
                          onChanged: (value) {
                            setState(() {
                              paymentMethod = value;
                            });
                          },
                        ),
                        const Text('Cartão',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                                fontFamily: 'Arial')),
                      ],
                    ),
                    Row(
                      children: [
                        Radio<String>(
                          value: 'dinheiro',
                          groupValue: paymentMethod,
                          onChanged: (value) {
                            setState(() {
                              paymentMethod = value;
                            });
                          },
                        ),
                        const Text('Dinheiro',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                                fontFamily: 'Arial')),
                      ],
                    ),
                    Row(
                      children: [
                        Radio<String>(
                          value: 'pix',
                          groupValue: paymentMethod,
                          onChanged: (value) {
                            setState(() {
                              paymentMethod = value;
                            });
                          },
                        ),
                        const Text('Pix',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                                fontFamily: 'Arial')),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              Divider(
                color: Colors.black,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 18.0, left: 18.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Text(
                          'Pedido:',
                          style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Arial'),
                        ),
                        Spacer(),
                        Text(
                          'R\$$total',
                          style: const TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Arial'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Text(
                          'Frete:',
                          style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Arial'),
                        ),
                        Spacer(),
                        Text(
                          'R\$$total',
                          style: const TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Arial'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // const SizedBox(height: 20),

              Divider(
                color: Colors.black,
              ),

              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Total: R\$$total',
                    style: const TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Arial'),
                  ),
                ),
              ),

              Center(
                child: ElevatedButton.icon(
                  onPressed: () {
                    // Lógica para finalizar a compra
                    final customerInfo = {
                      'name': nameController.text,
                      'phone': phoneController.text,
                      'deliveryType': deliveryType,
                      'paymentMethod': paymentMethod,
                      'total': total,
                    };
                    // print('Pedido finalizado: $customerInfo');
                  },
                  icon: Icon(Icons.check,
                      color: Colors.white), // Ícone de visto branco
                  label: Text(
                    'Finalizar Compra',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        const Color.fromARGB(255, 53, 155, 56), // Fundo verde
                    padding: EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 20.0), // Aumenta o tamanho do botão
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(8.0), // Bordas arredondadas
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
