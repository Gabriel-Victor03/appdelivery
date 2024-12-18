import 'package:appdelivery/view/controllers/usercontroller.dart';
import 'package:flutter/material.dart';

class MyDeleteuser extends StatefulWidget {
  final String usuario;
  final String Object;
  const MyDeleteuser({super.key, this.usuario = '', this.Object = ''});

  @override
  State<MyDeleteuser> createState() => _MyDeleteuserState();
}

class _MyDeleteuserState extends State<MyDeleteuser> {
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
                            "Tem certeza que deseja remover o usuário ", // O restante do texto
                        //textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 18,
                        ), // Estilo normal
                      ),
                      TextSpan(
                        text: widget.usuario + "?", // Texto da variável
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
                        onPressed: () {},
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
                          Usercontroller().deleteTodo(widget.Object);
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
