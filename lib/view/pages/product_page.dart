import 'dart:js_interop';

import 'package:appdelivery/view/components/my_table.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
              width: 400,
              height: 300,
              child: Stack(
                children: [
                  Positioned(
                      left: 125,
                      top: 10,
                      child: Text(
                        'Editar Categoria',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22),
                      )),
                  Positioned(
                      //top: 5,
                      left: 25,
                      top: 40,
                      width: 350,
                      child: Divider(
                        color: Colors.black,
                        indent: 1,
                      )),
                  Positioned(
                      left: 45,
                      top: 180,
                      child: Text(
                        "Categoria",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      )),
                  Positioned(
                    left: 45,
                    top: 200,
                    width: 150,
                    child: TextField(
                      cursorColor: const Color.fromARGB(255, 0, 0, 0),
                      autofocus: false,
                      decoration: InputDecoration(
                        fillColor: Color.fromARGB(255, 0, 150, 255),
                        // icon: Icon(Icons.import_contacts),
                      ),
                    ),
                  ),
                  Positioned(
                      left: 220,
                      top: 220,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            //shape: Border(bottom: 10, top: 10, left: 20, right: 20)
                          ),
                          onPressed: () {},
                          child: Icon(
                            Icons.check,
                            color: const Color.fromARGB(255, 255, 255, 255),
                          )))
                ],
              ),
            ),
            //Positioned()
          ));
}
