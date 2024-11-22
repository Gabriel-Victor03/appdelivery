import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';
import '../models/categoria_model.dart';

class CategoriaController {
  List<Categoria> tasks = [];
  final TextEditingController taskController;

  CategoriaController(this.taskController);

  Future<void> removerCategoria(String objectId) async {
    final categoria = ParseObject('Categoria')..objectId = objectId;

    final deleteResponse = await categoria.delete();

    if (deleteResponse.success) {
      await fetchCategorias();
      print('Categoria removida com sucesso: $objectId');
    } else {
      print('Erro ao remover a categoria: ${deleteResponse.error?.message}');
    }
  }

  Future<void> fetchCategorias() async {
    final QueryBuilder<ParseObject> query =
        QueryBuilder<ParseObject>(ParseObject('Categoria'));
    
    var response = await query.query();

    if (response.success && response.results != null) {
      tasks = response.results!.map((e) => Categoria.fromParseObject(e)).toList();
    } else {
      print("Erro ao buscar categorias: ${response.error?.message}");
    }
  }

  Future<void> addCategoria() async {
    String task = taskController.text.trim();
    if (task.isNotEmpty) {
      var categoria = Categoria(nome: task);
      var parseObject = categoria.toParseObject();

      var response = await parseObject.save();

      if (response.success) {
        tasks.add(categoria);
        await fetchCategorias();
        print("Categoria adicionada com sucesso.");
        taskController.clear();
      } else {
        print("Erro ao adicionar categoria: ${response.error?.message}");
      }
    }
  }
}