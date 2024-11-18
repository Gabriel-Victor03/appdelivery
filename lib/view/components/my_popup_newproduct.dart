import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';

class MyPopupNewproduct extends StatefulWidget {
  const MyPopupNewproduct({super.key});

  @override
  State<MyPopupNewproduct> createState() => _MyPopupNewproductState();
}

class _MyPopupNewproductState extends State<MyPopupNewproduct> {
  XFile? imagem;

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

  Future openDialog() => showDialog(
      context: context,
      builder: (context) => Dialog(
            child: Container(
                width: 450,
                height: 350,
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
                              child: DropdownButton(
                                  items: null,
                                  onChanged: (value) => (),
                                  dropdownColor:
                                      const Color.fromARGB(255, 255, 255, 255)),
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(5)),
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
                              onPressed: () => selecionarImagem(),
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
                                            color: Colors.white, fontSize: 16),
                                      ),
                                    ],
                                  )),
                            ))
                      ],
                    ),
                  ],
                )),
          ));

  selecionarImagem() async {
    final ImagePicker picker = ImagePicker();
    try {
      XFile? file = await picker.pickImage(source: ImageSource.gallery);
      if (file != null) setState(() => imagem = file);
    } catch (e) {
      print(e);
    }
  }
  //precisa importar as depencecias
  // https://pub.dev/packages/image_picker
}
