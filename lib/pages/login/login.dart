import 'package:flutter/material.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MeuApp();
  }
}

class MeuApp extends StatefulWidget {
  const MeuApp({super.key});

  @override
  State<MeuApp> createState() => _MeuAppState();
}

class _MeuAppState extends State<MeuApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 130, 30, 60),
          foregroundColor: Colors.white,
        ),
        endDrawer: const Drawer(
          backgroundColor:
              Color.fromARGB(255, 255, 229, 184), //Podemos mudar a cor de fundo
          // child: DrawerHeader(
          //     // decoration: FlutterLogoDecoration(textColor: Colors.white)
          //     //podemos adicionar o cabeçalho como um 'filho' do Drawer
          //     ),
        ),
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
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const Text(
                    'LOGIN',  // Texto adicionado no começo
                    style: TextStyle(
                      fontSize: 18, 
                      fontWeight: FontWeight.bold
                     ),
                    ),
                  SizedBox(height: 20),  // Espaçamento entre o texto e o TextField

                  const Text(
                    'Nome:',  // Título acima do primeiro TextField
                    style: TextStyle(fontSize: 16),
                  ),
                  const TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "E-mail",
                        filled: true,
                        fillColor: Colors.white),
                  ),
                  SizedBox(height: 40),  // Espaçamento entre o texto e o TextField
                  const TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Senha",
                        filled: true,
                        fillColor: Colors.white),
                  ),
                  SizedBox(height: 40),  // Espaçamento entre o texto e o TextField
                  ElevatedButton(
                    onPressed: () {  }, 
                    child: const Text("Pressione")),
              ]),
            ),
          ),
        )
      ),
    );
  }
}
