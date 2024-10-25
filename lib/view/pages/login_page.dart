import 'package:flutter/material.dart';
import 'package:appdelivery/view/components/my_appbar.dart';
// import 'package:appdelivery/view/components/my_drawer.dart';
import 'package:appdelivery/view/components/my_bottombar.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    debugShowCheckedModeBanner:
    false;
    return Scaffold(
      appBar: MyAppBar(),
      // endDrawer: MyDrawer(),
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
              Text(
                'LOGIN', // Texto adicionado no começo
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20), // Espaçamento entre o texto e o TextField

              Text(
                'Nome:', // Título acima do primeiro TextField
                style: TextStyle(fontSize: 16),
              ),
              TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "E-mail",
                    filled: true,
                    fillColor: Colors.white),
              ),
              SizedBox(height: 40), // Espaçamento entre o texto e o TextField
              TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Senha",
                    filled: true,
                    fillColor: Colors.white),
              ),
              SizedBox(height: 40), // Espaçamento entre o texto e o TextField
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/painel_adm');
                  },
                  child: Text("Pressione")),
            ]),
          ),
        ),
      ),
    );
  }
}
