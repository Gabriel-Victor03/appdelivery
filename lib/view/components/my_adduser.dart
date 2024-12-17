import 'package:appdelivery/view/controllers/usercontroller.dart';
import 'package:flutter/material.dart';
import 'package:passwordfield/passwordfield.dart';

class MyAdduser extends StatefulWidget {
  const MyAdduser({super.key});

  @override
  State<MyAdduser> createState() => _MyAdduserState();
}

final TextEditingController nome = TextEditingController();
final TextEditingController email = TextEditingController();
final TextEditingController senha = TextEditingController();
final TextEditingController confirmsenha = TextEditingController();

class _MyAdduserState extends State<MyAdduser> {
  String errorMessage = ''; // Para armazenar a mensagem de erro

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: 480,
        height: 440,
        child: Column(
          children: [
            SizedBox(height: 20),
            Container(
              child: Text("Adicionar Usuarios",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
            Divider(indent: 10, endIndent: 10, color: Colors.black),
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
                    width: 260,
                    height: 30,
                    child: TextField(
                      controller: nome,
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
            SizedBox(height: 15),
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
                    width: 260,
                    height: 30,
                    child: TextField(
                      controller: email,
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
            SizedBox(height: 15),
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
                    width: 260,
                    height: 40,
                    child: PasswordField(
                      controller: senha,
                      color: Colors.blue,
                      passwordConstraint: r'.*[@$#!%¨$#.*].*',
                      passwordDecoration: PasswordDecoration(
                        errorStyle: TextStyle(
                            fontSize: 10, color: Colors.red, height: 0.1),
                        inputPadding: EdgeInsets.all(6),
                        inputStyle: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          height: 1,
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
                              width: 2,
                              color: const Color.fromARGB(255, 255, 0, 0)),
                        ),
                      ),
                      errorMessage: '',
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
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
                    width: 260,
                    height: 40,
                    child: PasswordField(
                      color: Colors.blue,
                      controller: confirmsenha,
                      passwordConstraint: r'.*[@$#!%¨$#.*].*',
                      passwordDecoration: PasswordDecoration(
                        errorStyle: TextStyle(
                            fontSize: 12, color: Colors.red, height: 0.1),
                        inputPadding: EdgeInsets.all(6),
                        inputStyle: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          height: 1,
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
                      errorMessage: '',
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),

            // Exibindo a mensagem de erro abaixo dos campos de entrada
            if (errorMessage.isNotEmpty)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  errorMessage,
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                ),
              ),

            Container(
              margin: EdgeInsets.only(left: 145),
              width: 115,
              child: Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.fromLTRB(23, 0, 0, 0),
                    backgroundColor: const Color.fromARGB(255, 33, 221, 33),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusDirectional.circular(13),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      // Resetando a mensagem de erro antes da validação
                      errorMessage = '';

                      if (senha.text == "") {
                        errorMessage = 'Senha está vazia';
                      } else if (confirmsenha.text == "") {
                        errorMessage = 'Confirme sua senha';
                      } else if (confirmsenha.text != senha.text) {
                        errorMessage = 'Sua senha não é semelhante';
                      } else if (nome.text == "") {
                        errorMessage = 'Nome de usuário vazio';
                      } else if (email.text == "") {
                        errorMessage = 'Email está vazio';
                      } else {
                        Usercontroller()
                            .inserirUser(nome.text, senha.text, email.text);
                        nome.clear();
                        senha.clear();
                        email.clear();
                        confirmsenha.clear();
                      }
                    });
                  },
                  child: Row(
                    children: [
                      Icon(Icons.save, color: Colors.white),
                      Text(
                        "Salvar",
                        style: TextStyle(color: Colors.white, fontSize: 16),
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
  }
}
