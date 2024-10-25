import 'package:flutter/material.dart';

/// Flutter code sample for [Table].

void main() => runApp(const MyTable());

class MyTable extends StatefulWidget {
  const MyTable({super.key});

  @override
  State<MyTable> createState() => _MyTableState();
}

class _MyTableState extends State<MyTable> {
  TableRow _tableRow = TableRow(children: <Widget>[
    Padding(
      padding: EdgeInsets.all(5.0),
      child: Checkbox(
        tristate: true,
        value: isChecked,
        onChanged: (bool? value) {},
      ),
    ),
    Padding(
      padding: EdgeInsets.all(10.0),
      child: Text("Categoria"),
    ),
    Padding(
      padding: EdgeInsets.all(10.0),
      child: Text("Nome"),
    ),
    Padding(
      padding: EdgeInsets.all(10.0),
      child: Text("Ações"),
    )
  ]);

  static get isChecked => null;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: Center(
          child: Table(
            border: TableBorder.all(borderRadius: BorderRadius.circular(8)),
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: [
              const TableRow(children: [
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("text1"),
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("text2  "),
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("text3"),
                  ),
                ),
              ]),
              
            ],
          ),
          
        ),
       
        
        ));
  }
}
//https://www.youtube.com/watch?v=xjPHI4kBcwQ
