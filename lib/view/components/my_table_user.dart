import 'package:appdelivery/view/components/my_adduser.dart';
import 'package:appdelivery/view/components/my_deleteProd.dart';
import 'package:appdelivery/view/components/my_editUser.dart';
import 'package:appdelivery/view/controllers/usercontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Controller extends GetxController {
  final List<Map<String, String>> usuarios = [
    {"nome": "Atendente1", "email": "atendente1@gmail.com", "senha": "1235463"},
    {"nome": "Atendente2", "email": "atendente2@gmail.com", "senha": "1235463"},
    {"nome": "Cozinha1", "email": "cozinha1@gmail.com", "senha": "1235463"},
    {"nome": "Cozinha2", "email": "cozinha2@gmail.com", "senha": "1235463"},
    {"nome": "UserAdm", "email": "useradm@gmail.com", "senha": "1235463"},

    // Adicione mais pedidos aqui conforme necessário
  ];
}

class MyTableUser extends StatefulWidget {
  const MyTableUser({super.key});

  @override
  State<MyTableUser> createState() => _MyTableUserState();
}

class _MyTableUserState extends State<MyTableUser> {
  final store = Usercontroller();
  List<Map<String, String>> users = [];
  @override
  void initState() {
    super.initState();
    setState(() {
      _loadProdutos();
    });
  }

  void _loadProdutos() async {
    List<Map<String, String>> dados = await store.getUser();

    // Aqui você pode atualizar o estado do seu widget com os dados obtidos
    setState(() {
      users = dados;
      // isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Controller>(
        init: Controller(),
        builder: (_) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 30),
                  Center(
                    child: Text(
                      "Usuários",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border:
                            Border.all(color: Colors.black), // Borda principal
                      ),
                      child: Column(
                        children: [
                          // Cabeçalho
                          Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 130, 30, 60),
                              border: Border(
                                bottom:
                                    BorderSide(color: Colors.black, width: 1),
                              ),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    'NOME',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    'EMAIL',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    'AÇÕES',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // ListView de usuários
                          ListView.builder(
                            shrinkWrap: true,
                            physics:
                                NeverScrollableScrollPhysics(), // Impede o scroll duplicado com SingleChildScrollView
                            itemCount: users.length,
                            itemBuilder: (context, index) {
                              final user = users[index];
                              return Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            user["username"]!,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(fontSize: 14),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 1,
                                        color: Colors.black, // Divisor vertical
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            user["email"]!,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(fontSize: 14),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 1,
                                        color: Colors.black, // Divisor vertical
                                      ),
                                      Expanded(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Color.fromARGB(
                                                    255, 130, 30, 60),
                                                padding: EdgeInsets.all(3),
                                                maximumSize: Size(25, 25),
                                                minimumSize: Size(5, 5),
                                              ),
                                              onPressed: () {
                                                showDialog(
                                                    context: context,
                                                    builder: (builder) =>
                                                        MyEdituser(
                                                            id: user["Objectid"]
                                                                .toString(),
                                                            nome:
                                                                user['username']
                                                                    .toString(),
                                                            email: user['email']
                                                                .toString()));
                                              },
                                              child: Icon(
                                                Icons.edit_rounded,
                                                color: Colors.white,
                                                size: 18,
                                              ),
                                            ),
                                            SizedBox(width: 8),
                                            ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    const Color.fromARGB(
                                                        255, 255, 17, 0),
                                                padding: EdgeInsets.all(3),
                                                maximumSize: Size(25, 25),
                                                minimumSize: Size(5, 5),
                                              ),
                                              onPressed: () {
                                                showDialog(
                                                    context: context,
                                                    builder: (builder) =>
                                                        MyDeleteprod(
                                                            nome:
                                                                user['username']
                                                                    .toString(),
                                                            id: user['Objectid']
                                                                .toString()));
                                              },
                                              child: Icon(
                                                Icons.delete,
                                                color: Colors.white,
                                                size: 18,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  if (user.length == user.length + 1)
                                    Divider(
                                        color:
                                            Colors.black), // Divisor horizontal
                                ],
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
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
                                    backgroundColor:
                                        const Color.fromARGB(255, 33, 221, 33),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                    ),
                                    side: BorderSide(
                                        color: Color.fromARGB(50, 0, 0, 0))),
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) => MyAdduser());
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
                                      "Adicionar usuarios",
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
                  )),
                ],
              ),
            ),
          );
        });
  }
  /*Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Center(
                                        child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor: Color.fromARGB(
                                                    255, 130, 30, 60),
                                                padding: EdgeInsets.all(3),
                                                maximumSize: Size(20, 20),
                                                minimumSize: Size(2, 2)),
                                            onPressed: () {
                                              editarUsuarios(
                                                  "Jantinha",
                                                  "Prato feito com picanha e salada",
                                                  "Arroz branco, Feijão tropeiro, mandioca, 100 gramas de picanha e salada de tomate",
                                                  26.00);
                                            },
                                            child: Transform.rotate(
                                                angle: 1.64159,
                                                child: Icon(
                                                  Icons.search,
                                                  color: Colors.white,
                                                  size: 15,
                                                )))),
                                    Center(
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  const Color.fromARGB(
                                                      255, 255, 17, 0),
                                              padding: EdgeInsets.all(3),
                                              maximumSize: Size(20, 20),
                                              minimumSize: Size(2, 2)),
                                          onPressed: () {
                                            removerItem(
                                                "Prato feito com picanha e salada");
                                          },
                                          child: Icon(
                                            Icons.delete,
                                            color: Colors.white,
                                            size: 15,
                                          )),
                                    )
                                  ],
                                ),*/
}
