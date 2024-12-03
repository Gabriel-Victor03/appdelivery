import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class ProductController extends ChangeNotifier {
   List<ParseObject> tasks = [];

  

  pegarCategoria() async {
    final QueryBuilder<ParseObject> query =
        QueryBuilder<ParseObject>(ParseObject('Categoria'));

    var response = await query.query();

    if (response.success && response.results != null) {
      tasks = response.results!.cast<ParseObject>();
      notifyListeners();
    } else {
      print("Erro ao buscar categorias: ${response.error?.message}");
    }
  }
}
