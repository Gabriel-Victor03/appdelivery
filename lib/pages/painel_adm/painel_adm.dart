import 'dart:ffi';

import 'package:flutter/material.dart';

void main() {
  runApp(Paineladministrativo());
}

class Paineladministrativo extends StatefulWidget {
  const Paineladministrativo({super.key});

  @override
  State<Paineladministrativo> createState() => _PaineladministrativoState();
}

class _PaineladministrativoState extends State<Paineladministrativo> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 130, 30, 60),
            foregroundColor: Colors.white,
          ),
          endDrawer: Drawer(),
          body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Center(
                  child: Text(
                    "Painel Administrativo",
                    style: TextStyle(fontSize: 30),
                  ),
                ),
                Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 255, 229, 184),
                          borderRadius: BorderRadius.circular(10)),
                      width: 350,
                      height: 150,
                    ),
                    Positioned(
                        left: 15,
                        top: 15,
                        child: Container(
                          child: Icon(
                            Icons.content_paste_search_sharp,
                            size: 80,
                          ),
                        )),
                    Positioned(
                      left: 23,
                      top: 100,
                      child: Container(
                        child: Text(
                          "Pedidos",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 255, 229, 184),
                          borderRadius: BorderRadius.circular(10)),
                      width: 350,
                      height: 150,
                    ),
                    Positioned(
                        left: 15,
                        top: 15,
                        child: Container(
                          child: Icon(
                            Icons.content_paste_search_sharp,
                            size: 80,
                          ),
                        )),
                    Positioned(
                      left: 23,
                      top: 100,
                      child: Container(
                        child: Text(
                          "Pedidos",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 255, 229, 184),
                          borderRadius: BorderRadius.circular(10)),
                      width: 350,
                      height: 150,
                    ),
                    Positioned(
                        left: 15,
                        top: 15,
                        child: Container(
                          child: Icon(
                            Icons.content_paste_search_sharp,
                            size: 80,
                          ),
                        )),
                    Positioned(
                      left: 23,
                      top: 100,
                      child: Container(
                        child: Text(
                          "Pedidos",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ],
                ),
              ]),
        ));
  }
}