import 'package:appdelivery/view/models/categoria_model.dart';
import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class CategoryController extends ChangeNotifier {
  var isLoading = false;
  var error = '';
  var categoria = <Categoria>[];
  List<ParseObject> tasks = [];
  TextEditingController taskController = TextEditingController();

  getCategoria() async {
    isLoading = true;
    error = '';
    notifyListeners();
    try {
      final QueryBuilder<ParseObject> query =
          QueryBuilder<ParseObject>(ParseObject('Categoria'));

      var response = await query.query();

      if (response.success && response.results != null) {
        tasks = response.results!.cast<ParseObject>();
        notifyListeners();
      } else {
        print("Erro ao buscar categorias: ${response.error?.message}");
        notifyListeners();
      }
    } catch (e) {
      error = e.toString();
      notifyListeners();
    }
  }

  addCategoria() async {
    isLoading = true;
    error = '';
    notifyListeners();
    try {
      String task = taskController.text.trim();
      if (task.isNotEmpty) {
        var categoria = ParseObject('Categoria')..set('nome', task);

        var response = await categoria.save();

        if (response.success) {
          tasks.add(categoria);
          getCategoria();
          print("Enviou");

          taskController.clear();
          notifyListeners();
        } else {
          print("Erro");
          notifyListeners();
        }
      }
    } catch (e) {
      error = e.toString();
      notifyListeners();
    }
  }
  //https://www.youtube.com/watch?v=XGjCatQadrk
}
