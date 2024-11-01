import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

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
        appBar: AppBar(
          title: Center(
            child: Text(
              "Produtos",
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.w700),
            ),
          ),
        ),
        body: IntrinsicHeight(
          child: Column(
            children: [
              //Center(child: MyTable()),
              SizedBox(
                height: 10,
              ),
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
                              side: BorderSide(
                                  color: Color.fromARGB(50, 0, 0, 0))),
                          onPressed: () {
                            openDialog();
                          },
                          child: Row(
                            children: [
                              Positioned(
                                  right: 110,
                                  child: Container(
                                      child: Icon(
                                    Icons.edit,
                                    color: const Color.fromARGB(
                                        255, 255, 255, 255),
                                  ))),
                              Positioned(
                                  child: Text(
                                "Editar Categorias",
                                style: TextStyle(
                                    color: const Color.fromARGB(
                                        255, 255, 255, 255)),
                              ))
                            ],
                          )))),
            ],
          ),
        ),
      );
  Future openDialog() => showAdaptiveDialog(
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
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Divider(
                      //divider que fica abaixo do Editar categoria.
                      indent: 10.0,
                      endIndent: 10.0,
                      color: Colors.black,
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 20, 165, 0),
                      child: Text(
                        "Categorias",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 100,
                      child: SingleChildScrollView(
                        child: Wrap(
                          //scrollDirection: Axis.vertical,
                          // alignment: WrapAlignment.start,
                          children: [
                            Row(children: [
                              Container(
                                padding: EdgeInsets.only(left: 30),
                                //width: ,
                                child: Text(
                                  "Hambúrguer",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal),
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
                            Container(
                              padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
                              child: Divider(
                                indent: 1.0,
                                endIndent: 1.0,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      child: Text("Nova Categoria"),
                    ),
                    Positioned(
                      // top: 50,
                      child: Row(
                        children: [
                          SizedBox(
                            height: 80,
                          ),
                          Container(
                            width: 200,
                            height: 30,
                            padding: EdgeInsets.only(left: 15),
                            child: TextField(
                              cursorWidth: 1,
                              cursorHeight: 20,
                              textAlign: TextAlign.center,
                              cursorColor: const Color.fromARGB(255, 0, 0, 0),
                              //autofocus: false,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 0, vertical: 0),

                                // icon: Icon(Icons.import_contacts),
                              ),
                            ),
                          ),
                          Container(
                            //decoration: BoxDecoration(color: Colors.green),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green,
                                  iconColor: Colors.white),
                              onPressed: () {},
                              child: Center(
                                child: Icon(Icons.check,
                                    color: Colors.white, size: 20),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(10, 0, 10, 5),
                            child: Divider(
                              indent: 1.0,
                              endIndent: 1.0,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
            //Positioned()
          ));
}
