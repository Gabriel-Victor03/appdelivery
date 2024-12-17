import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class SacolaController with ChangeNotifier {
  String? sacolaAtualId;  // ID da sacola atual

  List<Map<String, dynamic>> _products = [];

  List<Map<String, dynamic>> get products => _products;

  SacolaController({this.sacolaAtualId});

  Future<void> fetchSacolaData() async {
    try {
      if (sacolaAtualId == null) {
        print("Nenhuma sacola ativa.");
        return;
      }

      print("Buscando produtos para sacola com ID: $sacolaAtualId");

      // Busca os produtos associados à sacola
      final query = QueryBuilder<ParseObject>(ParseObject('Produto_Sacola'))
        ..whereEqualTo('produto_sacola', ParseObject('Sacola')..objectId = sacolaAtualId)
        ..includeObject(['produto_produto']);

      final response = await query.query();

      if (response.success && response.results != null) {
        _products.clear();
        for (var result in response.results!) {
          final produtoSacola = result as ParseObject;
          final produto = produtoSacola.get<ParseObject>('produto_produto');

          if (produto != null) {
            _products.add({
              'name': produto.get<String>('nome') ?? 'Produto',
              'price': produto.get<double>('preco') ?? 0.0,
              'quantity': produtoSacola.get<int>('quantidade') ?? 0,
              'total': produtoSacola.get<double>('total') ?? 0.0,
            });
          }
        }
        notifyListeners(); // Notifica a UI para re-renderizar
      } else {
        print("Erro ao buscar produtos: ${response.error?.message}");
      }
    } catch (e) {
      print("Erro ao buscar dados da sacola: $e");
    }
  }
}
