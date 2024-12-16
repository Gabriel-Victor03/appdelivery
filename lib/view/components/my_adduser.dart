import 'package:flutter/material.dart';
import 'package:passwordfield/passwordfield.dart';

class MyAdduser extends StatefulWidget {
  const MyAdduser({super.key});

  @override
  State<MyAdduser> createState() => _MyAdduserState();
}

class _MyAdduserState extends State<MyAdduser> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: Container(
            width: 480,
            height: 470,
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
                        child: Text("Senha",
                            textAlign: TextAlign.left,
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      Container(
                        // margin: EdgeInsets.fromLTRB(0, 0, 130, 0),
                        width: 260,
                        height: 40,
                        child: PasswordField(
                          color: Colors.blue,
                          passwordConstraint: r'.*[@$#.*].*',
                          passwordDecoration: PasswordDecoration(
                            hintStyle: TextStyle(
                              fontSize: 20, // Aumentando o tamanho da dica
                              color: const Color.fromARGB(255, 0, 0, 0),
                            ),
                            errorStyle: TextStyle(
                                fontSize: 16, // Tamanho do texto do erro
                                color: Colors.red,
                                height: 0.1 // Cor do texto de erro
                                ),
                            inputPadding: EdgeInsets.all(6),
                            inputStyle: TextStyle(
                              fontSize:
                                  14, // Aumentando o tamanho do texto da senha
                              color: Colors.black,
                              height: 1, // Cor do texto da senha
                            ),
                          ),
                          hintText: 'Use caracteres especiais',
                          border: PasswordBorder(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: const Color.fromARGB(255, 0, 0, 0),
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: const Color.fromARGB(255, 0, 0, 0),
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                  width: 5,
                                  color: const Color.fromARGB(255, 255, 0, 0)),
                            ),
                          ),
                        ),
                      )
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
                        child: Text("Confirma senha",
                            textAlign: TextAlign.left,
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      Container(
                        // margin: EdgeInsets.fromLTRB(0, 0, 130, 0),
                        width: 260,
                        height: 40,
                        child: PasswordField(
                          color: Colors.blue,
                          passwordConstraint: r'.*[@$#.*].*',
                          passwordDecoration: PasswordDecoration(
                            hintStyle: TextStyle(
                              fontSize: 20, // Aumentando o tamanho da dica
                              color: const Color.fromARGB(255, 0, 0, 0),
                            ),
                            errorStyle: TextStyle(
                                fontSize: 16, // Tamanho do texto do erro
                                color: Colors.red,
                                height: 0.1 // Cor do texto de erro
                                ),
                            inputPadding: EdgeInsets.all(6),
                            inputStyle: TextStyle(
                              fontSize:
                                  14, // Aumentando o tamanho do texto da senha
                              color: Colors.black,
                              height: 1, // Cor do texto da senha
                            ),
                          ),
                          hintText: 'Insira novamente',
                          border: PasswordBorder(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: const Color.fromARGB(255, 0, 0, 0),
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: const Color.fromARGB(255, 0, 0, 0),
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                  width: 2,
                                  color: const Color.fromARGB(255, 255, 0, 0)),
                            ),
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
            )));
  }
}
