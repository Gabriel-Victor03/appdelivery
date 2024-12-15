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
    print("Entrou para o Controller");
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
        double prec =
            double.tryParse(preco.replaceAll(',', '.').trim()) ?? 20.0;

        final parseFile = ParseFile(File(imagem.path));
        await parseFile.save();

        if (categoriaId != null) {
          final categoria = ParseObject('Categoria')
            ..objectId = categoriaId;
          await categoria.fetch();

          if (categoria.objectId != null) {
            final produto = ParseObject('Produto')
              ..set('descricao', descricao)
              ..set('preco', prec)
              ..set('nome', nome)
              ..set('image_produto', parseFile);

            // Usando a relação para adicionar a categoria
            final catRelation = produto.getRelation('categoria_produto');
            catRelation.add(categoria);

            final produtoResponse = await produto.save();

            if (produtoResponse.success) {
              print('Produto salvo com sucesso!');
            } else {
              print('Erro ao salvar produto: ${produtoResponse.error?.message}');
            }
          } else {
            print('Categoria não encontrada!');
          }
        } else {
          print('Categoria não especificada!');
        }
      } catch (e) {
        print('Erro ao processar a imagem ou salvar produto: $e');
      }
    } else {
      print('Nenhuma imagem selecionada.');
    }
  }
  removerProduto(String objectId) async {
    final categoria = ParseObject('Produto')..objectId = objectId;

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
}
