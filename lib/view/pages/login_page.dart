import 'package:appdelivery/view/components/my_bottombar.dart';
import 'package:flutter/material.dart';
import 'package:appdelivery/view/components/my_drawer.dart';
import 'package:appdelivery/view/components/my_appbar.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  const keyApplicationId = 'XWN5AL2fKOQXxKnSnAdeLGHvx68NakUwPMhHTk1B';
  const keyClientKey = 'x2iLiWANqMLd1MRnotpzyyxLoJEJrTuVd2HkS3K1';
  const keyParseServerUrl = 'https://parseapi.back4app.com';

  await Parse().initialize(keyApplicationId, keyParseServerUrl,
      clientKey: keyClientKey, debug: true);

  var firstObject = ParseObject('FirstClass')..set('message', 'teste');
  await firstObject.save();

  print("done");
}
class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController controllerUsername = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();
  bool isLoggedIn = false;

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
                controller: controllerUsername, // Acessando o controlador corretamente
                enabled: !isLoggedIn,
                keyboardType: TextInputType.text,
                textCapitalization: TextCapitalization.none,
                autocorrect: false,
                decoration: InputDecoration(labelText: 'Username'),
              ),
              TextField(
                controller: controllerPassword, // Acessando o controlador corretamente
                enabled: !isLoggedIn,
                keyboardType: TextInputType.text,
                textCapitalization: TextCapitalization.none,
                autocorrect: false,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
              ElevatedButton(
                onPressed: isLoggedIn || isLoading ? null : () => doUserLogin(),
                child: isLoading ? CircularProgressIndicator() : Text('Login'),

              ),
            ]),
          ),
        ),
      ),
    );
  }

void showSuccess(String message) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("Success!"),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            child: const Text("OK"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

void showError(String errorMessage) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("Error!"),
        content: Text(errorMessage),
        actions: <Widget>[
          TextButton(
            child: const Text("OK"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
bool isLoading = false; // Variável para controlar o estado de carregamento

void doUserLogin() async {
  setState(() {
    isLoading = true; // Começa o carregamento
  });

  final username = controllerUsername.text.trim();
  final password = controllerPassword.text.trim();

  final user = ParseUser (username, password, null);

  var response = await user.login();

  setState(() {
    isLoading = false; // Para o carregamento
  });

  if (response.success) {
    // Redirecionar para o painel ADM
    Navigator.pushReplacementNamed(context, '/painel_adm');
  } else {
    // Exibir mensagem de erro usando SnackBar
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(response.error?.message ?? 'Erro desconhecido'),
        duration: Duration(seconds: 3),
      ),
    );
  }
}
}