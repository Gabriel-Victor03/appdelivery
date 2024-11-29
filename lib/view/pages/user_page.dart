import 'package:appdelivery/view/components/my_appbar.dart';
import 'package:appdelivery/view/components/my_table_user.dart';
import 'package:flutter/material.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: MyTableUser(),
    );
  }
}
