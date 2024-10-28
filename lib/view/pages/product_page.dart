import 'dart:js_interop';

import 'package:appdelivery/view/components/my_table.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
  Future openDialog() => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Stack(
              children: [
                for (var i = 0; i < 5; i++)
                  SizedBox(
                    height: 200,
                    child: Divider(
                      color: Colors.black,
                    ),
                  ),
                Positioned(
                  child: Container(
                    child: Center(
                      child: Text(
                        "Editar Categorias",
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ),
                Positioned(
                    top: 10,
                    child: Container(
                        child: Divider(
                      color: Colors.black,
                      indent: 10,
                      endIndent: 10,
                    ))),
                Positioned(
                    top: 60,
                    child: Container(
                      child: Text(
                        "Categorias",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 16),
                      ),
                    ))
              ],
            ),
            content: TextField(
              autofocus: true,
              decoration: InputDecoration(
                icon: Icon(Icons.import_contacts),
              ),
            ),
            actions: [
              SizedBox(
                width: 50,
                height: 40,
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 19, 126, 19),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13.0),
                      // Bordas arredondadas
                    ),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.check,
                      color: const Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ));
}
