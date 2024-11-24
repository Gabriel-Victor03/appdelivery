import 'dart:io';

class Produto {
  String objectId;
  String nome;
  double preco;
  String descricao;
  File? imageProduto; // Alterado para File
  String categoriaId;

  Produto({
    required this.objectId,
    required this.nome,
    required this.preco,
    required this.descricao,
    this.imageProduto, // Pode ser nulo
    required this.categoriaId,
  });

  Map<String, dynamic> toMap() {
    return {
      'objectId': objectId,
      'nome': nome,
      'preco': preco,
      'descricao': descricao,
      'image_produto': imageProduto?.path, // Armazena o caminho do arquivo
      'categoriaId': categoriaId,
    };
  }

  factory Produto.fromMap(Map<String, dynamic> map) {
    return Produto(
      objectId: map['objectId'],
      nome: map['nome'],
      preco: map['preco'],
      descricao: map['descricao'],
      imageProduto: map['image_produto'] != null ? File(map['image_produto']) : null,
      categoriaId: map['categoriaId'],
    );
  }
}