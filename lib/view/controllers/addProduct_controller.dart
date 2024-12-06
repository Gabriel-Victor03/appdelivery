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

  inserirProduto(String nome, String descricao, String preco,
      String? categoriaId, XFile? imagem) async {
    if (imagem != null) {
      try {
        print("AQUIIIIIII");
        print(preco);
        double prec =
            double.tryParse(preco.replaceAll(',', '.').trim()) ?? 20.0;
        print(prec);
        final parseFile = ParseFile(File(imagem.path));
        await parseFile.save();

        final produto = ParseObject('Produto')
          ..set('descricao', descricao)
          ..set('preco', prec)
          ..set('categoriaId', categoriaId)
          ..set('image_produto', parseFile)
          ..set('nome', nome);

        final response = await produto.save();

        if (response.success) {
          print('Produto salvo com sucesso!');
        } else {
          print('Erro ao salvar produto: ${response.error?.message}');
        }
      } catch (e) {
        print('Erro ao processar a imagem: $e');
      }
    } else {
      print('Nenhuma imagem selecionada.');
    }
  }
}
