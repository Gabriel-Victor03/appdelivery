import 'package:flutter/material.dart';

class MyDetailsprod extends StatefulWidget {
  final String nome;
  final String? preco;
  final String? descricao;
  final String? categoria;
  
  const MyDetailsprod(
      {super.key,
      this.nome = '',
      this.descricao = '',
      this.preco,
      this.categoria});

  @override
  State<MyDetailsprod> createState() => _MyDetailsprodState();
}

class _MyDetailsprodState extends State<MyDetailsprod> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: Container(
      width: 480,
      height: 420,
      child: ListView(
        children: [
          Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                child: Text(
                  "Detalhes do produto",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
              Divider(
                indent: 8.0,
                endIndent: 8.0,
                color: Colors.black,
              ),
              Container(
                width: 180,
                height: 150,
                child: Image.asset("assets/images/burguer1.jpg"),
              ),
              Divider(
                indent: 8.0,
                endIndent: 8.0,
                color: Colors.black,
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                  child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: 250,
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(
                              fontSize: 24,
                              color:
                                  Colors.black), // Estilo padrão para o texto
                          children: <TextSpan>[
                            TextSpan(
                              text: "Categoria: ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ), // Estilo normal
                            ),
                            TextSpan(
                              text: "${widget.categoria}", // Texto da variável
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize:
                                      14), // Estilo para o texto em negrito
                            ),
                          ],
                        ),
                        textAlign: TextAlign.start, //
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 250,
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(
                              fontSize: 24,
                              color:
                                  Colors.black), // Estilo padrão para o texto
                          children: <TextSpan>[
                            TextSpan(
                              text: "Nome: ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ), // Estilo normal
                            ),
                            TextSpan(
                              text: widget.nome, // Texto da variável
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize:
                                      14), // Estilo para o texto em negrito
                            ),
                          ],
                        ),
                        textAlign: TextAlign.start, //
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 275,
                      padding: EdgeInsets.only(left: 12),
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(
                              fontSize: 24,
                              color:
                                  Colors.black), // Estilo padrão para o texto
                          children: <TextSpan>[
                            TextSpan(
                              text: "Descrição: ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ), // Estilo normal
                            ),
                            TextSpan(
                              text: widget.descricao, // Texto da variável
                              style: TextStyle(
                                  fontWeight: FontWeight.normal, fontSize: 14),
                              // Estilo para o texto em negrito
                            ),
                          ],
                        ),
                        textAlign: TextAlign.start,
                        //
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 250,
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(
                              fontSize: 24,
                              color:
                                  Colors.black), // Estilo padrão para o texto
                          children: <TextSpan>[
                            TextSpan(
                              text: "Preço: ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ), // Estilo normal
                            ),
                            TextSpan(
                              text: "R\$" +
                                  widget.preco.toString(), // Texto da variável
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize:
                                      14), // Estilo para o texto em negrito
                            ),
                          ],
                        ),
                        //
                      ),
                    ),
                  ],
                ),
              ))
            ],
          ),
        ],
      ),
    ));
  }
}
