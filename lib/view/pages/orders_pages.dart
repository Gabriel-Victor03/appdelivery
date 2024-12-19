import 'package:appdelivery/view/components/my_appbar.dart';
import 'package:appdelivery/view/components/my_table.dart';
import 'package:appdelivery/view/controllers/order_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersPages extends StatefulWidget {
  const OrdersPages({super.key});

  @override
  State<OrdersPages> createState() => _OrdersPagesState();
}

class _OrdersPagesState extends State<OrdersPages> {
  final store = OrderController();
  List<Map<String, String>> orders = [];
  @override
  void initState() {
    super.initState();
    setState(() {
      _loadPedidos();
    });
  }

  void _loadPedidos() async {
    List<Map<String, String>> dados = await store.fetchOrders();

    setState(() {
      orders = dados;
    });
  }

  // String? nome;
  // final List<Map<String, String>> pedidos = [
  //   {
  //     "numero": "0001",
  //     "hora": "19:37",
  //     "nome": "Adauto Turíbio",
  //     "qtd": "2",
  //     "nome_Produto": "Jatinha com picanha",
  //     "adicionais": "1x bacon, 2x cheeder",
  //     "obs": "Sem tomate, alface, repolho e couve",
  //     "tipo_entrega": "Delivery",
  //     "endereco": "Rua 01, Centro"
  //   },
  //   /* String pedido,
  //         String horario,
  //         String nome,
  //         String quantidade,
  //         String nome_Produto,
  //         String obs,
  //         String tipo_entre,
  //         String endereco)*/

  //   {
  //     "numero": "0002",
  //     "hora": "20:15",
  //     "nome": "Gabriel Vitor",
  //     "qtd": "20",
  //     "nome_Produto": "X-SALADA",
  //     "adicionais": "1x bacon, 2x cheeder, 3x tomate",
  //     "obs": "Sem alface",
  //     "tipo_entrega": "Delivery",
  //     "endereco": "Rua 01, Centro"
  //   },

  //   {
  //     "numero": "0003",
  //     "hora": "21:00",
  //     "nome": "Come Tulio",
  //     "qtd": "20",
  //     "nome_Produto": "x Burguer",
  //     "obs": "Sem tomate",
  //     "tipo_entrega": "Delivery",
  //     "endereco": "Rua 01, Centro"
  //   },
  //   {
  //     "numero": "0004",
  //     "hora": "22:30",
  //     "nome": "Rafael Feitosa",
  //     "qtd": "3",
  //     "nome_Produto": "x Burguer",
  //     "obs": "Sem tomate",
  //     "tipo_entrega": "Delivery",
  //     "endereco": "Rua 01, Centro"
  //   },
  //   {
  //     "numero": "0005",
  //     "hora": "22:31",
  //     "nome": "Eric Ferreira",
  //     "qtd": "1",
  //     "nome_Produto": "x Burguer",
  //     "obs": "Sem tomate",
  //     "tipo_entrega": "Delivery",
  //     "endereco": "Rua 01, Centro"
  //   },
  // ];

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
                        Expanded(child: Icon(Icons.checklist)),
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
                    itemCount: orders.length,
                    itemBuilder: (context, index) {
                      final order = orders[index];
                      return Container(
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 255, 229, 184)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                                child: Checkbox(
                                    // arrumar a função do checkbox
                                    value: false,
                                    onChanged: (value) => {
                                          // setState(() {
                                          //   // value = true;
                                          //   showDialog(
                                          //       context: context,
                                          //       builder: (context) =>
                                          //           removerItemCategoria(
                                          //               pedidos[index]["nome"]
                                          //                   .toString()));
                                          // }),
                                          // nome = pedidos[index]["nome"].toString(),
                                        })),
                            Expanded(
                                child: Text(orders[index]["id"]!,
                                    textAlign: TextAlign.center)),
                            Expanded(
                                child: Text(orders[index]["date"]!,
                                    textAlign: TextAlign.center)),
                            Expanded(
                                child: Text(orders[index]["name"]!,
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
                                          orders[index]['id'].toString(),
                                          // orders[index]["hora"].toString(),
                                          orders[index]['name'].toString(),
                                          // orders[index]['qtd'].toString(),
                                          // orders[index]['nome_Produto'].toString(),
                                          // orders[index]['adicionais'].toString().toString(),
                                          // orders[index]['obs'].toString(),
                                          // orders[index]['tipo_entrega']
                                          // .toString(),
                                          // orders[index]['endereco']
                                          // .toString()
                                          orders[index]['phone'].toString(),
                                          orders[index]['total'].toString(),
                                          orders[index]['status'].toString());
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
          String id,
          // String horario,
          String name,
          // String quantidade,
          // String nome_Produto,
          // String add,
          // String obs,
          // String tipo_entre,
          String phone,
          // String deliveryTypeId,
          // String sacolaId,
          // String paymentMethod,
          String total,
          String status
          // String endereco
          ) =>
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
                              text: id, // Texto da variável
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
                          // children: <TextSpan>[
                          //   TextSpan(
                          //     text: "Horario: ",
                          //     style: TextStyle(
                          //       fontWeight: FontWeight.bold,
                          //       fontSize: 20,
                          //     ), // Estilo normal
                          //   ),
                          //   TextSpan(
                          //     text: horario, // Texto da variável
                          //     style: TextStyle(
                          //         fontWeight: FontWeight.normal, fontSize: 20),
                          //     // Estilo para o texto em negrito
                          //   ),
                          // ],
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
                              text: name, // Texto da variável
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
                                                    // child: Text(
                                                    //   quantidade,
                                                    //   textAlign:
                                                    //       TextAlign.center,
                                                    //   style: TextStyle(
                                                    //       fontSize: 12),
                                                    child: Text(
                                                      '0',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          fontSize: 12),
                                                    )),

                                                Container(
                                                    width: 60,
                                                    margin: EdgeInsets.fromLTRB(
                                                        10, 0, 0, 0),
                                                    child:
                                                        // Text(nome_Produto,
                                                        //   textAlign:
                                                        //     TextAlign.center,
                                                        //   style: TextStyle(
                                                        //     fontSize: 12))
                                                        Text('teste',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                                fontSize: 12))),

                                                //VerticalDivider(color: Colors.b,),
                                                Container(
                                                    margin: EdgeInsets.fromLTRB(
                                                        5, 0, 0, 0),
                                                    width: 65,
                                                    //padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                                                    child: Text('0',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                            fontSize: 12))),
                                                Container(
                                                  margin: EdgeInsets.fromLTRB(
                                                      5, 0, 13, 0),
                                                  width: 65,
                                                  //margin: EdgeInsets.only(right: 1000),
                                                  child: Text('Tudo ok',
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
                                        text: "Delivery", // Texto da variável
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
                                        text: 'Rua 01', // Texto da variável
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
  // removerItemCategoria(String categoriaNome) {
  //   return showDialog(
  //       context: context,
  //       builder: (context) => Dialog(
  //             shape: RoundedRectangleBorder(
  //               borderRadius: BorderRadiusDirectional.circular(10),
  //             ),
  //             backgroundColor: Colors.white,
  //             child: Container(
  //               width: 450,
  //               height: 225,
  //               child: Column(
  //                 children: [
  //                   SizedBox(height: 20),
  //                   Text(
  //                     "Remover Categoria",
  //                     style:
  //                         TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
  //                   ),
  //                   Divider(color: Colors.black, indent: 10.0, endIndent: 10.0),
  //                   SizedBox(height: 15),
  //                   Container(
  //                     alignment: Alignment.topCenter,
  //                     width: 270,
  //                     child: RichText(
  //                       text: TextSpan(
  //                         style: TextStyle(fontSize: 24, color: Colors.black),
  //                         children: <TextSpan>[
  //                           TextSpan(
  //                             text:
  //                                 "Tem certeza que deseja remover a categoria ",
  //                             style: TextStyle(
  //                               fontWeight: FontWeight.normal,
  //                               fontSize: 18,
  //                             ),
  //                           ),
  //                           TextSpan(
  //                             text: nome,
  //                             style: TextStyle(
  //                               fontWeight: FontWeight.bold,
  //                               fontSize: 18,
  //                             ),
  //                           ),
  //                         ],
  //                       ),
  //                       textAlign: TextAlign.center,
  //                     ),
  //                   ),
  //                   SizedBox(height: 30),
  //                   Row(
  //                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                     children: [
  //                       ElevatedButton(
  //                         style: ElevatedButton.styleFrom(
  //                           backgroundColor: Colors.white,
  //                           shape: RoundedRectangleBorder(
  //                             borderRadius: BorderRadius.circular(12),
  //                             side: BorderSide(
  //                                 color: Color.fromARGB(86, 0, 0, 0)),
  //                           ),
  //                         ),
  //                         onPressed: () {
  //                           Navigator.of(context).pop(); // Fecha o diálogo
  //                         },
  //                         child: Text(
  //                           "Cancelar",
  //                           style:
  //                               TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
  //                         ),
  //                       ),
  //                       ElevatedButton(
  //                         style: ElevatedButton.styleFrom(
  //                           backgroundColor: Color.fromARGB(255, 211, 35, 23),
  //                           shape: RoundedRectangleBorder(
  //                             borderRadius: BorderRadius.circular(12),
  //                           ),
  //                         ),
  //                         onPressed: () {
  //                           //store.getCategoria(); // Chama a função para remover a categoria
  //                           Navigator.of(context).pop(); // Fecha o diálogo

  //                           ScaffoldMessenger.of(context).showSnackBar(
  //                             SnackBar(
  //                               content:
  //                                   Text('Categoria removida com sucesso!'),
  //                               duration: Duration(
  //                                   seconds:
  //                                       1), // Tempo que o SnackBar ficará visível
  //                             ),
  //                           );
  //                         },
  //                         child: Text(
  //                           "Sim",
  //                           style: TextStyle(
  //                             color: Colors.white,
  //                             fontSize: 16,
  //                             fontWeight: FontWeight.bold,
  //                           ),
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ));
  // }
}
