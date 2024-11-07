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
                                child: Center(child: Text('X Burguer'))),
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
                                          onPressed: () {},
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
                                    Center(child: Text('Coco-Cola 2 litros'))),
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
                                          onPressed: () {},
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
                                          onPressed: () {},
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
                                          onPressed: () {},
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
                                          onPressed: () {},
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
}
