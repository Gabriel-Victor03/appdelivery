import 'package:appdelivery/view/components/my_cards.dart';
import 'package:appdelivery/view/components/my_drawer.dart';
import 'package:appdelivery/view/components/my_bottombar.dart';
import 'package:appdelivery/view/components/my_appbar.dart';
import 'package:appdelivery/view/components/my_slider.dart';
import 'package:appdelivery/view/pages/painel_adm.dart';
import 'package:appdelivery/view/pages/login_page.dart';
import 'package:appdelivery/view/pages/product_page.dart';
import 'package:appdelivery/view/pages/sacola_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List _pages = [
    //homepage
    const HomePage(),

    //Profile
    const LoginPage(),

    const Paineladministrativo(),

    const SacolaPage(),

    const ProductPage()
  ];
  // Função para executar ações quando uma aba for clicada
  // void _onTabChange(int index) {
  //   setState(() {
  //     _currentIndex = index; // Atualiza o índice da aba selecionada
  //   });

  //   // Verifica qual aba foi clicada e navega para a rota correspondente
  //   if (index == 0) {
  //     Navigator.pushNamed(context, '/homepage'); // Página de Cardápio
  //   } else if (index == 1) {
  //     Navigator.pushNamed(context, '/sacola'); // Página de Sacola
  //   }
  // }

  void _selectPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      endDrawer: MyDrawer(),
      backgroundColor: const Color.fromARGB(255, 255, 229, 184),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: MyCarouselSlider(),
            ),
            Expanded(
              child: MyCards(),
            )
            // Carrossel exibido
          ],
        ),
      ),
      // bottomNavigationBar: MyBottomNavigationBar(
      //   onTabChange: _onTabChange, // Chama a função ao mudar de aba
      // ),
      bottomNavigationBar: MyBottomNavigationBar(_selectedIndex, _selectPage),
    );
  }
}
