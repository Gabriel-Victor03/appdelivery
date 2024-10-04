import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart' as cs;

final cs.CarouselSliderController _controller = cs.CarouselSliderController();

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
          foregroundColor: Colors.white,
        ),
        endDrawer: Drawer(
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
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color.fromRGBO(255, 245, 248, 1),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.restaurant_outlined, color: Colors.black),
              label: 'Cardapio',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag),
              label: 'Sacola',
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              // Adiciona espaço flexível
              child: cs.CarouselSlider(
                options: cs.CarouselOptions(
                    height: 400.0,
                    viewportFraction:
                        1.0), // viewportFraction=1.0 para ocupar toda a tela
                items: [1, 2, 3, 4, 5].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context)
                            .size
                            .width, // Ocupa toda a largura
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          color: Colors.amber,
                        ),
                        child: Image.asset(
                          'assets/images/hamburguer.jpg', // Substitua pelo caminho da sua imagem
                          fit: BoxFit.cover, // Preenche todo o espaço
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
