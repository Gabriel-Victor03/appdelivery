import 'package:appdelivery/view/controllers/addProduct_controller.dart';

import 'package:flutter/material.dart';

class MyDeleteprod extends StatefulWidget {
  final String? nome;
  final String? id;
  const MyDeleteprod({super.key, this.nome, this.id});

  @override
  State<MyDeleteprod> createState() => _MyDeleteprodState();
}

class _MyDeleteprodState extends State<MyDeleteprod> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.circular(10)),
      backgroundColor: Colors.white,
      child: Container(
        width: 450,
        height: 230,
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              child: Text(
                "Remover produto",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            Divider(
              color: Colors.black,
              indent: 10.0,
              endIndent: 10.0,
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 60,
              child: SingleChildScrollView(
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.black), // Estilo padrão para o texto
                    children: <TextSpan>[
                      TextSpan(
                        text:
                            "Tem certeza que deseja remover o produto ", // O restante do texto
                        //textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 18,
                        ), // Estilo normal
                      ),
                      TextSpan(
                        text: "${widget.nome}?", // Texto da variável
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18), // Estilo para o texto em negrito
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center, //
                ),
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
                                    color: const Color.fromARGB(86, 0, 0, 0)))),
                        onPressed: () {
                          AddproductController()
                              .removerProduto(widget.id.toString());
                        },
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
                        onPressed: () {
                          AddproductController()
                              .removerProduto(widget.id.toString());
                        },
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
    );
  }
}
