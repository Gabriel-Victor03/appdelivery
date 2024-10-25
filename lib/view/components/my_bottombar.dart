import 'package:flutter/material.dart';

// Widget da Bottom Navigation Bar personalizado
class MyBottomNavigationBar extends StatelessWidget {
  final void Function(int)? onTabChange; // Função para mudança de abas
  const MyBottomNavigationBar({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
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
  }
}
