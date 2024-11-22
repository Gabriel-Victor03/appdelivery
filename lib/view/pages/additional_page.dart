import 'package:appdelivery/view/components/my_table.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:appdelivery/view/components/my_appbar.dart';

class AdditionalPage extends StatefulWidget {
  const AdditionalPage({super.key});

  @override
  State<AdditionalPage> createState() => _AdditionalPageState();
}

class _AdditionalPageState extends State<AdditionalPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: MyAppBar(),
        // body: MyTable(),
      );
}
