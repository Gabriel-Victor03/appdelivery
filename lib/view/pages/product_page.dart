import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:appdelivery/view/components/my_drawer.dart';
import 'package:appdelivery/view/components/my_appbar.dart';

void main() {
  runApp(ProductPage());
}

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: MyAppBar(),
        // endDrawer: MyDrawer(),
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
              ),
            ],
          ),
        ),
      );

  Future openDialog() => showDialog(
        context: context,
        builder: (context) => Dialog(
          child: Container(
            width: 450,
            height: 400,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  child: Center(
                    child: Text(
                      "Editar Categoria",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Divider(indent: 10.0, endIndent: 10.0, color: Colors.black),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 20, 165, 0),
                  child: Text(
                    "Categorias",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 100,
                  child: SingleChildScrollView(
                    child: Wrap(
                      children: [
                        Row(children: [
                          Padding(
                            padding: EdgeInsets.only(left: 30),
                            child: Text(
                              "Hambúrguer",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.delete,
                                color: Colors.white, size: 15),
                            color: Colors.red,
                            padding: EdgeInsets.zero,
                          ),
                        ]),
                        Divider(
                            indent: 1.0, endIndent: 1.0, color: Colors.black),
                      ],
                    ),
                  ),
                ),
                Text("Nova Categoria"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 200,
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
                          iconColor: Colors.white),
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
