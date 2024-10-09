import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart' as cs;

final cs.CarouselSliderController _controller = cs.CarouselSliderController();

class MyCarouselSlider extends StatelessWidget {
  MyCarouselSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start, // Mantém o conteúdo no topo
      children: [
        Expanded(
          child: cs.CarouselSlider(
            options: cs.CarouselOptions(
              height: 250.0, // Altura ajustada do carrossel
              viewportFraction: 0.9, // Exibe um pouco do próximo slide
              autoPlay: true, // Ativa a troca automática de slides
              autoPlayInterval: Duration(seconds: 4), // Troca a cada 4 segundos
              autoPlayCurve: Curves.easeInOut, // Animação suave na transição
              enlargeCenterPage: true, // Dá um destaque ao slide central
              aspectRatio: 16 / 9, // Ajuste para o formato das imagens
              onPageChanged: (index, reason) {
                // Atualiza o estado do índice da página aqui, se necessário
              },
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
                          BorderRadius.circular(15.0), // Bordas arredondadas
                      boxShadow: [
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
                          15.0), // Aplica o arredondamento nas imagens
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
        // Indicadores abaixo do carrossel
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(2, (index) {
            return Container(
              width: 8.0,
              height: 8.0,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey, // Ajuste a cor conforme necessário
              ),
            );
          }),
        ),
      ],
    );
  }
}
