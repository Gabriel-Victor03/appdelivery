import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class Usercontroller extends ChangeNotifier{
  List<ParseObject> tasks = [];
   getUser() async {
final QueryBuilder<ParseObject> query =
        QueryBuilder<ParseObject>(ParseObject('_User'));

    var response = await query.query();

    if (response.success && response.results != null) {
      tasks = response.results!.cast<ParseObject>();
      notifyListeners();
    } else {
      print("Erro ao buscar categorias: ${response.error?.message}");
    }
  }
  }
