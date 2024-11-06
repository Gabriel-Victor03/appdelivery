import 'package:flutter/material.dart';

class MyBottomNavigationBar extends StatelessWidget {
  int _selectedIndex = 0;
  ValueChanged<int> _selectPage;
  MyBottomNavigationBar(this._selectedIndex, this._selectPage, {super.key});
  // final int currentIndex;
  // final ValueChanged<int> onTap;

  // Construtor com parâmetros nomeados
  // const MyBottomNavigationBar({
  //   Key? key,
  //   required this.currentIndex,
  //   required this.onTap,
  // }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      backgroundColor: const Color.fromRGBO(255, 245, 248, 1),
      unselectedItemColor: Colors.grey,
      selectedItemColor: Colors.black,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.restaurant_outlined),
          label: 'Cardápio',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_bag),
          label: 'Sacola',
        ),
      ],
      onTap: _selectPage, // Chama a função para alterar a página
    );
  }
}
