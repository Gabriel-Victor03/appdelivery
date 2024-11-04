import 'package:flutter/material.dart';

class MyPopupProduct extends StatefulWidget {
  const MyPopupProduct({super.key});

  @override
  State<MyPopupProduct> createState() => _MyPopupProductState();
}

class _MyPopupProductState extends State<MyPopupProduct> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: IntrinsicHeight(
            child: Column(
              children: [
                SizedBox(height: 10),
                Center(
                  child: SizedBox(
                    width: 200,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          elevation: 2.0,
                          backgroundColor:
                              const Color.fromARGB(255, 0, 26, 255),
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
                ),
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
            height: 300,
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
                  height: 80,
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
                                  onPressed: () {},
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
                                  onPressed: () {},
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
                                  onPressed: () {},
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
                                  onPressed: () {},
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
                                  onPressed: () {},
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(30, 0, 0, 0),
                      width: 120,
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
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          padding: EdgeInsets.fromLTRB(10, 5, 10, 10),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          maximumSize: Size(50, 30),
                          minimumSize: Size(20, 5)),
                      onPressed: () {},
                      child: Icon(Icons.check, color: Colors.white, size: 20),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
}
