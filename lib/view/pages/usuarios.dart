import 'package:appdelivery/view/components/my_appbar.dart';
import 'package:appdelivery/view/components/my_table_user.dart';
import 'package:flutter/material.dart';

class Usuarios extends StatefulWidget {
  const Usuarios({super.key});

  @override
  State<Usuarios> createState() => _UsuariosState();
}

class _UsuariosState extends State<Usuarios> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: MyTableUser(),
    );
  }
}
