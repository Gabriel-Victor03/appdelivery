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
      "qtd": "2",
      "nome_Produto": "x Burguer",
      "obs": "Sem tomate",
      "tipo_entrega": "Delivery",
      "endereco": "Rua 01, Centro"
    },
    /* String pedido,
          String horario,
          String nome,
          String quantidade,
          String nome_Produto,
          String obs,
          String tipo_entre,
          String endereco)*/
    {
      "numero": "0002",
      "hora": "20:15",
      "nome": "Gabriel Vitor",
      "qtd": "2",
      "nome_Produto": "x Burguer",
      "obs": "Sem tomate",
      "tipo_entrega": "Delivery",
      "endereco": "Rua 01, Centro"
    },
    {
      "numero": "0003",
      "hora": "21:00",
      "nome": "Come Tulio",
      "qtd": "2",
      "nome_Produto": "x Burguer",
      "obs": "Sem tomate",
      "tipo_entrega": "Delivery",
      "endereco": "Rua 01, Centro"
    },
    {
      "numero": "0004",
      "hora": "22:30",
      "nome": "Rafael Feitosa",
      "qtd": "2",
      "nome_Produto": "x Burguer",
      "obs": "Sem tomate",
      "tipo_entrega": "Delivery",
      "endereco": "Rua 01, Centro"
    },
    {
      "numero": "0005",
      "hora": "22:31",
      "nome": "Eric Ferreira",
      "qtd": "2",
      "nome_Produto": "x Burguer",
      "obs": "Sem tomate",
      "tipo_entrega": "Delivery",
      "endereco": "Rua 01, Centro"
    },

    // Adicione mais pedidos aqui conforme necessário
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
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
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  border: Border.all(
                      color: const Color.fromARGB(
                          255, 0, 0, 0)), // Borda para o container
                ),
                child: Column(
                  children: [
                    // Cabeçalho
                    Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 229, 184),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                              child: Text('Nº PEDIDO',
                                  textAlign: TextAlign.center,
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold))),
                          Expanded(
                              child: Text('HORÁRIO',
                                  textAlign: TextAlign.center,
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold))),
                          Expanded(
                              child: Text('NOME',
                                  textAlign: TextAlign.center,
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold))),
                          Expanded(
                              child: Text('DETALHES',
                                  textAlign: TextAlign.center,
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold))),
                        ],
                      ),
                    ),
                    // ListView de pedidos
                    ListView.builder(
                      shrinkWrap: true,
                      physics:
                          NeverScrollableScrollPhysics(), // Impede o scroll duplicado com SingleChildScrollView
                      itemCount: pedidos.length,
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 255, 229, 184)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                  child: Text(pedidos[index]["numero"]!,
                                      textAlign: TextAlign.center)),
                              Expanded(
                                  child: Text(pedidos[index]["hora"]!,
                                      textAlign: TextAlign.center)),
                              Expanded(
                                  child: Text(pedidos[index]["nome"]!,
                                      textAlign: TextAlign.center)),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              Color.fromARGB(255, 130, 30, 60),
                                          padding: EdgeInsets.all(3),
                                          maximumSize: Size(50, 50),
                                          minimumSize: Size(5, 5)),
                                      onPressed: () {
                                        openDetails(
                                            "$pedidos['index']['numero']"!,
                                            "$pedidos['index']['horario']"!,
                                            "$pedidos['index']['nome']"!,
                                            "$pedidos['index']['qtd']"!,
                                            "$pedidos['index']['nome_produto']"!,
                                            "$pedidos['index']['obs']"!,
                                            "$pedidos['index']['tipo_entrega']"!,
                                            "$pedidos['index']['endereco']"!);
                                      },
                                      child: Transform.rotate(
                                        angle: 1.64159,
                                        child: Icon(
                                          Icons.search,
                                          color: Colors.white,
                                          size: 25,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future openDetails(
          String numPed,
          String horario,
          String nome,
          String quantidade,
          String nome_Produto,
          String obs,
          String tipo_entre,
          String endereco) =>
      showDialog(
        context: context,
        builder: (context) => Dialog(
            child: Container(
                width: 480,
                height: 420,
                child: ListView(children: [
                  Column(children: [
                    Container(
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(
                              fontSize: 24,
                              color:
                                  Colors.black), // Estilo padrão para o texto
                          children: <TextSpan>[
                            TextSpan(
                              text: "Pedido: ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ), // Estilo normal
                            ),
                            TextSpan(
                              text: numPed, // Texto da variável
                              style: TextStyle(
                                  fontWeight: FontWeight.normal, fontSize: 14),
                              // Estilo para o texto em negrito
                            ),
                          ],
                        ),
                        textAlign: TextAlign.start,
                        //
                      ),
                    )
                  ]),
                ]))),
      );
}
