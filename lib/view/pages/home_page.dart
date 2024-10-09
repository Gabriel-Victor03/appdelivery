import 'package:appdelivery/view/components/my_drawer.dart';
import 'package:appdelivery/view/components/my_bottombar.dart';
import 'package:appdelivery/view/components/my_appbar.dart';
import 'package:appdelivery/view/components/my_slider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Função para executar ações quando uma aba for clicada
  void _onTabChange(int index) {
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      drawer: MyDrawer(),
      body: Center(
        child: Column(
          children: [
            MyCarouselSlider(), // Carrossel exibido
          ],
        ),
      ),
      bottomNavigationBar: MyBottomNavigationBar(
        onTabChange: _onTabChange, // Chama a função ao mudar de aba
      ),
    );
  }
}
