import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 16.0), // Adiciona espaço no topo
            child: ListTile(
              title: Text(
                'Administração',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 130, 30, 60),
                ),
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.login,
              color: Colors.black,
            ),
            title: Text("Login", style: TextStyle(color: Colors.black)),
            onTap: () {
              Navigator.pushNamed(context, '/login');
            },
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
            padding: EdgeInsets.only(left: 16.0),
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
