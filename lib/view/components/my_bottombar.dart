import 'package:flutter/material.dart';

class MyBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemTapped;

  const MyBottomNavigationBar(this.selectedIndex, this.onItemTapped,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType
          .shifting, // Habilita o efeito de ícone aumentado
      currentIndex: selectedIndex,
      unselectedItemColor: const Color.fromARGB(
          255, 85, 83, 83), // Cor dos ícones não selecionados
      selectedItemColor: Colors.black,

      // Cor do ícone selecionado
      unselectedLabelStyle: const TextStyle(
          color: Color.fromARGB(255, 0, 0, 0),
          fontWeight: FontWeight.bold // Cor do label não selecionado
          ),
      selectedLabelStyle: const TextStyle(
        color: Colors.black, // Cor do label selecionado
      ),
      onTap: onItemTapped, // Função para alterar a página ao clicar

      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.restaurant_outlined),
          label: 'Cardápio',

          backgroundColor:
              Color.fromARGB(255, 255, 255, 255), // Cor de fundo da aba 1
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_bag),
          label: 'Sacola',
          backgroundColor:
              Color.fromARGB(255, 255, 255, 255), // Cor de fundo da aba 2
        ),
      ],
    );
  }
}
