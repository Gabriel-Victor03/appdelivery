import 'dart:io';
import 'package:appdelivery/view/controllers/addProduct_controller.dart';
import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class MyAddproduct extends StatefulWidget {
  const MyAddproduct({super.key});

  @override
  State<MyAddproduct> createState() => _MyAddproductState();
}

class _MyAddproductState extends State<MyAddproduct> {
  final store = AddproductController();
  TextEditingController taskController = TextEditingController();
  final TextEditingController descricao = TextEditingController();
  final TextEditingController nome = TextEditingController();
  final TextEditingController preco = TextEditingController();
  @override
  void initState() {
    super.initState();
    store.getCategoria();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
        listenable: store,
        builder: (context, snapshot) {
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
                    Divider(indent: 10.0, endIndent: 10.0, color: Colors.black),
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
                                    store.selectedCategory, // Valor selecionado
                                hint: Text("Selecione"),
                                isExpanded: true,
                                items: store.tasks.map((ParseObject category) {
                                  return DropdownMenuItem<String>(
                                    value: category.objectId,
                                    child: Text(category.get<String>('nome') ??
                                        'Categoria sem nome'),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    store.visualizarCategoria(value); // Atualiza a categoria selecionada
                                    print('Categoria selecionada: $value'); // Imprime o valor da categoria Atualiza a categoria selecionada
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
                            controller: preco,
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
                        controller: nome,
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
                        controller: descricao,
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
                                          BorderRadiusDirectional.circular(5))),
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
                              onPressed: () => store.selecionarImagem(),
                            ))),
                        SizedBox(
                          width: 43,
                        ),
                        Container(
                            width: 115,
                            child: Center(
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      padding: EdgeInsets.fromLTRB(23, 0, 0, 0),
                                      backgroundColor: const Color.fromARGB(
                                          255, 33, 221, 33),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadiusDirectional.circular(
                                                  13))),
                                  onPressed: () async {
                                    if (store.selectedCategory == null) {
                                      print(
                                          'Selecione uma categoria antes de salvar.');
                                      return;
                                    }

                                    if (store.imagem == null) {
                                      print(
                                          'Selecione uma imagem antes de salvar.');
                                      return;
                                    }

                                    await store.inserirProduto(
                                      nome.text,
                                      descricao.text,
                                      preco.text.toString(),
                                      store.selectedCategory,
                                      store.imagem,
                                    );
                                  },
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.save,
                                        color: Colors.white,
                                      ),
                                      Text(
                                        "Salvar",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16),
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
                          child: store.imagem != null
                              ? Image.file(File(store.imagem!.path))
                              : Text("Nenhum arquivo selecionado",
                                  style: TextStyle(fontSize: 12)),
                        )
                      ],
                    ))
                  ],
                )),
          );
        });
  }
}
