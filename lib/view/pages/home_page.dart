import 'package:appdelivery/view/components/my_drawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? userName = 'asdasda';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: MyAppBar(),
      drawer: MyDrawer(),
      body: Center(child: Text(userName.toString())),
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (p0) => (),
      ),

      //bottomNavigationBar: BottomNavigationBar(items: []),
    );
  }
}