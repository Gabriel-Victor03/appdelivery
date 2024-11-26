import 'package:flutter/material.dart';

class MyTableUser extends StatefulWidget {
  const MyTableUser({super.key});

  @override
  State<MyTableUser> createState() => _MyTableUserState();
}

class _MyTableUserState extends State<MyTableUser> {
  @override
  final List<Map<String, String>> usuarios = [
    {
      "nome": "Atendente1",
      "email": "atendente1@gmail.com",
    },
    {
      "nome": "Atendente2",
      "email": "atendente2@gmail.com",
    },
    {
      "nome": "Cozinha1",
      "email": "cozinha1@gmail.com",
    },
    {
      "nome": "Cozinha2",
      "email": "cozinha2@gmail.com",
    },
    {
      "nome": "UserAdm",
      "email": "useradm@gmail.com",
    },

    // Adicione mais pedidos aqui conforme necessário
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Center(
              child: Text(
                "Usuários",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  border: Border.all(
                      color: const Color.fromARGB(
                          255, 0, 0, 0)), // Borda para o container
                ),
                child: Column(
                  children: [
                    // Cabeçalho
                    Container(
                      width: 450,
                      padding: EdgeInsets.fromLTRB(3, 0, 20, 0),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 229, 184),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                              child: Text('NOME',
                                  textAlign: TextAlign.center,
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold))),
                          Expanded(
                              child: Text('EMAIL',
                                  textAlign: TextAlign.center,
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold))),
                          Container(
                            //margin: EdgeInsets.only(right: 30),
                            child: Expanded(
                                child: Text('AÇÕES',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold))),
                          ),
                        ],
                      ),
                    ),
                    // ListView de usuarios
                    ListView.builder(
                      shrinkWrap: true,
                      physics:
                          NeverScrollableScrollPhysics(), // Impede o scroll duplicado com SingleChildScrollView
                      itemCount: usuarios.length,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: EdgeInsets.fromLTRB(0, 0, 8, 0),
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 255, 229, 184)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                  child: Text(usuarios[index]["nome"]!,
                                      textAlign: TextAlign.center)),

                              Expanded(
                                  child: Text(usuarios[index]["email"]!,
                                      textAlign: TextAlign.center)),

                              //VerticalDivider(color: Colors.b,),
                              Container(
                                padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                                child: Expanded(
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Center(
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      Color.fromARGB(
                                                          255, 130, 30, 60),
                                                  padding: EdgeInsets.all(3),
                                                  maximumSize: Size(25, 25),
                                                  minimumSize: Size(5, 5)),
                                              onPressed: () {
                                                editarUsuarios(
                                                    usuarios[index]['nome']
                                                        .toString(),
                                                    usuarios[index]['email']
                                                        .toString());
                                              },
                                              child: Transform.rotate(
                                                  angle: 1.64159,
                                                  child: Icon(
                                                    Icons.search,
                                                    color: Colors.white,
                                                    size: 18,
                                                  )))),
                                      Container(
                                        //margin: EdgeInsets.only(right: 1000),
                                        child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    const Color.fromARGB(
                                                        255, 255, 17, 0),
                                                padding: EdgeInsets.all(3),
                                                maximumSize: Size(25, 25),
                                                minimumSize: Size(5, 5)),
                                            onPressed: () {
                                              removerItem(
                                                  usuarios[index]['nome']);
                                            },
                                            child: Icon(
                                              Icons.delete,
                                              color: Colors.white,
                                              size: 18,
                                            )),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
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

  Future editarUsuarios(String nome, String email) => showDialog(
      context: context,
      builder: (context) => Dialog(
              child: Container(
            width: 480,
            height: 420,
            child: ListView(
              children: [
                
              ],
            ),
          )));
  Future removerItem(var teste) => showDialog(
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
                                  "Tem certeza que deseja remover o produto ", // O restante do texto
                              //textAlign: TextAlign.justify,
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 18,
                              ), // Estilo normal
                            ),
                            TextSpan(
                              text: teste + "?", // Texto da variável
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
