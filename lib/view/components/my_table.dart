import 'package:appdelivery/view/components/my_popup_Product.dart';
import 'package:appdelivery/view/components/my_popup_newproduct.dart';
import 'package:flutter/material.dart';

/// Flutter code sample for [Table].

void main() => runApp(const MyTable());

class MyTable extends StatefulWidget {
  const MyTable({super.key});

  @override
  State<MyTable> createState() => _MyTableState();
}

class _MyTableState extends State<MyTable> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: SingleChildScrollView(
                child: Column(children: [
          SizedBox(
            height: 30,
          ),
          Center(
            child: Text(
              "Produtos",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
              padding: const EdgeInsets.all(16.0),
              child: Table(
                  border:
                      TableBorder.all(borderRadius: BorderRadius.circular(3)),
                  // Adiciona borda em torno da tabela
                  columnWidths: {
                    0: FlexColumnWidth(
                        0.3), // Define a largura da primeira coluna
                    1: FlexColumnWidth(
                        0.8), // Define a largura da segunda coluna
                    2: FlexColumnWidth(
                        0.7), // Define a largura da terceira coluna
                    3: FlexColumnWidth(0.8),
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
                              child: Icon(Icons.check_box)),
                        ),
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Text(
                                'CATEGORIA',
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
                                'AÇÕES',
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
                              child: Checkbox(
                                  value: false, onChanged: (value) => {})),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Center(child: Text('Hámburguer')),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(6),
                            child: Container(
                                child: Center(child: Text('X Burguer Duplo'))),
                          ),
                          Padding(
                              padding: const EdgeInsets.fromLTRB(5, 5, 3, 2),
                              child: Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Center(
                                        child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor: Color.fromARGB(
                                                    255, 130, 30, 60),
                                                padding: EdgeInsets.all(3),
                                                maximumSize: Size(28, 28),
                                                minimumSize: Size(5, 5)),
                                            onPressed: () {},
                                            child: Transform.rotate(
                                                angle: 1.64159,
                                                child: Icon(
                                                  Icons.search,
                                                  color: Colors.white,
                                                  size: 15,
                                                )))),
                                    Center(
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.red,
                                              padding: EdgeInsets.all(3),
                                              maximumSize: Size(20, 20),
                                              minimumSize: Size(2, 2)),
                                          onPressed: () {
                                            removerItem("X Burguer Duplo");
                                          },
                                          child: Icon(
                                            Icons.delete,
                                            color: Colors.white,
                                            size: 15,
                                          )),
                                    )
                                  ],
                                ),
                              ))
                        ]),
                    TableRow(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 255, 229, 184),
                        ),
                        children: [
                          Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Checkbox(
                                  value: false, onChanged: (value) => {})),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(5, 5, 3, 2),
                            child: Center(child: Text('Bebidas')),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(6),
                            child: Container(
                                child:
                                    Center(child: Text('Coca-Cola 2 litros'))),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(top: 0),
                              child: Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Center(
                                        child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor: Color.fromARGB(
                                                    255, 130, 30, 60),
                                                padding: EdgeInsets.all(3),
                                                maximumSize: Size(20, 20),
                                                minimumSize: Size(2, 2)),
                                            onPressed: () {},
                                            child: Transform.rotate(
                                                angle: 1.64159,
                                                child: Icon(
                                                  Icons.search,
                                                  color: Colors.white,
                                                  size: 15,
                                                )))),
                                    Center(
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.red,
                                              padding: EdgeInsets.all(3),
                                              maximumSize: Size(20, 20),
                                              minimumSize: Size(2, 2)),
                                          onPressed: () {
                                            removerItem("Coca-Cola 2 litros");
                                          },
                                          child: Icon(
                                            Icons.delete,
                                            color: Colors.white,
                                            size: 15,
                                          )),
                                    )
                                  ],
                                ),
                              )),
                        ]),
                    TableRow(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 255, 229, 184),
                        ),
                        children: [
                          Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Checkbox(
                                  value: false, onChanged: (value) => {})),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(5, 5, 3, 2),
                            child: Center(child: Text('Bebidas')),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(6),
                            child: Center(child: Text('Fanta Lata')),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(top: 0),
                              child: Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Center(
                                        child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor: Color.fromARGB(
                                                    255, 130, 30, 60),
                                                padding: EdgeInsets.all(3),
                                                maximumSize: Size(20, 20),
                                                minimumSize: Size(2, 2)),
                                            onPressed: () {},
                                            child: Transform.rotate(
                                                angle: 1.64159,
                                                child: Icon(
                                                  Icons.search,
                                                  color: Colors.white,
                                                  size: 15,
                                                )))),
                                    Center(
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.red,
                                              padding: EdgeInsets.all(3),
                                              maximumSize: Size(20, 20),
                                              minimumSize: Size(2, 2)),
                                          onPressed: () {
                                            removerItem("Fanta Lata");
                                          },
                                          child: Icon(
                                            Icons.delete,
                                            color: Colors.white,
                                            size: 15,
                                          )),
                                    )
                                  ],
                                ),
                              )),
                        ]),
                    TableRow(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 255, 229, 184),
                        ),
                        children: [
                          Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Checkbox(
                                  value: false, onChanged: (value) => {})),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(5, 5, 3, 2),
                            child: Center(child: Text('sobremessa')),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(6),
                            child: Center(child: Text('Sorvete Napolitano')),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(top: 0),
                              child: Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Center(
                                        child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor: Color.fromARGB(
                                                    255, 130, 30, 60),
                                                padding: EdgeInsets.all(3),
                                                maximumSize: Size(20, 20),
                                                minimumSize: Size(2, 2)),
                                            onPressed: () {},
                                            child: Transform.rotate(
                                                angle: 1.64159,
                                                child: Icon(
                                                  Icons.search,
                                                  color: Colors.white,
                                                  size: 15,
                                                )))),
                                    Center(
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.red,
                                              padding: EdgeInsets.all(3),
                                              maximumSize: Size(20, 20),
                                              minimumSize: Size(2, 2)),
                                          onPressed: () {
                                            removerItem("Sorvete Napolitano");
                                          },
                                          child: Icon(
                                            Icons.delete,
                                            color: Colors.white,
                                            size: 15,
                                          )),
                                    )
                                  ],
                                ),
                              )),
                        ]),
                    TableRow(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 255, 229, 184),
                        ),
                        children: [
                          Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Checkbox(
                                  value: false, onChanged: (value) => {})),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(5, 5, 3, 2),
                            child: Center(child: Text('Jatinha')),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(6),
                            child:
                                Center(child: Text('Prato feito com picanha')),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(top: 0),
                              child: Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Center(
                                        child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor: Color.fromARGB(
                                                    255, 130, 30, 60),
                                                padding: EdgeInsets.all(3),
                                                maximumSize: Size(20, 20),
                                                minimumSize: Size(2, 2)),
                                            onPressed: () {},
                                            child: Transform.rotate(
                                                angle: 1.64159,
                                                child: Icon(
                                                  Icons.search,
                                                  color: Colors.white,
                                                  size: 15,
                                                )))),
                                    Center(
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  const Color.fromARGB(
                                                      255, 255, 17, 0),
                                              padding: EdgeInsets.all(3),
                                              maximumSize: Size(20, 20),
                                              minimumSize: Size(2, 2)),
                                          onPressed: () {
                                            removerItem(
                                                "Prato feito com picanha e salada");
                                          },
                                          child: Icon(
                                            Icons.delete,
                                            color: Colors.white,
                                            size: 15,
                                          )),
                                    )
                                  ],
                                ),
                              )),
                        ]),
                  ])),
          MyPopupNewproduct(),
          MyPopupProduct(),
        ]))));
  }

  Future removerItem(var teste) => showDialog(
      // função de remover itens do produto
      context: context,
      builder: (context) => Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusDirectional.circular(10)),
            backgroundColor: Colors.white,
            child: Container(
              width: 450,
              height: 230,
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Text(
                      "Remover produto",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Divider(
                    color: Colors.black,
                    indent: 10.0,
                    endIndent: 10.0,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 60,
                    child: SingleChildScrollView(
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(
                              fontSize: 24,
                              color:
                                  Colors.black), // Estilo padrão para o texto
                          children: <TextSpan>[
                            TextSpan(
                              text:
                                  "Tem certeza que deseja remover o produto ", // O restante do texto
                              //textAlign: TextAlign.justify,
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 18,
                              ), // Estilo normal
                            ),
                            TextSpan(
                              text: teste, // Texto da variável
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                      18), // Estilo para o texto em negrito
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center, //
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 15),
                    child: Row(
                      children: [
                        Container(
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadiusDirectional.circular(12),
                                      side: BorderSide(
                                          color: const Color.fromARGB(
                                              86, 0, 0, 0)))),
                              onPressed: () {},
                              child: Text(
                                "Cancelar",
                                style: TextStyle(
                                    color: const Color.fromARGB(255, 0, 0, 0)),
                              )),
                        ),
                        SizedBox(
                          width: 100,
                        ),
                        Container(
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromARGB(255, 211, 35, 23),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12))),
                              onPressed: () {},
                              child: Center(
                                child: Text(
                                  "Sim",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              )),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ));
}
