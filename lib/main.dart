import 'package:flutter/material.dart';
import 'package:appdelivery/view/pages/home_page.dart';
import 'package:appdelivery/view/pages/init_page.dart';
import 'package:appdelivery/view/theme/dark_mode.dart';
import 'package:appdelivery/view/theme/light_mode.dart';
import 'package:carousel_slider/carousel_slider.dart' as cs;

final cs.CarouselSliderController _controller = cs.CarouselSliderController();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MeuApp());
}

class MeuApp extends StatelessWidget {
  MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: InitPage(),
      routes: {
        '/homePage': (context) => HomePage(),
      },
    );
  }
}
