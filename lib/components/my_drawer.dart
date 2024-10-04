import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Drawer (
      backgroundColor: Colors.white,
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Container(
              //     // alignment: Alignment(-1.0, -2.5),
              //     ),
              Text(
                'Administração',
                style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 130, 30, 60),
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Arial',
                ),
              ),
              Text('Login',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    // fontWeight: FontWeight.bold,
                    fontFamily: 'Arial',
                  )),
              Text(
                'Endereço',
                style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 130, 30, 60),
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Arial',
                ),
              ),
              Text('GO-154, km 218 - Zona Rural, Ceres - GO, 76300-000',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    // fontWeight: FontWeight.bold,
                    fontFamily: 'Arial',
                  ))
            ],
          ),
    );
  }
}