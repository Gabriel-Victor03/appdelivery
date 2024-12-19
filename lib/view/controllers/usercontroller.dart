import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class Usercontroller extends ChangeNotifier {
  List<ParseObject> tasks = [];
  String check = '';
  Future<List<Map<String, String>>> getUser() async {
    final QueryBuilder<ParseObject> query =
        QueryBuilder<ParseObject>(ParseObject('Usuario'));

    var response = await query.query();

    if (response.success && response.results != null) {
      List<Map<String, String>> usuarios =
          await Future.wait(response.results!.map((e) async {
        final user = e as ParseObject;

        return {
          'Objectid': user.get<String>('objectId') ?? "sem id",
          'username': user.get<String>('username') ?? 'Nome não disponível',
          'email': user.get<String>("email") ?? 'sem@email.com',
        };
      }).toList());
      for (int i = 0; i < usuarios.length; i++) {
        print(usuarios[i]["email"].toString());
      }

      return usuarios;
    } else {
      print("Erro ao buscar usuarios: ${response.error?.message}");
      return [];
    }
  }

  inserirUser(String nome, String senha, String email) async {
    try {
      final produto = ParseObject('Usuario')
        ..set('username', nome)
        ..set('email', email)
        ..set('senha', senha);

      // Usando a relação para adicionar a categoria

      final response = await produto.save();
      if (response.success) {
        print("foi");
      } else {
        print("deu erro");
      }
    } catch (e) {
      print(e);
    }
  }

  updateTodo(String id, String nome, String email) async {
    var usr = ParseObject('Usuario')
      ..objectId = id
      ..set('username', nome)
      ..set('email', email);
    await usr.save();
  }

  Future<bool> deleteTodo(String id) async {
    try {
      print(
          'Tentando deletar o usuário com ID: $id'); // Verifica se o ID está correto

      final todo = ParseObject('Usuario')..objectId = id;
      final response = await todo.delete();

      print(
          'Resposta de exclusão: ${response.success}'); // Verifica o sucesso da operação

      if (response.success) {
        return true; // Deletado com sucesso
      } else {
        print(
            'Falha na exclusão: ${response.error}'); // Imprime qualquer erro se a operação falhar
        return false; // Falha na exclusão
      }
    } catch (e) {
      print('Erro ao deletar usuário: $e');
      return false; // Erro inesperado
    }
  }
}
