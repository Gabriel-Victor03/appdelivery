import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class Usercontroller extends ChangeNotifier {
  List<ParseObject> tasks = [];

  Future<List<Map<String, String>>> getUser() async {
    final QueryBuilder<ParseObject> query =
        QueryBuilder<ParseObject>(ParseObject('_User'));

    var response = await query.query();

    if (response.success && response.results != null) {
      List<Map<String, String>> usuarios =
          await Future.wait(response.results!.map((e) async {
        final user = e as ParseObject;

        return {
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
      final produto = ParseObject('_User')
        ..set('username', nome)
        ..set('email', email)
        ..set('password', senha);

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
}
