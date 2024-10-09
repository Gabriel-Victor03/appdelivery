import 'package:flutter/material.dart';

class MyProgressIndicator extends StatelessWidget {
  final String text;
  const MyProgressIndicator({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.all(60.0),
          child: Stack(
            alignment:
                Alignment.center, // Centraliza a imagem sobre o indicador
            children: [
              CircularProgressIndicator(), // Indicador de progresso
              ClipRRect(
                child: Image.asset(
                  'lib/images/appIcon.png',
                  height: 80,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}
