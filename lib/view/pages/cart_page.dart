import 'package:appdelivery/view/components/my_add_order.dart';
import 'package:appdelivery/view/components/my_popup_informaddress.dart';
import 'package:appdelivery/view/controllers/order_controller.dart';
import 'package:appdelivery/view/controllers/sacola_controller.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<Map<String, dynamic>> products = [];
  final sacolaController = SacolaController();
  final orderController = OrderController();

  @override
  void initState() {
    super.initState();
    loadSacola();
  }

  Future<void> loadSacola() async {
    final prefs = await SharedPreferences.getInstance();
    await sacolaController.loadSacolaId();
    await sacolaController.fetchProdutosNaSacola();

    if (!mounted) return; // Verifica se o widget ainda está montado
    setState(() {
      products = sacolaController.products;
    });
  }

  String? deliveryType = 'Retirada no balcão';
  String? paymentMethod = 'cartao';
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  // Define the delivery fee
  final double deliveryFee = 5.0;

  @override
  Widget build(BuildContext context) {
    double total = products.fold(
        0, (sum, item) => sum + (item['price'] * item['quantity']));

    // Add delivery fee to total if delivery is selected
    if (deliveryType == 'Delivery') {
      total += deliveryFee;
    }

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
                              Text(
                                  'Preço Unitário: ${formatter.format(product['price'])}'),
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

              // Função para calcular e exibir o subtotal da sacola
              const SizedBox(height: 28),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      color: const Color.fromARGB(255, 130, 30, 60),
                      padding: const EdgeInsets.symmetric(vertical: 3.0),
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
              Container(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 14.0),
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
                        padding: EdgeInsets.only(left: 14.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width / 2,
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
                        padding: EdgeInsets.only(left: 14.0),
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
                        padding: EdgeInsets.only(left: 14.0),
                        child: Container(
                          height: 40.0,
                          width: MediaQuery.of(context).size.width / 2,
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
                      color: const Color.fromARGB(255, 130, 30, 60),
                      padding: const EdgeInsets.symmetric(vertical: 3.0),
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
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
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
                              const Text(
                                'Retirada no balcão',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal,
                                  fontFamily: 'Arial',
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
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
                              const Text(
                                'Delivery',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal,
                                  fontFamily: 'Arial',
                                ),
                              ),
                              const Text(
                                '(R\$5,00)',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontStyle: FontStyle.italic,
                                  fontFamily: 'Arial',
                                  color: Color.fromARGB(150, 50, 50, 50),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Center(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width / 2,
                        child: ElevatedButton.icon(
                          onPressed: deliveryType == 'Delivery'
                              ? () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return MyPopupInformAddress();
                                    },
                                  );
                                }
                              : null, // Botão desabilitado
                          icon: Icon(Icons.location_on, color: Colors.black),
                          label: Text(
                            'Informar Endereço',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 14.5),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 255, 221, 0),
                            padding: EdgeInsets.symmetric(vertical: 15),
                            disabledBackgroundColor: Colors.grey,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
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
                      color: const Color.fromARGB(255, 130, 30, 60),
                      padding: const EdgeInsets.symmetric(vertical: 3.0),
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                indent: 10.0,
                endIndent: 10.0,
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
                          formatter.format(total - (deliveryType == 'Delivery' ? deliveryFee : 0)),
                          style: const TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Arial'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    if (deliveryType == 'Delivery') // Conditionally show delivery fee
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
                            formatter.format(deliveryFee),
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
                indent: 10.0,
                endIndent: 10.0,
              ),
              Padding(
                padding:
                    const EdgeInsets.only(bottom: 18.0, left: 18, right: 18),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Total: ${formatter.format(total)}',
                    style: const TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Arial'),
                  ),
                ),
              ),

                AddOrderButton(
                nameController: nameController,
                phoneController: phoneController,
                deliveryType: deliveryType!,
                paymentMethod: paymentMethod!,
                total: total,
              ),
            ],
          ),
        ),
      ),
    );
  }
}