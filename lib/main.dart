import 'package:appdelivery/components/my_appbar.dart';
import 'package:appdelivery/components/my_drawer.dart';
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
        drawer: MyDrawer(),
        
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
        body: Container(
          padding:
              EdgeInsets.only(top: 10.0), // Espaço entre o AppBar e o carrossel
          margin: EdgeInsets.zero,
          child: cs.CarouselSlider(
            options: cs.CarouselOptions(
              height: 250.0, // Altura ajustada do carrossel
              viewportFraction: 0.9, // Exibe um pouco do próximo slide
              autoPlay: true, // Ativa a troca automática de slides
              autoPlayInterval: Duration(seconds: 4), // Troca a cada 4 segundos
              autoPlayCurve:
                  Curves.easeInOut, // Adiciona uma animação suave na transição
            ),
            items: [
              'assets/images/slider1.png',
              'assets/images/slider2.png',
            ].map((imagePath) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(
                        horizontal: 8.0), // Espaçamento entre os slides
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius:
                          BorderRadius.circular(20.0), // Bordas arredondadas
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 5.0,
                          spreadRadius: 2.0,
                          offset: Offset(
                              2, 2), // Sombra leve para destacar o carrossel
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                          20.0), // Aplica o arredondamento nas imagens
                      child: Image.asset(
                        imagePath,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
