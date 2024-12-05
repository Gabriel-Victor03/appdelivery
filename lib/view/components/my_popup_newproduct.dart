import 'package:appdelivery/view/controllers/category_controller.dart';
import 'package:appdelivery/view/components/my_addProduct.dart';
import 'package:flutter/material.dart';


class MyPopupNewproduct extends StatefulWidget {
  const MyPopupNewproduct({super.key});

  @override
  State<MyPopupNewproduct> createState() => _MyPopupNewproductState();
}

class _MyPopupNewproductState extends State<MyPopupNewproduct> {
 
  final store = CategoryController();
  

  @override
  Widget build(BuildContext context) {
    return Container(
        // alignment: AlignmentDirectional(10, 10),
        child: Align(
      alignment: Alignment.topLeft,
      child: IntrinsicHeight(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.only(left: 15),
              child: SizedBox(
                width: 200,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      elevation: 2.0,
                      backgroundColor: const Color.fromARGB(255, 33, 221, 33),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      side: BorderSide(color: Color.fromARGB(50, 0, 0, 0))),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) => MyAddproduct());
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      SizedBox(width: 8),
                      Text(
                        "Adicionar produto",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }

  //precisa importar as depencecias
  // https://pub.dev/packages/image_picker
}
