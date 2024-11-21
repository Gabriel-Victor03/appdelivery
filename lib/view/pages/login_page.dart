import 'package:appdelivery/view/components/my_bottombar.dart';
import 'package:flutter/material.dart';
import 'package:appdelivery/view/components/my_drawer.dart';
import 'package:appdelivery/view/components/my_appbar.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    debugShowCheckedModeBanner:
    false;
    return Scaffold(
      appBar: const MyAppBar(),
      body: Center(
        child: Container(
          height: 350,
          width: 400,
          decoration: BoxDecoration(
            //Podemos utilizar a tag decoration para mudarmos a aparência do container
            color: Color.fromARGB(255, 255, 229, 184),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(children: [
              TextField(
                controller: usernameController,
                decoration: InputDecoration(labelText: 'Username'),
              ),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
              ElevatedButton(
                onPressed: () => login(context),
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
}

void login(BuildContext context) async {
    final response = await ParseUser .login(
      usernameController.text,
      passwordController.text,
    );

    if (response.success) {
      // Redirecionar para o painel ADM
      Navigator.pushReplacementNamed(context, '/adminPanel');
    } else {
      // Exibir mensagem de erro
      print(response.error.message);
    }
  }

  void continueWithoutLogin(BuildContext context) {
    // Redirecionar para o painel sem login
    Navigator.pushReplacementNamed(context, '/home');
  }
}
