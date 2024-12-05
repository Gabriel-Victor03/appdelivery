import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class AddproductController extends ChangeNotifier {
  XFile? imagem;
  String? selectedCategory;
  List<ParseObject> tasks = [];
  var error = "";

  visualizarCategoria(String? select) {
    selectedCategory = select;
    print("off");
    notifyListeners();
  }

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

  selecionarImagem() async {
    final ImagePicker picker = ImagePicker();
    try {
      XFile? file = await picker.pickImage(source: ImageSource.gallery);
      if (file != null) imagem = file;
      notifyListeners();
    } catch (e) {
      error = e.toString();
    }
  }

  inserirProduto(String nome, String descricao, double preco, var objectId,
      String image) async {
    final File file = File(image);
    final product = ParseObject('Produto')
      ..set('descricao', descricao)
      ..set(
          'categoria_produto', (ParseObject('categoria')..objectId = objectId))
      ..set('preco', preco)
      ..set('image_produto', file)
      ..set('nome', nome);
    await product.save();
  }
}
