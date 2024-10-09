import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      child: ListView(
        children: [
          DrawerHeader(
            child: Text(
              'Menu',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListTile(
            title: Text(
              'Administração',
              style: TextStyle(
                fontSize: 20,
                color: Color.fromARGB(255, 130, 30, 60),
                fontWeight: FontWeight.bold,
                fontFamily: 'Arial',
              ),
            ),
          ),
          ListTile(
            title: Text(
              'Login',
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
                fontFamily: 'Arial',
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
