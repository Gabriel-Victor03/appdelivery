import 'package:appdelivery/view/pages/home/home_page.dart'; // Importe a HomePage
import 'package:flutter/material.dart';

class InitPage extends StatelessWidget {
  const InitPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Navega diretamente para a HomePage
    Future.microtask(() {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    });

    return const Scaffold(
      body: Center(
        child: Text('Carregando...'), // Uma mensagem opcional, pode ser removida
      ),
    );
  }
}
