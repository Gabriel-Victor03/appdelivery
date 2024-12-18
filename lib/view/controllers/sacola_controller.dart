import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SacolaController with ChangeNotifier {
  String? sacolaAtualId;
  List<Map<String, dynamic>> _products = [];
  List<Map<String, dynamic>> get products => _products;

  Future<void> saveSacolaId(String id) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('sacolaAtualId', id);
    sacolaAtualId = id;
    print("Sacola salva com ID: $id");
    notifyListeners(); // Notifica a UI que o ID da sacola mudou
  }

  Future<void> _loadSacolaId() async {
    final prefs = await SharedPreferences.getInstance();
    sacolaAtualId = prefs.getString('sacolaAtualId');
    print("Sacola carregada com ID: $sacolaAtualId");
    notifyListeners(); // Atualiza a UI se necessário
  }

  Future<void> adicionarNaSacola(String produtoId, int quantidade, double total) async {
    try {
      if (produtoId.isEmpty) {
        print("Erro: produtoId não pode ser vazio.");
        return;
      }

      // Criar uma sacola apenas se não existir
      if (sacolaAtualId == null) {
        await createSacola(subtotal: total);
      }

      // Adicionar ou atualizar produto na sacola
      final query = QueryBuilder<ParseObject>(ParseObject('Produto_Sacola'))
        ..whereEqualTo('produto_sacola', ParseObject('Sacola')..objectId = sacolaAtualId)
        ..whereEqualTo('produto_produto', ParseObject('Produto')..objectId = produtoId);

      final response = await query.query();

      if (response.success && response.results != null && response.results!.isNotEmpty) {
        // Produto já está na sacola, atualizar quantidade e total
        final produtoSacola = response.results!.first as ParseObject;
        produtoSacola
          ..set('quantidade', produtoSacola.get<int>('quantidade')! + quantidade)
          ..set('total', produtoSacola.get<double>('total')! + total);

        await produtoSacola.save();
      } else {
        // Produto não está na sacola, criar novo
        final produtoSacola = ParseObject('Produto_Sacola')
          ..set('quantidade', quantidade)
          ..set('total', total);

        // Usando addRelation para associar o Produto à Produto_Sacola
        produtoSacola.addRelation('produto_produto', [ParseObject('Produto')..objectId = produtoId]);

        // Usando addRelation para associar a Sacola à Produto_Sacola
        produtoSacola.addRelation('produto_sacola', [ParseObject('Sacola')..objectId = sacolaAtualId]);
        final responseRelation = await produtoSacola.save();
      }

      // Atualizar lista de produtos na UI
      await fetchSacolaData();

      print("Produto adicionado/atualizado com sucesso na sacola!");
    } catch (e) {
      print("Erro ao adicionar produto na sacola: $e");
    }
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

  Future<void> fetchSacolaData() async {
  try {
    if (sacolaAtualId == null) {
      print("Nenhuma sacola ativa para buscar os dados.");
      return;
    }

    print("Buscando produtos para a sacola com ID: $sacolaAtualId");

    final query = QueryBuilder<ParseObject>(ParseObject('Produto_Sacola'))
      // Aqui, estamos buscando pela relação 'produto_sacola' que é uma relação, e não ponteiro.
      ..whereEqualTo('produto_sacola', ParseObject('Sacola')..objectId = sacolaAtualId)
      ..includeObject(['produto_produto']);  // Incluindo a relação com Produto

    final response = await query.query();

    if (response.success && response.results != null) {
      _products.clear();

      for (var result in response.results!) {
        final produtoSacola = result as ParseObject;

        // Aqui, buscamos diretamente a relação 'produto_produto'
        final produtoRelation = produtoSacola.get<ParseRelation>('produto_produto');

        if (produtoRelation != null) {
          final produtoQuery = produtoRelation.getQuery();  // Corrigido aqui, usamos getQuery() para buscar os objetos da relação

          // Agora realizamos a consulta da relação
          final produtoResponse = await produtoQuery.query();
          print("Resposta da consulta de produto: ${produtoResponse.success} - ${produtoResponse.results}");

          if (produtoResponse.success && produtoResponse.results != null) {
            for (var produtoObj in produtoResponse.results!) {
              _products.add({
                'name': produtoObj.get<String>('nome') ?? 'Produto',
                'price': (produtoObj.get('preco') as num).toDouble() ?? 0.0, 
                'quantity': produtoSacola.get<int>('quantidade') ?? 0,
                'total': produtoSacola.get<double>('total')?.toDouble() ?? 0.0,
              });
            }
          }
        }
      }

      print("Produtos da sacola carregados com sucesso.");
      notifyListeners();  // Atualiza a UI
    } else {
      print("Erro ao buscar produtos da sacola: ${response.error?.message}");
    }
  } catch (e) {
    print("Erro ao buscar dados da sacola: $e");
  }
}
}
