import 'package:appdelivery/view/controllers/usercontroller.dart';
import 'package:flutter/material.dart';

class MyEdituser extends StatefulWidget {
  final String nome;
  final String email;
  final String id;
  const MyEdituser({super.key, this.nome = '', this.email = '', this.id = ''});

  @override
  State<MyEdituser> createState() => _MyEdituserState();
}

class _MyEdituserState extends State<MyEdituser> {
  // Inicialize o controller com os valores passados pelos parâmetros
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  String errorMessage = '';
  String check = '';
  @override
  void initState() {
    super.initState();
    // Atribua os valores aos controllers
    nomeController.text = widget.nome;
    emailController.text = widget.email;
    errorMessage = '';
    check = "";
  }

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
              child: Text("Adicionar Usuários",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
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
                    width: 260,
                    height: 30,
                    child: TextField(
                      controller: nomeController, // Usando o controller certo
                      cursorWidth: 1,
                      cursorHeight: 30,
                      textAlign: TextAlign.center,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.symmetric(horizontal: 0),
                          hintText: widget.nome),
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
                    width: 260,
                    height: 30,
                    child: TextField(
                      controller: emailController, // Usando o controller certo
                      cursorWidth: 1,
                      cursorHeight: 30,
                      textAlign: TextAlign.center,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.symmetric(horizontal: 0),
                          hintText: widget.email),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            if (errorMessage.isNotEmpty)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  errorMessage,
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                ),
              ),
            if (check.isNotEmpty)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  check,
                  style: TextStyle(
                      color: const Color.fromARGB(255, 60, 255, 0),
                      fontWeight: FontWeight.bold),
                ),
              ),
            SizedBox(
              height: 10,
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
                        setState(() {
                          if (nomeController.text.trim().isEmpty) {
                            errorMessage = "nome não pode ser vazio";
                          } else if (emailController.text.trim().isEmpty) {
                            errorMessage = "email não pode ser vazio";
                          } else {
                            Usercontroller().updateTodo(widget.id,
                                nomeController.text, emailController.text);
                            check = "Usuário atualizado";
                          }
                        });
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.save,
                            color: Colors.white,
                          ),
                          Text(
                            "Salvar",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ],
                      )),
                ))
          ],
        ),
      ),
    );
  }
}
