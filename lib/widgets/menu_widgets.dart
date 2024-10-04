import 'package:flutter/material.dart';

class BottomNavigationMenu extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
 return Container(
  height: 55.0,
  child: BottomAppBar(
    color: Colors.grey[300],
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        IconButton(
          iconSize: 30.0,
          icon: Icon(Icons.account_circle),
          onPressed: () {},
        ),
        IconButton(
          iconSize: 30.0,
          icon: Icon(Icons.favorite_border),
          onPressed: () {},
        ),
      ],
    ),
   ),
  );
 }
}