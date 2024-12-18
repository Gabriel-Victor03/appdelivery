import 'package:flutter/material.dart';

class MyEdituser extends StatefulWidget {
  final String nome;
  final String email;
  const MyEdituser({super.key, this.nome = '', this.email = ''});

  @override
  State<MyEdituser> createState() => _MyEdituserState();
}

class _MyEdituserState extends State<MyEdituser> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
          width: 480,
          height: 310,
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                child: Text("Adicionar Usuarios",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ),
              Divider(
                indent: 10,
                endIndent: 10,
                color: Colors.black,
              ),
              Container(
                child: Column(
                  children: [
                    Container(
                      width: 260,
                      child: Text("Nome",
                          textAlign: TextAlign.left,
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    Container(
                      // margin: EdgeInsets.fromLTRB(0, 0, 130, 0),
                      width: 260,
                      height: 30,
                      child: TextField(
                        controller: TextEditingController(text: widget.nome),
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
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                child: Column(
                  children: [
                    Container(
                      width: 260,
                      child: Text("Email",
                          textAlign: TextAlign.left,
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    Container(
                      // margin: EdgeInsets.fromLTRB(0, 0, 130, 0),
                      width: 260,
                      height: 30,
                      child: TextField(
                        cursorWidth: 1,
                        cursorHeight: 30,
                        controller: TextEditingController(text: widget.email),
                        textAlign: TextAlign.center,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.symmetric(horizontal: 0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                  margin: EdgeInsets.only(left: 145),
                  width: 115,
                  child: Center(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.fromLTRB(23, 0, 0, 0),
                            backgroundColor:
                                const Color.fromARGB(255, 33, 221, 33),
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadiusDirectional.circular(13))),
                        onPressed: () {
                          
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.save,
                              color: Colors.white,
                            ),
                            Text(
                              "Salvar",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ],
                        )),
                  ))
            ],
          )),
    );
  }
}
