import 'package:appdelivery/view/components/my_drawer.dart';
import 'package:appdelivery/view/components/my_bottombar.dart';
import 'package:appdelivery/view/components/my_appbar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? userName = 'asdasda';
  int _selectedIndex = 0; // Declare a variável _selectedIndex

  // Função para mudar o índice quando uma aba é clicada
  void _onTabChange(int index) {
    setState(() {
      _selectedIndex = index; // Atualiza o índice da aba selecionada
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: MyAppBar(), 
      drawer: MyDrawer(),
      body: Center(child: Text(userName.toString())),
      bottomNavigationBar: MyBottomNavigationBar(
        onTabChange: _onTabChange, // Passa a função para mudar a aba
      ),
    );
  }
}
