import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class MyPopupProduct extends StatefulWidget {
  const MyPopupProduct({super.key});

  @override
  State<MyPopupProduct> createState() => _MyPopupProductState();
}

class _MyPopupProductState extends State<MyPopupProduct> {
  List<ParseObject> tasks = [];
  TextEditingController taskController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
        // alignment: AlignmentDirectional(10, 10),
        child: Align(
      alignment: Alignment.topLeft,
      child: IntrinsicHeight(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.only(left: 15),
              child: SizedBox(
                width: 200,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      elevation: 2.0,
                      backgroundColor: const Color.fromARGB(255, 0, 26, 255),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      side: BorderSide(color: Color.fromARGB(50, 0, 0, 0))),
                  onPressed: () {
                    openDialog();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.edit,
                        color: Colors.white,
                      ),
                      SizedBox(width: 8),
                      Text(
                        "Editar Categorias",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }

  Future removerItem(var teste) => showDialog(
      // função de remover itens da categoria
      context: context,
      builder: (context) => Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusDirectional.circular(10)),
            backgroundColor: Colors.white,
            child: Container(
              width: 450,
              height: 225,
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Text(
                      "Remover Categoria",
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
                    height: 15,
                  ),
                  Container(
                    alignment: Alignment.topCenter,
                    width: 270,
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                            fontSize: 24,
                            color: Colors.black), // Estilo padrão para o texto
                        children: <TextSpan>[
                          TextSpan(
                            text:
                                "Tem certeza que deseja remover a categoria ", // O restante do texto
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
                                fontSize: 18), // Estilo para o texto em negrito
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center, //
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
  Future openDialog() => showDialog(
        context: context,
        builder: (context) => Dialog(
          child: Container(
            width: 450,
            height: 405,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
                  child: Center(
                    child: Text(
                      "Editar Categoria",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Divider(indent: 10.0, endIndent: 10.0, color: Colors.black),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 10, 165, 0),
                  child: Text(
                    "Categorias",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 190,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                padding: EdgeInsets.only(left: 8),
                                width: 180,
                                child: Text(
                                  "Hambúrguer",
                                  style: TextStyle(fontSize: 14),
                                ),
                              ),
                              Container(
                                //  padding: EdgeInsets.only(left: 190),
                                child: ElevatedButton(
                                  onPressed: () {
                                    removerItem("Hambúrguer");
                                  },
                                  style: ElevatedButton.styleFrom(
                                    shape: CircleBorder(),
                                    backgroundColor: Colors.red,
                                    padding: EdgeInsets.all(
                                        2), // Espaçamento interno
                                    maximumSize: Size(20, 20),
                                    minimumSize: Size(5, 5),
                                  ),
                                  child: Icon(
                                    Icons.delete,
                                    color: Colors.white,
                                    size: 15,
                                  ),
                                ),
                              ),
                            ]),
                        Divider(
                          indent: 10.0,
                          endIndent: 10.0,
                          color: Colors.black,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                padding: EdgeInsets.only(left: 8),
                                width: 180,
                                child: Text(
                                  "Bebidas",
                                  style: TextStyle(fontSize: 14),
                                ),
                              ),
                              Container(
                                //  padding: EdgeInsets.only(left: 190),
                                child: ElevatedButton(
                                  onPressed: () {
                                    removerItem("Bebidas");
                                  },
                                  style: ElevatedButton.styleFrom(
                                    shape: CircleBorder(),
                                    backgroundColor: Colors.red,
                                    padding: EdgeInsets.all(
                                        2), // Espaçamento interno
                                    maximumSize: Size(20, 20),
                                    minimumSize: Size(5, 5),
                                  ),
                                  child: Icon(
                                    Icons.delete,
                                    color: Colors.white,
                                    size: 15,
                                  ),
                                ),
                              ),
                            ]),
                        Divider(
                          indent: 10.0,
                          endIndent: 10.0,
                          color: Colors.black,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                padding: EdgeInsets.only(left: 8),
                                width: 180,
                                child: Text(
                                  "Sobremessas",
                                  style: TextStyle(fontSize: 14),
                                ),
                              ),
                              Container(
                                //  padding: EdgeInsets.only(left: 190),
                                child: ElevatedButton(
                                  onPressed: () {
                                    removerItem("Sobremessas");
                                  },
                                  style: ElevatedButton.styleFrom(
                                    shape: CircleBorder(),
                                    backgroundColor: Colors.red,
                                    padding: EdgeInsets.all(
                                        2), // Espaçamento interno
                                    maximumSize: Size(20, 20),
                                    minimumSize: Size(5, 5),
                                  ),
                                  child: Icon(
                                    Icons.delete,
                                    color: Colors.white,
                                    size: 15,
                                  ),
                                ),
                              ),
                            ]),
                        Divider(
                          indent: 10.0,
                          endIndent: 10.0,
                          color: Colors.black,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                padding: EdgeInsets.only(left: 8),
                                width: 180,
                                child: Text(
                                  "Combos",
                                  style: TextStyle(fontSize: 14),
                                ),
                              ),
                              Container(
                                //  padding: EdgeInsets.only(left: 190),
                                child: ElevatedButton(
                                  onPressed: () {
                                    removerItem("Combos");
                                  },
                                  style: ElevatedButton.styleFrom(
                                    shape: CircleBorder(),
                                    backgroundColor: Colors.red,
                                    padding: EdgeInsets.all(
                                        2), // Espaçamento interno
                                    maximumSize: Size(20, 20),
                                    minimumSize: Size(5, 5),
                                  ),
                                  child: Icon(
                                    Icons.delete,
                                    color: Colors.white,
                                    size: 15,
                                  ),
                                ),
                              ),
                            ]),
                        Divider(
                          indent: 10.0,
                          endIndent: 10.0,
                          color: Colors.black,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                padding: EdgeInsets.only(left: 8),
                                width: 180,
                                child: Text(
                                  "Jantinhas",
                                  style: TextStyle(fontSize: 14),
                                ),
                              ),
                              Container(
                                //  padding: EdgeInsets.only(left: 190),
                                child: ElevatedButton(
                                  onPressed: () {
                                    removerItem("Jantinhas");
                                  },
                                  style: ElevatedButton.styleFrom(
                                    shape: CircleBorder(),
                                    backgroundColor: Colors.red,
                                    padding: EdgeInsets.all(
                                        2), // Espaçamento interno
                                    maximumSize: Size(20, 20),
                                    minimumSize: Size(5, 5),
                                  ),
                                  child: Icon(
                                    Icons.delete,
                                    color: Colors.white,
                                    size: 15,
                                  ),
                                ),
                              ),
                            ]),
                        Divider(
                          indent: 10.0,
                          endIndent: 10.0,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 20, 153, 0),
                  child: Text("Nova Categoria"),
                ),
                // Aqui começa adicionar a categoria
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(30, 0, 0, 0),
                      width: 120,
                      height: 30,
                      child: TextField(
                        controller: taskController,
                        cursorWidth: 1,
                        cursorHeight: 20,
                        textAlign: TextAlign.center,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.symmetric(horizontal: 0),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          padding: EdgeInsets.fromLTRB(10, 5, 10, 10),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          maximumSize: Size(50, 30),
                          minimumSize: Size(20, 5)),
                      onPressed: addCategoria,
                      child: Icon(Icons.check, color: Colors.white, size: 20),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );

  Future<void> addCategoria() async {
    String task = taskController.text.trim();
    if (task.isNotEmpty) {
      var categoria = ParseObject('Categoria')..set('nome', task);

      var response = await categoria.save();

      if (response.success) {
        setState(() {
          tasks.add(categoria);
          print("Enviou");
        });
        taskController.clear();
      } else {
        print("Erro");
      }
    }
  }
}
