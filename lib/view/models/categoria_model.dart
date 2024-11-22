import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class Categoria {
  String? objectId;
  String nome;

  Categoria({this.objectId, required this.nome});

  factory Categoria.fromParseObject(ParseObject parseObject) {
    return Categoria(
      objectId: parseObject.objectId,
      nome: parseObject.get<String>('nome') ?? '',
    );
  }

  ParseObject toParseObject() {
    final parseObject = ParseObject('Categoria');
    if (objectId != null) {
      parseObject.objectId = objectId;
    }
    parseObject.set('nome', nome);
    return parseObject;
  }
}