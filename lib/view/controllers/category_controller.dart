import 'package:appdelivery/view/models/categoria_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class CategoryController extends ChangeNotifier {
  var isLoading = false;
  var error = '';
  var categoria = <Categoria>[];
  var objectId;
  var categoriaNome;
  List<ParseObject> tasks = [];
  List<ParseObject> category = [];
  TextEditingController taskController = TextEditingController();
  XFile? image;
  var selectimagem;
  //List<ParseObject> publisher = [];

  getCategoria() async {
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

  removerCategoria(String objectId) async {
    final categoria = ParseObject('Categoria')..objectId = objectId;

    // Remove a categoria
    final deleteResponse = await categoria.delete();
    notifyListeners();
    if (deleteResponse.success) {
      await getCategoria();
      notifyListeners();
      print('Categoria removida com sucesso: $objectId');
    } else {
      print('Erro ao remover a categoria: ${deleteResponse.error?.message}');
      notifyListeners();
    }
  }

  void visualizarCategoria(Object? value) {
    selectimagem = value;
    notifyListeners();
  }

  selecionarImagem() async {
    final ImagePicker picker = ImagePicker();
    try {
      XFile? file = await picker.pickImage(source: ImageSource.gallery);
      if (file != null) return image = file;
      notifyListeners();
    } catch (e) {
      print(e);
      notifyListeners();
    }
  }
  //https://www.youtube.com/watch?v=XGjCatQadrk
}
