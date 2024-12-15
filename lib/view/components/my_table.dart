import 'package:appdelivery/view/components/my_deleteProd.dart';
import 'package:appdelivery/view/components/my_detailsprod.dart';
import 'package:appdelivery/view/components/my_popup_newproduct.dart';
import 'package:appdelivery/view/components/my_popup_product.dart';
import 'package:appdelivery/view/controllers/retornarprod.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Controller extends GetxController {
  final List<Map<String, String>> produtos = [];
}

bool isLoading = true;
void main() => runApp(const MyTable());

class MyTable extends StatefulWidget {
  const MyTable({super.key});

  @override
  State<MyTable> createState() => _MyTableState();
}

class _MyTableState extends State<MyTable> {
  final controler = Get.put(Retornarprod());
  List<Map<String, String>> produtos = [];
  @override
  void initState() {
    super.initState();
    setState(() {
      _loadProdutos();
    });
  }

  void _loadProdutos() async {
    List<Map<String, String>> dados = await controler.getProdutos();

    // Aqui você pode atualizar o estado do seu widget com os dados obtidos
    setState(() {
      produtos = dados;
      isLoading = false;
    });
  }

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
                "Pedidos",
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
                          Expanded(child: Icon(Icons.checklist)),
                          Expanded(
                              child: Text('CATEGORIA',
                                  textAlign: TextAlign.center,
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold))),
                          Expanded(
                              child: Text('NOME',
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
                    isLoading
                        // Exibe o indicador de carregamento enquanto os dados são carregados
                        ? Center(child: CircularProgressIndicator())
                        :
                        // ListView de produtos
                        ListView.builder(
                            shrinkWrap: true,
                            physics:
                                NeverScrollableScrollPhysics(), // Impede o scroll duplicado com SingleChildScrollView
                            itemCount: produtos.length,
                            itemBuilder: (context, index) {
                              final produto = produtos[index];

                              return Container(
                                padding: EdgeInsets.fromLTRB(0, 0, 8, 0),
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 255, 229, 184)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Expanded(
                                        child: Checkbox(
                                            value: false,
                                            onChanged: (value) => {})),
                                    Expanded(
                                        child: Text(
                                            produto["categoriaN"] ?? "null",
                                            textAlign: TextAlign.center)),

                                    Expanded(
                                        child: Text(produto["nome"] ?? "null",
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
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                            backgroundColor:
                                                                Color.fromARGB(
                                                                    255,
                                                                    130,
                                                                    30,
                                                                    60),
                                                            padding:
                                                                EdgeInsets
                                                                    .all(3),
                                                            maximumSize:
                                                                Size(25, 25),
                                                            minimumSize:
                                                                Size(5, 5)),
                                                    onPressed: () {
                                                      showDialog(
                                                          context: context,
                                                          builder: (context) =>
                                                              MyDetailsprod(
                                                                nome: produto[
                                                                        "nome"]
                                                                    .toString(),
                                                                descricao: produto[
                                                                        "desc"]
                                                                    .toString(),
                                                                preco: produto[
                                                                    "preco"],
                                                                categoria: produto[
                                                                    "categoriaN"],
                                                                imagemUrl: produto[
                                                                        "image"]
                                                                    .toString(),
                                                              ));
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
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                          backgroundColor:
                                                              const Color
                                                                  .fromARGB(255,
                                                                  255, 17, 0),
                                                          padding:
                                                              EdgeInsets.all(3),
                                                          maximumSize:
                                                              Size(25, 25),
                                                          minimumSize:
                                                              Size(5, 5)),
                                                  onPressed: () {
                                                    showDialog(
                                                        context: context,
                                                        builder: (context) =>
                                                            MyDeleteprod(
                                                              nome: produto[
                                                                      "nome"]
                                                                  .toString(),
                                                              id: produto["id"]
                                                                  .toString(),
                                                            ));
                                                    print(produto["id"]
                                                        .toString());
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
            MyPopupProduct(),
            MyPopupNewproduct(),
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
                                              openDetails(
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
