import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final List<Map<String, dynamic>> products = [
    {'name': 'X-Salada', 'price': 19.0, 'quantity': 2},
    {'name': 'X-Ratão', 'price': 23.0, 'quantity': 1},
  ];

  String? deliveryType = 'entrega';
  String? paymentMethod = 'cartao';
  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double total = products.fold(
        0, (sum, item) => sum + (item['price'] * item['quantity']));

    // Formata o total e outros valores para o padrão brasileiro
    final formatter = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');

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
                  final productTotal =
                      formatter.format(product['price'] * product['quantity']);
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
                                SizedBox(width: 20.0),
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
                              'Total: $productTotal',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
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
                              Text(
                                  'Preço Unitário: ${formatter.format(product['price'])}'),
                              Text('Adicionais: 2x Bacon'),
                              Text('Observações: '),
                              Align(
                                alignment: Alignment.centerRight,
                                heightFactor: 0.5,
                                child: IconButton(
                                  icon: Icon(Icons.delete),
                                  color: Colors.black,
                                  onPressed: () {
                                    // Lógica para remover o item do carrinho
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
                      ),
                    ],
                  );
                },
              ),
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
                          formatter.format(total),
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
                          formatter.format(5.0), // Valor de exemplo do frete
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
              Divider(
                color: Colors.black,
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Total: ${formatter.format(total + 5.0)}',
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
                  },
                  icon: Icon(Icons.check, color: Colors.white),
                  label: Text(
                    'Finalizar Compra',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 53, 155, 56),
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
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
