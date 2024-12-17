import 'package:flutter/material.dart';

class SacolaController extends ChangeNotifier {
  List<Map<String, dynamic>> _produtosNaSacola = [];
  double _valorTotal = 0.0;

  List<Map<String, dynamic>> get produtosNaSacola => _produtosNaSacola;
  double get valorTotal => _valorTotal;

  // Método para adicionar produto
  void adicionarProduto(Map<String, dynamic> produto, int quantidade) {
    // Encontre o produto na sacola
    bool produtoExistente = false;
    for (var item in _produtosNaSacola) {
      if (item['id'] == produto['id']) {
        item['quantidade'] += quantidade;
        produtoExistente = true;
        break;
      }
    }

    if (!produtoExistente) {
      _produtosNaSacola.add({
        'id': produto['id'],
        'nome': produto['nome'],
        'preco': produto['preco'],
        'quantidade': quantidade,
      });
    }

    // Atualiza o valor total
    _atualizarValorTotal();
    notifyListeners();
  }

  // Método para remover produto
  void removerProduto(Map<String, dynamic> produto) {
    _produtosNaSacola.removeWhere((item) => item['id'] == produto['id']);
    _atualizarValorTotal();
    notifyListeners();
  }

  // Atualiza o valor total
  void _atualizarValorTotal() {
    _valorTotal = 0.0;
    for (var item in _produtosNaSacola) {
      _valorTotal += item['preco'] * item['quantidade'];
    }
  }
}
