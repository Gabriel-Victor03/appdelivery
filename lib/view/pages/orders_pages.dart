import 'package:appdelivery/view/components/my_appbar.dart';
import 'package:flutter/material.dart';

class OrdersPages extends StatefulWidget {
  const OrdersPages({super.key});

  @override
  State<OrdersPages> createState() => _OrdersPagesState();
}

class _OrdersPagesState extends State<OrdersPages> {
  final List<Map<String, String>> pedidos = [
    {
      "numero": "0001",
      "hora": "19:37",
      "nome": "Adauto Turíbio",
      "detalhes": "Detalhes 1"
    },
    {
      "numero": "0002",
      "hora": "20:15",
      "nome": "Maria Silva",
      "detalhes": "Detalhes 2"
    },
    {
      "numero": "0003",
      "hora": "21:00",
      "nome": "João Souza",
      "detalhes": "Detalhes 3"
    },
    {
      "numero": "0004",
      "hora": "22:30",
      "nome": "Lucas Oliveira",
      "detalhes": "Detalhes 4"
    },
    // Adicione mais pedidos aqui conforme necessário
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: 30,
          ),
          Center(
            child: Text(
              "Pedidos",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Table(
                border: TableBorder.all(borderRadius: BorderRadius.circular(3)),
                // Adiciona borda em torno da tabela
                columnWidths: {
                  0: FlexColumnWidth(
                      0.7), // Define a largura da primeira coluna
                  1: FlexColumnWidth(0.7), // Define a largura da segunda coluna
                  2: FlexColumnWidth(
                      0.7), // Define a largura da terceira coluna
                  3: FlexColumnWidth(0.7),
                },
                children: [
                  TableRow(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 255, 229, 184),
                      // Cor de fundo para o cabeçalho
                    ),
                    children: [
                      TableCell(
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Nº PEDIDO",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontWeight: FontWeight.bold))),
                      ),
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                              'HORÁRIO',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                              'NOME',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                              'DETALHES',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  // Linhas de dados

                  TableRow(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 229, 184),
                      ),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            "0001",
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Center(
                              child: Text(
                            '19:37',
                            textAlign: TextAlign.center,
                          )),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(6),
                          child: Container(
                              child: Center(
                                  child: Text('Adauto Turíbio',
                                      textAlign: TextAlign.center))),
                        ),
                        Padding(
                            padding: const EdgeInsets.all(6),
                            child: Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Center(
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: Color.fromARGB(
                                                  255, 130, 30, 60),
                                              padding: EdgeInsets.all(3),
                                              maximumSize: Size(50, 50),
                                              minimumSize: Size(5, 5)),
                                          onPressed: () {},
                                          child: Transform.rotate(
                                              angle: 1.64159,
                                              child: Icon(
                                                Icons.search,
                                                color: Colors.white,
                                                size: 25,
                                              )))),
                                ],
                              ),
                            ))
                      ]),
                ]),
          )
        ]),
      ),
    );
  }
}
