import 'package:flutter/material.dart';

class MyBottomNavigationBar extends StatelessWidget {
  const MyBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return  BottomNavigationBar(
      backgroundColor: Color.fromRGBO(255, 245, 248, 1),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.restaurant_outlined, color: Colors.black),
              label: 'Cardapio',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag),
              label: 'Sacola',
            ),
          ],
    );
  }
}