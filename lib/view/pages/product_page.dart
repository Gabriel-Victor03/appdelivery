import 'package:appdelivery/view/components/my_table.dart';
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
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              "Produtos",
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.w700),
            ),
          ),
        ),
        body: Column(
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
                            side:
                                BorderSide(color: Color.fromARGB(50, 0, 0, 0))),
                        onPressed: () {
                          GestureDetector(
                            onTap: () => CupertinoAlertDialog(
                              actions: [
                                Container(
                                    decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            255, 255, 0, 0)
                                            ),
                                    child: TextField(
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: 'Enter a search term',
                                      ),
                                    )),
                              ],
                            ),
                          );
                        },
                        child: Row(
                          children: [
                            Positioned(
                                right: 110,
                                child: Container(
                                    child: Icon(
                                  Icons.edit,
                                  color:
                                      const Color.fromARGB(255, 255, 255, 255),
                                ))),
                            Positioned(
                                child: Text(
                              "Editar Categorias",
                              style: TextStyle(
                                  color:
                                      const Color.fromARGB(255, 255, 255, 255)),
                            ))
                          ],
                        )))),
          ],
        ),
      ),
    );
  }
}
