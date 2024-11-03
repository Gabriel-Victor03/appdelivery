import 'package:appdelivery/main.dart';
// import 'package:appdelivery/view/components/my_drawer.dart';
// import 'package:appdelivery/view/components/my_bottombar.dart';
// import 'package:appdelivery/view/components/my_appbar.dart';

import 'package:flutter/material.dart';

// void main() {
//   runApp(SacolaPage());
// }

class SacolaPage extends StatefulWidget {
  const SacolaPage({super.key});

  @override
  State<SacolaPage> createState() => _SacolaPageState();
}

class _SacolaPageState extends State<SacolaPage> {
  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   home: Scaffold(appBar: MyAppBar('S A C O L A')));
    return const Scaffold(
      // appBar: MyAppBar('S A C O L A'),
      // drawer: MyDrawer(),
      body: Center(child: Text("Sacola")),
    );
  }
}
