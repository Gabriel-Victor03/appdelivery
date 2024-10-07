import 'package:appdelivery/view/pages/home/home_page.dart';
import 'package:appdelivery/view/pages/init_page.dart';
import 'package:appdelivery/view/theme/dark_mode.dart';
import 'package:appdelivery/view/theme/light_mode.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart' as cs;

final cs.CarouselSliderController _controller = cs.CarouselSliderController();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MeuApp());
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const InitPage(),
      theme: lighMode,
      darkTheme: darkMode,
      routes: const {
        '/login': (context) => LoginPage(),
        '/homePage': (context) => const HomePage(),
      },
    );
  }
}