import 'package:flutter/material.dart';

class MyPopupNewproduct extends StatefulWidget {
  const MyPopupNewproduct({super.key});

  @override
  State<MyPopupNewproduct> createState() => _MyPopupNewproductState();
}

class _MyPopupNewproductState extends State<MyPopupNewproduct> {
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
                    openDialog();
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

  Future openDialog() => showDialog(
      context: context,
      builder: (context) => Dialog(
            child: Container(
              width: 450,
              height: 350,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
                    child: Center(
                      child: Text("Adicionar produto",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  Divider(indent: 10.0, endIndent: 10.0, color: Colors.black),
                  Row(
                    children: [
                      Container(
                          width: 20,
                          margin: EdgeInsets.fromLTRB(30, 0, 0, 0),
                          child: Container(
                            width: 80,
                            child: DropdownButton(
                                items: null,
                                onChanged: (value) => (),
                                dropdownColor:
                                    const Color.fromARGB(255, 255, 255, 255)),
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(5)),
                          )),
                      Container(
                          // child: TextField(),
                          )
                    ],
                  )
                ],
              ),
            ),
          ));
}
