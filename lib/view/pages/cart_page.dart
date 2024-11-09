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
        padding: const EdgeInsets.all(16.0),
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
              // const Text(
              //   'Produtos Selecionados',
              //   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              // ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return ListTile(
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
                            SizedBox(width: 20), // Espaço entre os textos
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
                          'Total: R\$${product['price'] * product['quantity']}', // Multiplica o campo adicionais
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
                      padding: const EdgeInsets.only(left: 38.0),
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
                            child: IconButton(
                              icon: Icon(Icons.delete),
                              color:
                                  Colors.black, // Define o ícone como vermelho
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
                  );
                },
              ),
              const SizedBox(height: 20),
              const Text(
                'Dados',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Nome'),
              ),
              TextField(
                controller: phoneController,
                decoration: const InputDecoration(labelText: 'Telefone'),
              ),
              const SizedBox(height: 20),
              const Text(
                'Entrega',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Row(
                children: [
                  Expanded(
                    child: ListTile(
                      title: const Text('Retirada no balcão'),
                      leading: Radio<String>(
                        value: 'Retirada no balcão',
                        groupValue: deliveryType,
                        onChanged: (value) {
                          setState(() {
                            deliveryType = value;
                          });
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListTile(
                      title: const Text('Delivery'),
                      leading: Radio<String>(
                        value: 'Delivery',
                        groupValue: deliveryType,
                        onChanged: (value) {
                          setState(() {
                            deliveryType = value;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                'Forma de Pagamento',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              DropdownButtonFormField<String>(
                value: paymentMethod,
                // decoration:
                //     const InputDecoration(labelText: 'Forma de Pagamento'),
                items: const [
                  DropdownMenuItem(value: 'cartao', child: Text('Cartão')),
                  DropdownMenuItem(value: 'dinheiro', child: Text('Dinheiro')),
                ],
                onChanged: (value) {
                  setState(() {
                    paymentMethod = value;
                  });
                },
              ),
              const SizedBox(height: 15),

              Divider(
                color: Colors.black,
              ),
              Row(
                children: [
                  const Text(
                    'Pedido:',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Text(
                    'R\$$total',
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ],
              ),

              const SizedBox(height: 8),

              Row(
                children: [
                  const Text(
                    'Frete:',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Text(
                    'R\$$total',
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ],
              ),

              // const SizedBox(height: 20),

              Divider(
                color: Colors.black,
              ),

              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'Total: R\$$total',
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold),
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
