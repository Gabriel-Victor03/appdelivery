import 'package:appdelivery/view/components/my_appbar.dart';
import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class Paineladministrativo extends StatefulWidget {
  const Paineladministrativo({super.key});

  @override
  State<Paineladministrativo> createState() => _PaineladministrativoState();
}

class _PaineladministrativoState extends State<Paineladministrativo> {
  bool isLoading = true; // Para controlar o estado de carregamento
  bool isAuthenticated = false; // Para verificar se o usuário está autenticado

  @override
  void initState() {
    super.initState();
    checkAuthentication();
  }

  void checkAuthentication() async {
    final user = await ParseUser .currentUser ();
    setState(() {
      isAuthenticated = user != null; // Verifica se o usuário está autenticado
      isLoading = false; // Atualiza o estado de carregamento
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Scaffold(
        appBar: const MyAppBar(),
        body: Center(child: CircularProgressIndicator()), // Indicador de carregamento
      );
    }

    if (!isAuthenticated) {
      // Se o usuário não estiver autenticado, redireciona para a tela de login
      Future.microtask(() => Navigator.pushReplacementNamed(context, '/login'));
      return Container(); // Retorna um container vazio enquanto redireciona
    }

    return Scaffold(
      appBar: const MyAppBar(),
      // endDrawer: MyDrawer(),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          IntrinsicHeight(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Center(
                    child: Text(
                      "Painel Administrativo",
                      style:
                          TextStyle(fontSize: 35, fontWeight: FontWeight.w700),
                    ),
                  ),
                  //---------------------------------------------------------------------------------------------------------------------------------
                  SizedBox(
                    height: 20,
                  ),
                  Stack(
                    // container de pedidos
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 255, 229, 184),
                            borderRadius: BorderRadius.circular(10)),
                        width: 350,
                        height: 150,
                      ),
                      Positioned(
                          left: 29,
                          top: 23,
                          child: Container(
                            child: Icon(
                              Icons.content_paste_search_sharp,
                              size: 65,
                            ),
                          )),
                      Positioned(
                        left: 23,
                        top: 90,
                        child: Container(
                          child: Text(
                            "Pedidos",
                            style: TextStyle(
                                fontSize: 23, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 130,
                        child: SizedBox(
                          height: 150,
                          child: VerticalDivider(
                            color: const Color.fromARGB(48, 0, 0, 0),
                            indent: 10,
                            endIndent: 10,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 150,
                        top: 23,
                        child: Container(
                          child: Text(
                            "Acompanhamento dos" + "\npedidos realizados",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 260,
                        top: 90,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 130, 30, 60),
                            shape: CircleBorder(),
                            //padding: EdgeInsets.all(15)
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, '/pedidos');
                          },
                          child: Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                            size: 40,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  //---------------------------------------------------------------------------------------------------------------------------------
                  Stack(
                    //container que apresenta as informações de produtos
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 255, 229, 184),
                            borderRadius: BorderRadius.circular(10)),
                        width: 350,
                        height: 150,
                      ),
                      Positioned(
                          left: 29,
                          top: 23,
                          child: Container(
                            child: Icon(
                              Icons.inventory_2_outlined,
                              size: 65,
                            ),
                          )),
                      Positioned(
                        left: 130,
                        child: SizedBox(
                          height: 150,
                          child: VerticalDivider(
                            color: const Color.fromARGB(48, 0, 0, 0),
                            indent: 10,
                            endIndent: 10,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 23,
                        top: 90,
                        child: Container(
                          child: Text(
                            "Produtos",
                            style: TextStyle(
                                fontSize: 23, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 150,
                        top: 23,
                        child: Container(
                          child: Text(
                            "Adicione, altere e remova" +
                                "\nprodutos do cardápio ",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 260,
                        top: 90,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 130, 30, 60),
                            shape: CircleBorder(),
                          ),
                          onPressed: () {
                            // Navega para a rota '/produtos'
                            Navigator.pushNamed(context, '/produtos');
                          },
                          child: Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                            size: 40,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  //---------------------------------------------------------------------------------------------------------------------------------
                  Stack(
                    // container de usuarios
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 255, 229, 184),
                            borderRadius: BorderRadius.circular(10)),
                        width: 350,
                        height: 150,
                      ),
                      Positioned(
                          left: 29,
                          top: 23,
                          child: Container(
                            child: Icon(
                              Icons.person_outline,
                              size: 70,
                            ),
                          )),
                      Positioned(
                        left: 23,
                        top: 90,
                        child: Container(
                          child: Text(
                            "Usuarios",
                            style: TextStyle(
                                fontSize: 23, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 130,
                        child: SizedBox(
                          height: 150,
                          child: VerticalDivider(
                            color: const Color.fromARGB(48, 0, 0, 0),
                            indent: 10,
                            endIndent: 10,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 150,
                        top: 23,
                        child: Container(
                          child: Text(
                            "Adicione, altere e remova" + "\nusuarios",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 260,
                        top: 90,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 130, 30, 60),
                            shape: CircleBorder(),
                            //padding: EdgeInsets.all(15)
                          ),
                          onPressed: () {},
                          child: Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                            size: 40,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 0.0,
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        side: BorderSide(color: Color.fromARGB(50, 0, 0, 0))),
                    onPressed: () {},
                    child: const Text(
                      'Sair',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                ]),
          ),
        ],
      ),
    );
  }
}
