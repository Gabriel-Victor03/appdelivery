import 'dart:io';

import 'package:appdelivery/view/components/controllers/category_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class ControllerPd extends GetxController {
  XFile? imagem;
  String? selectedCategory;
  selecionarImagem() async {
    final ImagePicker picker = ImagePicker();
    try {
      XFile? file = await picker.pickImage(source: ImageSource.gallery);
      if (file != null) imagem = file;
      update();
      print("cheguei");
    } catch (e) {
      print(e);
    }
  }

  visualizarCategoria(String? select) {
    selectedCategory = select;
    print("off");
    update();
  }
}

class MyPopupNewproduct extends StatefulWidget {
  const MyPopupNewproduct({super.key});

  @override
  State<MyPopupNewproduct> createState() => _MyPopupNewproductState();
}

class _MyPopupNewproductState extends State<MyPopupNewproduct> {
  List<ParseObject> tasks = [];
  XFile? imagem;
  String? selectedCategory;
  final store = CategoryController();
  TextEditingController taskController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchCategorias();
  }

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
                      backgroundColor: const Color.fromARGB(255, 33, 221, 33),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      side: BorderSide(color: Color.fromARGB(50, 0, 0, 0))),
                  onPressed: () {
                    openDialog();
                    store.getCategoria();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      SizedBox(width: 8),
                      Text(
                        "Adicionar produto",
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

  openDialog() => showDialog(
      context: context,
      builder: (context) => GetBuilder<ControllerPd>(
          init: ControllerPd(),
          builder: (_) {
            return Dialog(
              child: Container(
                  width: 450,
                  height: 450,
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
                        child: Center(
                          child: Text("Adicionar produto",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                        ),
                      ),
                      Divider(
                          indent: 10.0, endIndent: 10.0, color: Colors.black),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Container(
                            width: 131,
                            margin: EdgeInsets.only(left: 26),
                            child: Text(
                              "Categoria",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            child: Text("Preço",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold)),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                              margin: EdgeInsets.fromLTRB(25, 0, 0, 0),
                              child: Container(
                                width: 100,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5)),
                                child: DropdownButton(
                                  value:
                                      _.selectedCategory, // Valor selecionado
                                  hint: Text("Selecione"),
                                  isExpanded: true,
                                  items: tasks.map((ParseObject category) {
                                    return DropdownMenuItem<String>(
                                      value: category.objectId,
                                      child: Text(
                                          category.get<String>('nome') ??
                                              'Categoria sem nome'),
                                    );
                                  }).toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      _.visualizarCategoria(
                                          value); // Atualiza a categoria selecionada
                                    });
                                  },
                                  dropdownColor: Colors.white,
                                ),
                              )),
                          Container(
                            margin: EdgeInsets.fromLTRB(30, 0, 0, 0),
                            width: 130,
                            height: 30,
                            child: TextField(
                              cursorWidth: 1,
                              cursorHeight: 20,
                              textAlign: TextAlign.center,
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 0),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 20, 220, 0),
                        child: Text(
                          "Nome",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        // margin: EdgeInsets.fromLTRB(0, 0, 130, 0),
                        width: 260,
                        height: 30,
                        child: TextField(
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
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 10, 193, 0),
                        child: Text(
                          "Descrição",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        // margin: EdgeInsets.fromLTRB(0, 0, 130, 0),
                        width: 260,
                        height: 60,
                        child: TextField(
                          cursorWidth: 1,
                          cursorHeight: 30,
                          textAlign: TextAlign.center,
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.symmetric(horizontal: 0),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                              margin: EdgeInsets.only(left: 28),
                              width: 100,
                              child: Center(
                                  child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.fromLTRB(13, 0, 0, 0),
                                    backgroundColor:
                                        const Color.fromARGB(255, 0, 4, 255),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadiusDirectional.circular(
                                                5))),
                                child: Row(
                                  children: [
                                    Icon(Icons.add,
                                        size: 14, color: Colors.white),
                                    Text(
                                      "Imagem",
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.white),
                                    )
                                  ],
                                ),
                                onPressed: () => _.selecionarImagem(),
                              ))),
                          SizedBox(
                            width: 43,
                          ),
                          Container(
                              width: 115,
                              child: Center(
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        padding:
                                            EdgeInsets.fromLTRB(23, 0, 0, 0),
                                        backgroundColor: const Color.fromARGB(
                                            255, 33, 221, 33),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadiusDirectional
                                                    .circular(13))),
                                    onPressed: () {},
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.save,
                                          color: Colors.white,
                                        ),
                                        Text(
                                          "Salvar",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16),
                                        ),
                                      ],
                                    )),
                              ))
                        ],
                      ),
                      Container(
                          child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: 250,
                            child: Text(
                              "Arquivo selecionado:",
                              textAlign: TextAlign.start,
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            alignment: Alignment.topCenter,
                            width: 150,
                            height: 50,
                            child: _.imagem != null
                                ? Image.file(File(_.imagem!.path))
                                : Text("Nenhum arquivo selecionado",
                                    style: TextStyle(fontSize: 12)),
                          )
                        ],
                      ))
                    ],
                  )),
            );
          }));

  //precisa importar as depencecias
  // https://pub.dev/packages/image_picker
  fetchCategorias() async {
    final QueryBuilder<ParseObject> query =
        QueryBuilder<ParseObject>(ParseObject('Categoria'));

    var response = await query.query();

    if (response.success && response.results != null) {
      setState(() {
        tasks = response.results!.cast<ParseObject>();
      });
    } else {
      print("Erro ao buscar categorias: ${response.error?.message}");
    }
  }
}
