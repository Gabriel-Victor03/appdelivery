import 'package:appdelivery/view/components/my_popup_Product.dart';
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
          body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Table(
              border: TableBorder.all(), // Adiciona borda em torno da tabela
              columnWidths: {
                0: FlexColumnWidth(0.5), // Define a largura da primeira coluna
                1: FlexColumnWidth(0.8), // Define a largura da segunda coluna
                2: FlexColumnWidth(1), // Define a largura da terceira coluna
                3: FlexColumnWidth(0.8),
              },
              children: [
                TableRow(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(
                        255, 255, 229, 184), // Cor de fundo para o cabeçalho
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
                        child: Text(
                          'CATEGORIA',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'NOME',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'AÇÕES',
                          style: TextStyle(fontWeight: FontWeight.bold),
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
                        padding: const EdgeInsets.all(8.0),
                        child: Text('TESTE'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('TESTE'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('TESTE'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('TESTE'),
                      )
                    ]),
              ]),
        ),
      ])),
    );
  }
}
