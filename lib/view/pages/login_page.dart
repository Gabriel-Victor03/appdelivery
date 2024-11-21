import 'package:appdelivery/view/components/my_bottombar.dart';
import 'package:flutter/material.dart';
import 'package:appdelivery/view/components/my_drawer.dart';
import 'package:appdelivery/view/components/my_appbar.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});
  final TextEditingController controllerUsername = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      body: Center(
        child: Container(
          height: 350,
          width: 400,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 255, 229, 184),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(children: [
              TextField(
                controller: widget.controllerUsername, // Acessando o controlador corretamente
                decoration: InputDecoration(labelText: 'Username'),
              ),
              TextField(
                controller: widget.controllerPassword, // Acessando o controlador corretamente
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
              ElevatedButton(
                onPressed: () => doUserLogin(), // Chamando a função de login
                child: Text('Login'),
              ),
              TextButton(
                onPressed: () => continueWithoutLogin(context),
                child: Text('Continuar sem login'),
              ),
            ]),
          ),
        ),
      ),
    );
  }

  void doUserLogin() async {
    final username = widget.controllerUsername.text.trim(); // Acessando o controlador corretamente
    final password = widget.controllerPassword.text.trim(); // Acessando o controlador corretamente

    final user = ParseUser (username, password, null);

    var response = await user.login();

    if (response.success) {
      // Redirecionar para o painel ADM
      // Navigator.pushReplacementNamed(context, '/painel_adm');
      print("sucesso");
    } else {
      // Exibir mensagem de erro
      print(response.error?.message ?? 'Erro desconhecido');
    }
  }

  void continueWithoutLogin(BuildContext context) {
    // Redirecionar para o painel sem login
    Navigator.pushReplacementNamed(context, '/home');
  }
}