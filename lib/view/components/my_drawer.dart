// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Drawer: Drawer(
      // backgroundColor: Color.fromARGB(255, 255, 255, 255),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          ListTile(
            title: Text(
              'Administração',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 130, 30, 60),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextButton(
              onPressed: () {
                // Ação do botão de Login
              },
              style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                backgroundColor: Colors.transparent, // Remove o fundo
              ),
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.start, // Alinha o conteúdo à esquerda
                children: [
                  Icon(Icons.login, color: Colors.black), // Ícone de login
                  SizedBox(width: 8), // Espaço entre o ícone e o texto
                  Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontFamily: 'Arial',
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            title: Text(
              'Endereço',
              style: TextStyle(
                fontSize: 20,
                color: Color.fromARGB(255, 130, 30, 60),
                fontWeight: FontWeight.bold,
                fontFamily: 'Arial',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'GO-154, km 218 - Zona Rural, Ceres - GO, 76300-000',
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
                fontFamily: 'Arial',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
