import 'package:flutter/material.dart';

// Widget da Bottom Navigation Bar personalizado
class MyBottomNavigationBar extends StatelessWidget {
  /*final void Function(int)? onTabChange; // Função para mudança de abas
  const MyBottomNavigationBar({super.key, required this.onTabChange});*/

  int _selectedIndex = 0;
  ValueChanged<int> _selectPage;
  MyBottomNavigationBar(this._selectedIndex, this._selectPage, {super.key});

  @override
  /*Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Color.fromRGBO(255, 245, 248, 1),
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.restaurant_outlined, color: Colors.black),
          label: 'Cardápio',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_bag),
          label: 'Sacola',
        ),
      ],
      onTap: onTabChange, // Chama a função quando o usuário toca em uma aba
    );
  }*/

  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      backgroundColor: Color.fromRGBO(255, 245, 248, 1),
      unselectedItemColor: Colors.grey,
      selectedItemColor: Colors.black,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.restaurant_outlined, color: Colors.black),
          label: 'Cardápio',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_bag),
          label: 'Sacola',
        ),
      ],
      onTap: _selectPage,
    );
  }
}
