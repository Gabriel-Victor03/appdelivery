import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SacolaController {
  String? sacolaAtualId;
  List<Map<String, dynamic>> _products = [];
  List<Map<String, dynamic>> get products => _products;

  Future<void> saveSacolaId(String id) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('sacolaAtualId', id);
    sacolaAtualId = id;
    print("Sacola salva com ID: $id");
  }

  Future<void> loadSacolaId() async {
    final prefs = await SharedPreferences.getInstance();
    sacolaAtualId = prefs.getString('sacolaAtualId');
    print("Sacola carregada com ID: $sacolaAtualId");
  }

  Future<void> createSacola({required double subtotal}) async {
    try {
      final sacola = ParseObject('Sacola')..set('subtotal', subtotal);

      final response = await sacola.save();

      if (response.success && sacola.objectId != null) {
        final sacolaId = sacola.objectId!;
        await saveSacolaId(sacolaId);
        print("Nova sacola criada com ID: $sacolaId");
      } else {
        print("Erro ao criar sacola: ${response.error?.message}");
      }
    } catch (e) {
      print("Erro ao criar sacola: $e");
    }
  }

  Future<void> adicionarNaSacola(String produtoId, int quantidade, double total) async {
    try {
      if (produtoId.isEmpty) {
        print("Erro: produtoId não pode ser vazio.");
        return;
      }

      if (sacolaAtualId == null) {
        await createSacola(subtotal: total);
      }

      final queryProdutoSacola = QueryBuilder<ParseObject>(ParseObject('Produto_Sacola'))
        ..whereEqualTo('produto_sacola', ParseObject('Sacola')..objectId = sacolaAtualId)
        ..whereEqualTo('produto_produto', ParseObject('Produto')..objectId = produtoId);

      final responseProdutoSacola = await queryProdutoSacola.query();

      if (responseProdutoSacola.success && responseProdutoSacola.results != null && responseProdutoSacola.results!.isNotEmpty) {
        final produtoSacola = responseProdutoSacola.results!.first as ParseObject;
        produtoSacola
          ..set('quantidade', produtoSacola.get<int>('quantidade')! + quantidade)
          ..set('total', (produtoSacola.get<num>('total')! + total).toDouble());

        await produtoSacola.save();
      } else {
        final produtoSacola = ParseObject('Produto_Sacola')
          ..set('quantidade', quantidade)
          ..set('total', total);

        produtoSacola.addRelation('produto_produto', [ParseObject('Produto')..objectId = produtoId]);
        produtoSacola.addRelation('produto_sacola', [ParseObject('Sacola')..objectId = sacolaAtualId]);

        final responseRelation = await produtoSacola.save();

        if (responseRelation.success) {
          print("Produto relacionado com sucesso à sacola.");
        } else {
          print("Erro ao relacionar produto: ${responseRelation.error?.message}");
        }
      }

      await fetchProdutosNaSacola();

      print("Produto adicionado/atualizado com sucesso na sacola!");
    } catch (e) {
      print("Erro ao adicionar produto na sacola: $e");
    }
  }

  Future<void> fetchProdutosNaSacola() async {
    try {
      if (sacolaAtualId == null) {
        print("Erro: Nenhuma sacola está ativa.");
        return;
      }

      print("Buscando produtos na sacola com ID: $sacolaAtualId");

      _products.clear();

      final queryProdutoSacola = QueryBuilder<ParseObject>(ParseObject('Produto_Sacola'))
        ..whereEqualTo('produto_sacola', ParseObject('Sacola')..objectId = sacolaAtualId);

      final responseProdutoSacola = await queryProdutoSacola.query();

      if (responseProdutoSacola.success && responseProdutoSacola.results != null && responseProdutoSacola.results!.isNotEmpty) {
        print("Produtos encontrados na sacola:");
        for (var item in responseProdutoSacola.results!) {
          final produtoSacola = item as ParseObject;
          final quantidade = produtoSacola.get<int>('quantidade');
          final total = produtoSacola.get<num>('total')?.toDouble() ?? 0.0;

          final produtoRelation = produtoSacola.getRelation('produto_produto');
          final queryProduto = produtoRelation.getQuery();
          final produtoRelacionadoResponse = await queryProduto.query();

          if (produtoRelacionadoResponse.success && produtoRelacionadoResponse.results != null) {
            for (var produtoItem in produtoRelacionadoResponse.results!) {
              final produto = produtoItem as ParseObject;
              final nomeProduto = produto.get<String>('nome');
              final preco = produto.get<num>('preco')?.toDouble() ?? 0.0;
              final descricao = produto.get<String>('descricao');

              _products.add({
                'id': produto.objectId,
                'name': nomeProduto,
                'price': preco,
                'description': descricao,
                'quantity': quantidade,
                'total': total,
              });

              print("Produto: $nomeProduto, Preço: $preco, Descrição: $descricao, Quantidade: $quantidade, Total: $total");
            }
          } else {
            print("Erro ao buscar o produto relacionado: ${produtoRelacionadoResponse.error?.message}");
          }
        }
      } else {
        print("Erro ao buscar produtos na sacola: ${responseProdutoSacola.error?.message ?? 'Successful request, but no results found'}");
      }
    } catch (e) {
      print("Erro ao buscar produtos na sacola: $e");
    }
  }

  Future<void> finalizarCompra() async {
    try {
      if (sacolaAtualId == null) {
        print("Erro: Nenhuma sacola está ativa para finalizar.");
        return;
      }

      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('sacolaAtualId');
      sacolaAtualId = null;
      _products.clear();

      print("Compra finalizada e sacola limpa.");
    } catch (e) {
      print("Erro ao finalizar compra: $e");
    }
  }
}
