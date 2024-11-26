import 'package:appdelivery/view/components/my_appbar.dart';
import 'package:flutter/material.dart';

class OrdersPages extends StatefulWidget {
  const OrdersPages({super.key});

  @override
  State<OrdersPages> createState() => _OrdersPagesState();
}

class _OrdersPagesState extends State<OrdersPages> {
  List<String> produtos = ["xburguer", "coca-cola"];

  final List<Map<String, String>> pedidos = [
    {
      "numero": "0001",
      "hora": "19:37",
      "nome": "Adauto Turíbio",
      "qtd": "2",
      "nome_Produto": "Jatinha com picanha",
      "adicionais": "1x bacon, 2x cheeder",
      "obs": "Sem tomate, alface, repolho e couve",
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
      "qtd": "20",
      "nome_Produto": "X-SALADA",
      "adicionais": "1x bacon, 2x cheeder, 3x tomate",
      "obs": "Sem alface",
      "tipo_entrega": "Delivery",
      "endereco": "Rua 01, Centro"
    },

    {
      "numero": "0003",
      "hora": "21:00",
      "nome": "Come Tulio",
      "qtd": "20",
      "nome_Produto": "x Burguer",
      "obs": "Sem tomate",
      "tipo_entrega": "Delivery",
      "endereco": "Rua 01, Centro"
    },
    {
      "numero": "0004",
      "hora": "22:30",
      "nome": "Rafael Feitosa",
      "qtd": "3",
      "nome_Produto": "x Burguer",
      "obs": "Sem tomate",
      "tipo_entrega": "Delivery",
      "endereco": "Rua 01, Centro"
    },
    {
      "numero": "0005",
      "hora": "22:31",
      "nome": "Eric Ferreira",
      "qtd": "1",
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
      body: Column(
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
                                style: TextStyle(fontWeight: FontWeight.bold))),
                        Expanded(
                            child: Text('HORÁRIO',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontWeight: FontWeight.bold))),
                        Expanded(
                            child: Text('NOME',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontWeight: FontWeight.bold))),
                        Expanded(
                            child: Text('DETALHES',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontWeight: FontWeight.bold))),
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
                                          pedidos[index]['numero'].toString(),
                                          pedidos[index]["hora"].toString(),
                                          pedidos[index]['nome'].toString(),
                                          pedidos[index]['qtd'].toString(),
                                          pedidos[index]['nome_Produto']
                                              .toString(),
                                          pedidos[index]['adicionais']
                                              .toString()
                                              .toString(),
                                          pedidos[index]['obs'].toString(),
                                          pedidos[index]['tipo_entrega']
                                              .toString(),
                                          pedidos[index]['endereco']
                                              .toString());
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
    );
  }

  //tulio:
// IDEIAS DE LISTAGEM: FAZ UMA LISTAGEM A PARTIR DO NUMERO DO PEDIDO DA PESSOA, ASSIM FICARÁ MAIS FACIL DE RETORNAR TODOS OS DADOS DAQUELE PEDIDO!!!!!!!!!!1
  Future openDetails(
          String numPed,
          String horario,
          String nome,
          String quantidade,
          String nome_Produto,
          String add,
          String obs,
          String tipo_entre,
          String endereco) =>
      showDialog(
        context: context,
        builder: (context) => Dialog(
            //elevation: 2.0,
            child: Container(
                width: 520, // lçargura do pop-up
                height: 340,
                child: ListView(children: [
                  Column(children: [
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 240,
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
                                fontSize: 20,
                              ), // Estilo normal
                            ),
                            TextSpan(
                              text: numPed, // Texto da variável
                              style: TextStyle(
                                  fontWeight: FontWeight.normal, fontSize: 20),
                              // Estilo para o texto em negrito
                            ),
                          ],
                        ),
                        textAlign: TextAlign.start,
                        //
                      ),
                    ),
                    Container(
                      width: 240,
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(
                              fontSize: 24,
                              color:
                                  Colors.black), // Estilo padrão para o texto
                          children: <TextSpan>[
                            TextSpan(
                              text: "Horario: ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ), // Estilo normal
                            ),
                            TextSpan(
                              text: horario, // Texto da variável
                              style: TextStyle(
                                  fontWeight: FontWeight.normal, fontSize: 20),
                              // Estilo para o texto em negrito
                            ),
                          ],
                        ),
                        textAlign: TextAlign.start,
                        //
                      ),
                    ),
                    Container(
                      width: 240,
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(
                              fontSize: 24,
                              color:
                                  Colors.black), // Estilo padrão para o texto
                          children: <TextSpan>[
                            TextSpan(
                              text: "Cliente: ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ), // Estilo normal
                            ),
                            TextSpan(
                              text: nome, // Texto da variável
                              style: TextStyle(
                                  fontWeight: FontWeight.normal, fontSize: 20),
                              // Estilo para o texto em negrito
                            ),
                          ],
                        ),
                        textAlign: TextAlign.start,
                        //
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(
                      indent: 10,
                      endIndent: 10,
                      color: Colors.black,
                    ),
                    Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Container(
                          // Borda para o container

                          child: Column(
                            children: [
                              // Cabeçalho
                              Container(
                                width:
                                    450, // largura da listagem de pedidos daquele cliente
                                padding: EdgeInsets.fromLTRB(3, 0, 20, 0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 30,
                                      padding: EdgeInsets.only(left: 13),
                                      child: Text("Qt",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14)),
                                    ),
                                    Container(
                                        child: Text('Produto',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14))),
                                    Container(
                                        child: Text('Add',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14))),
                                    Container(
                                        //margin: EdgeInsets.only(right: 30),
                                        child: Text('Observações',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14))),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Column(children: [
                                SizedBox(
                                    height: 100,
                                    width: 300,
                                    child: SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          Container(
                                            width: 260,
                                            padding:
                                                EdgeInsets.fromLTRB(0, 0, 5, 0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Container(
                                                    margin: EdgeInsets.fromLTRB(
                                                        11, 0, 5, 0),
                                                    child: Text(
                                                      quantidade,
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          fontSize: 12),
                                                    )),

                                                Container(
                                                    width: 60,
                                                    margin: EdgeInsets.fromLTRB(
                                                        10, 0, 0, 0),
                                                    child: Text(nome_Produto,
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                            fontSize: 12))),

                                                //VerticalDivider(color: Colors.b,),
                                                Container(
                                                    margin: EdgeInsets.fromLTRB(
                                                        5, 0, 0, 0),
                                                    width: 65,
                                                    //padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                                                    child: Text(add,
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                            fontSize: 12))),
                                                Container(
                                                  margin: EdgeInsets.fromLTRB(
                                                      5, 0, 13, 0),
                                                  width: 65,
                                                  //margin: EdgeInsets.only(right: 1000),
                                                  child: Text(obs,
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          fontSize: 11)),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Divider(
                                            indent: 0.8,
                                            endIndent: 0.8,
                                            color: Colors.black,
                                          )
                                        ],
                                      ),
                                    )),
                              ]),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                width: 240,
                                child: RichText(
                                  text: TextSpan(
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors
                                            .black), // Estilo padrão para o texto
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: "Entrega: ",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ), // Estilo normal
                                      ),
                                      TextSpan(
                                        text: tipo_entre, // Texto da variável
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 14),
                                        // Estilo para o texto em negrito
                                      ),
                                    ],
                                  ),
                                  //textAlign: TextAlign.start,
                                  //
                                ),
                              ),
                              Container(
                                width: 240,
                                child: RichText(
                                  text: TextSpan(
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors
                                            .black), // Estilo padrão para o texto
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: "Endereço: ",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ), // Estilo normal
                                      ),
                                      TextSpan(
                                        text: endereco, // Texto da variável
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 14),
                                        // Estilo para o texto em negrito
                                      ),
                                    ],
                                  ),
                                  //textAlign: TextAlign.start,
                                  //
                                ),
                              )
                            ],
                          ),
                        ))
                  ])
                ]))),
      );
}
