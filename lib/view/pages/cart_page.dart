import 'package:flutter/material.dart';

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

    return Scaffold(
      // appBar: const MyAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'SACOLA',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
              ),
              const Text(
                'Produtos Selecionados',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return ListTile(
                    title: Text(product['name']),
                    subtitle: Text(
                        'Preço: R\$${product['price']} x ${product['quantity']}'),
                    trailing: Text(
                        'Total: R\$${product['price'] * product['quantity']}'),
                  );
                },
              ),
              const SizedBox(height: 20),
              const Text(
                'Dados do Cliente',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Nome'),
              ),
              TextField(
                controller: addressController,
                decoration: const InputDecoration(labelText: 'Endereço'),
              ),
              TextField(
                controller: phoneController,
                decoration: const InputDecoration(labelText: 'Telefone'),
              ),
              const SizedBox(height: 20),
              const Text(
                'Tipo de Entrega',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Expanded(
                    child: ListTile(
                      title: const Text('Entrega'),
                      leading: Radio<String>(
                        value: 'entrega',
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
                      title: const Text('Retirada'),
                      leading: Radio<String>(
                        value: 'retirada',
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
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              DropdownButtonFormField<String>(
                value: paymentMethod,
                decoration:
                    const InputDecoration(labelText: 'Forma de Pagamento'),
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
              const SizedBox(height: 20),
              Text('Total: R\$$total',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Lógica para finalizar a compra
                  final customerInfo = {
                    'name': nameController.text,
                    'address': addressController.text,
                    'phone': phoneController.text,
                    'deliveryType': deliveryType,
                    'paymentMethod': paymentMethod,
                    'total': total,
                  };
                  print('Pedido finalizado: $customerInfo');
                },
                child: const Text('Finalizar Compra'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
