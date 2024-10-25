import 'package:appdelivery/view/components/my_cards.dart';
import 'package:appdelivery/view/components/my_drawer.dart';
import 'package:appdelivery/view/components/my_bottombar.dart';
import 'package:appdelivery/view/components/my_appbar.dart';
import 'package:appdelivery/view/components/my_slider.dart';
import 'package:appdelivery/view/pages/painel_adm.dart';
import 'package:appdelivery/view/pages/product_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  // Função para executar ações quando uma aba for clicada
  void _onTabChange(int index) {
    setState(() {
      _currentIndex = index; // Atualiza o índice da aba selecionada
    });

    // Verifica qual aba foi clicada e navega para a rota correspondente
    if (index == 0) {
      Navigator.pushNamed(context, '/homepage'); // Página de Cardápio
    } else if (index == 1) {
      Navigator.pushNamed(context, '/login'); // Página de Sacola
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      endDrawer: MyDrawer(),
      backgroundColor: const Color.fromARGB(255, 255, 229, 184),
      // body: Center(
      //   child: Column(
      //     children: [
      //       Expanded(
      //         child: MyCarouselSlider(),
      //       ),
      //       Expanded(
      //         child: MyCards(),
      //       )
      //       // Carrossel exibido
      //     ],
      //   ),
      // ),
      //body: Paineladministrativo(),
      body: ProductPage(),
      bottomNavigationBar: MyBottomNavigationBar(
        onTabChange: _onTabChange, // Chama a função ao mudar de aba
      ),
    );
  }
}
