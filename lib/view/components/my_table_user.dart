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
      produtos = dados;
      isLoading = false;
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
                            itemCount: _.usuarios.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            _.usuarios[index]["nome"]!,
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
                                            _.usuarios[index]["email"]!,
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
                                                editarUsuarios(
                                                  usuarios[index]["nome"]!,
                                                  usuarios[index]["email"]!,
                                                  usuarios[index]["senha"]!,
                                                );
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
                                                removerItem(
                                                    _.usuarios[index]['nome']);
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
                                  if (index < _.usuarios.length - 1)
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
                                  criarNovoUsuario();
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

  criarNovoUsuario() => showDialog(
      context: context,
      builder: (context) => Dialog(
            child: Container(
                width: 480,
                height: 390,
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: Text("Adicionar Usuarios",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                    ),
                    Divider(
                      indent: 10,
                      endIndent: 10,
                      color: Colors.black,
                    ),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            width: 260,
                            child: Text("Nome",
                                textAlign: TextAlign.left,
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                          Container(
                            // margin: EdgeInsets.fromLTRB(0, 0, 130, 0),
                            width: 260,
                            height: 30,
                            child: TextField(
                              cursorWidth: 1,
                              cursorHeight: 30,
                              textAlign: TextAlign.center,
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            width: 260,
                            child: Text("Email",
                                textAlign: TextAlign.left,
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                          Container(
                            // margin: EdgeInsets.fromLTRB(0, 0, 130, 0),
                            width: 260,
                            height: 30,
                            child: TextField(
                              cursorWidth: 1,
                              cursorHeight: 30,
                              textAlign: TextAlign.center,
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            width: 260,
                            child: Text("Senha",
                                textAlign: TextAlign.left,
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                          Container(
                            // margin: EdgeInsets.fromLTRB(0, 0, 130, 0),
                            width: 260,
                            height: 30,
                            child: TextField(
                              cursorWidth: 1,
                              cursorHeight: 30,
                              keyboardType: TextInputType.text,
                              textCapitalization: TextCapitalization.none,
                              obscureText: true,
                              textAlign: TextAlign.center,
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            width: 260,
                            child: Text("Confirma senha",
                                textAlign: TextAlign.left,
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                          Container(
                            // margin: EdgeInsets.fromLTRB(0, 0, 130, 0),
                            width: 260,
                            height: 30,
                            child: TextField(
                              cursorWidth: 1,
                              cursorHeight: 30,
                              textAlign: TextAlign.center,
                              cursorColor: Colors.black,
                              keyboardType: TextInputType.text,
                              textCapitalization: TextCapitalization.none,
                              obscureText: true,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                        margin: EdgeInsets.only(left: 145),
                        width: 115,
                        child: Center(
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.fromLTRB(23, 0, 0, 0),
                                  backgroundColor:
                                      const Color.fromARGB(255, 33, 221, 33),
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadiusDirectional.circular(
                                              13))),
                              onPressed: () {},
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.save,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    "Salvar",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                ],
                              )),
                        ))
                  ],
                )),
          ));
  editarUsuarios(String nome, String email, String senha, bool _isObscured) =>
      showDialog(
          context: context,
          builder: (context) => Dialog(
                child: Container(
                    width: 480,
                    height: 390,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          child: Text("Adicionar Usuarios",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                        ),
                        Divider(
                          indent: 10,
                          endIndent: 10,
                          color: Colors.black,
                        ),
                        Container(
                          child: Column(
                            children: [
                              Container(
                                width: 260,
                                child: Text("Nome",
                                    textAlign: TextAlign.left,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                              ),
                              Container(
                                // margin: EdgeInsets.fromLTRB(0, 0, 130, 0),
                                width: 260,
                                height: 30,
                                child: TextField(
                                  controller:
                                      TextEditingController(text: "$nome"),
                                  cursorWidth: 1,
                                  cursorHeight: 30,
                                  textAlign: TextAlign.center,
                                  cursorColor: Colors.black,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 0),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          child: Column(
                            children: [
                              Container(
                                width: 260,
                                child: Text("Email",
                                    textAlign: TextAlign.left,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                              ),
                              Container(
                                // margin: EdgeInsets.fromLTRB(0, 0, 130, 0),
                                width: 260,
                                height: 30,
                                child: TextField(
                                  cursorWidth: 1,
                                  cursorHeight: 30,
                                  controller:
                                      TextEditingController(text: "$email"),
                                  textAlign: TextAlign.center,
                                  cursorColor: Colors.black,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 0),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          child: Column(
                            children: [
                              Container(
                                width: 260,
                                child: Text("Senha",
                                    textAlign: TextAlign.left,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                              ),
                              Container(
                                width: 260,
                                height: 30,
                                child: TextField(
                                  controller:
                                      TextEditingController(text: senha),
                                  cursorWidth: 1,
                                  cursorHeight: 30,
                                  textAlign: TextAlign.center,
                                  cursorColor: Colors.black,
                                  obscureText:
                                      _isObscured, // Controla visibilidade
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 0),
                                    suffixIcon: GestureDetector(
                                      child: Icon(
                                        _isObscured
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                        color: Colors.black,
                                      ),
                                      onTap: () {
                                        setState(() {
                                          _isObscured =
                                              !_isObscured; // Alterna visibilidade
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                            margin: EdgeInsets.only(left: 145),
                            width: 115,
                            child: Center(
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      padding: EdgeInsets.fromLTRB(23, 0, 0, 0),
                                      backgroundColor: const Color.fromARGB(
                                          255, 33, 221, 33),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadiusDirectional.circular(
                                                  13))),
                                  onPressed: () {},
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.save,
                                        color: Colors.white,
                                      ),
                                      Text(
                                        "Salvar",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16),
                                      ),
                                    ],
                                  )),
                            ))
                      ],
                    )),
              ));

  Future removerItem(var usuario) => showDialog(
      // função de remover itens do produto
      context: context,
      builder: (context) => Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusDirectional.circular(10)),
            backgroundColor: Colors.white,
            child: Container(
              width: 450,
              height: 230,
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Text(
                      "Remover produto",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Divider(
                    color: Colors.black,
                    indent: 10.0,
                    endIndent: 10.0,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 60,
                    child: SingleChildScrollView(
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(
                              fontSize: 24,
                              color:
                                  Colors.black), // Estilo padrão para o texto
                          children: <TextSpan>[
                            TextSpan(
                              text:
                                  "Tem certeza que deseja remover o usuário ", // O restante do texto
                              //textAlign: TextAlign.justify,
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 18,
                              ), // Estilo normal
                            ),
                            TextSpan(
                              text: usuario + "?", // Texto da variável
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                      18), // Estilo para o texto em negrito
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center, //
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 15),
                    child: Row(
                      children: [
                        Container(
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadiusDirectional.circular(12),
                                      side: BorderSide(
                                          color: const Color.fromARGB(
                                              86, 0, 0, 0)))),
                              onPressed: () {},
                              child: Text(
                                "Cancelar",
                                style: TextStyle(
                                    color: const Color.fromARGB(255, 0, 0, 0)),
                              )),
                        ),
                        SizedBox(
                          width: 100,
                        ),
                        Container(
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromARGB(255, 211, 35, 23),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12))),
                              onPressed: () {},
                              child: Center(
                                child: Text(
                                  "Sim",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              )),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ));
}
