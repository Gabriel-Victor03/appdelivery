import 'package:flutter/material.dart';

class MyAppbar extends StatelessWidget implements PreferredSizeWidget{
  const MyAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
          backgroundColor: Color.fromARGB(255, 130, 30, 60),
          foregroundColor: Colors.white,
    );
  }
  @override
  Size get preferredSize => const Size.fromHeight(35.0);
}