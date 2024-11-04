import 'package:appdelivery/view/components/my_popup_Product.dart';
import 'package:appdelivery/view/components/my_table.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:appdelivery/view/components/my_appbar.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: MyAppBar(),
        // endDrawer: MyDrawer(),
        body:
            // MyTable()
            MyPopupProduct(),
      );
}
