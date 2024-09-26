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
          backgroundColor: Color.fromARGB(255, 255, 229, 184),
          appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 130, 30, 60),
          ),
          drawer: Drawer(
            backgroundColor: Color.fromARGB(
                255, 255, 229, 184), //Podemos mudar a cor de fundo
            child: DrawerHeader(
                //podemos adicionar o cabeçalho como um 'filho' do Drawer
                child: Icon(
              Icons.favorite,
              size: 48,
            )),
          ),
          bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Color.fromRGBO(
                  255, 245, 248, 1), //Podemos mudar a cor de fundo
              items: [
                //Utilizamos a estrutura items: [] para adiconar os itens
                //Home
                BottomNavigationBarItem(
                  //Cada item é adicionado com essa tag
                  icon: Icon(Icons.restaurant_outlined, color: Colors.black),
                  //podemos trocar os icones
                  label: 'Cardapio', //e a label
                ),
                //Configurações
                BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_bag),
                  label: 'Sacola',
                ),
              ]),
        ));
  }
}
//restaurant_outlined