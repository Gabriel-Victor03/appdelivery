import 'package:appdelivery/view/components/my_cards.dart';
import 'package:appdelivery/view/components/my_drawer.dart';
import 'package:appdelivery/view/components/my_bottombar.dart';
import 'package:appdelivery/view/components/my_appbar.dart';
import 'package:appdelivery/view/components/my_slider.dart';
import 'package:appdelivery/view/pages/painel_adm.dart';
import 'package:appdelivery/view/pages/login_page.dart';
import 'package:appdelivery/view/pages/product_page.dart';
import 'package:appdelivery/view/pages/cart_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    SingleChildScrollView(
      child: Column(
        children: [
          MyCarouselSlider(),
          SizedBox(height: 10), // Espaço entre o slider e os cards
          MyCards(),
        ],
      ),
    ),
    const CartPage(),
    const LoginPage(),
    const Paineladministrativo(),
    const ProductPage(),
  ];

  void _selectPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      endDrawer: const MyDrawer(),
      backgroundColor: const Color.fromARGB(255, 255, 229, 184),
      body: _pages[_selectedIndex],
      bottomNavigationBar: MyBottomNavigationBar(
        _selectedIndex,
        _selectPage,
      ),
    );
  }
}
