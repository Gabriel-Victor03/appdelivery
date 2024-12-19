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

  Future<void> loadSacolaId() async {
    final prefs = await SharedPreferences.getInstance();
    sacolaAtualId = prefs.getString('sacolaAtualId');
    print("Sacola carregada com ID: $sacolaAtualId");
    notifyListeners(); // Atualiza a UI se necessário
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

    // Criar uma sacola apenas se não existir
    if (sacolaAtualId == null) {
      await createSacola(subtotal: total);
    }

    // Consulta para verificar se o produto já existe na sacola
    final queryProdutoSacola = QueryBuilder<ParseObject>(ParseObject('Produto_Sacola'))
      ..whereEqualTo('produto_sacola', ParseObject('Sacola')..objectId = sacolaAtualId)
      ..whereEqualTo('produto_produto', ParseObject('Produto')..objectId = produtoId)
      ..includeObject(['produto_produto', 'produto_sacola']); // Inclui o produto e a sacola na consulta

    final responseProdutoSacola = await queryProdutoSacola.query();

    if (responseProdutoSacola.success && responseProdutoSacola.results != null && responseProdutoSacola.results!.isNotEmpty) {
      // Produto já está na sacola, atualizar quantidade e total
      final produtoSacola = responseProdutoSacola.results!.first as ParseObject;
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

      if (responseRelation.success) {
        print("Produto relacionado com sucesso à sacola.");
      } else {
        print("Erro ao relacionar produto: ${responseRelation.error?.message}");
      }
    }

    // Atualizar lista de produtos na UI
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

    _products.clear(); // Limpa a lista antes de adicionar novos produtos

    final queryProdutoSacola = QueryBuilder<ParseObject>(ParseObject('Produto_Sacola'))
      ..whereEqualTo('produto_sacola', ParseObject('Sacola')..objectId = sacolaAtualId);

    final responseProdutoSacola = await queryProdutoSacola.query();

    if (responseProdutoSacola.success && responseProdutoSacola.results != null && responseProdutoSacola.results!.isNotEmpty) {
      print("Produtos encontrados na sacola:");
      for (var item in responseProdutoSacola.results!) {
        final produtoSacola = item as ParseObject;
        final quantidade = produtoSacola.get<int>('quantidade');
        final total = produtoSacola.get<double>('total');

        // Fetch dos objetos relacionados (produtos)
        final produtoRelation = produtoSacola.getRelation('produto_produto');
        final queryProduto = produtoRelation.getQuery();
        final produtoRelacionadoResponse = await queryProduto.query();

        if (produtoRelacionadoResponse.success && produtoRelacionadoResponse.results != null) {
          for (var produtoItem in produtoRelacionadoResponse.results!) {
            final produto = produtoItem as ParseObject;
            final nomeProduto = produto.get<String>('nome');
            final preco = produto.get<double>('preco');
            final descricao = produto.get<String>('descricao');

            // Adiciona o produto à lista de produtos, sem a imagem
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
      notifyListeners(); // Notifica a UI sobre a atualização dos produtos
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

    // Aqui você pode adicionar lógica para processar o pagamento ou finalizar a compra

    // Limpar a sacola atual
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('sacolaAtualId');
    sacolaAtualId = null;
    _products.clear();
    notifyListeners();

    print("Compra finalizada e sacola limpa.");
  } catch (e) {
    print("Erro ao finalizar compra: $e");
  }
}


}
