import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class AdicionalController extends ChangeNotifier{
  var isLoading = false;
  var error = '';
  var objectId;
  var adicionalNome;
  int contador = 0;

  
  List<Map<String, String>> adicionais = [];
  Map<String, int> adicionaisCounter = {};

  String formatarPreco(num preco) {
    return NumberFormat.currency(
      locale: 'pt_BR', // Formato brasileiro
      symbol: 'R\$',
    ).format(preco);
  }
  
  
  getAdicionais() async {

    final query = QueryBuilder<ParseObject>(ParseObject('Adicional'));
    final response = await query.query();

    if (response.success && response.result != null) {
      
       // Verifica se o widget ainda está montado
        adicionais = response.results!.map((e) {
          final adicional = e as ParseObject;
          return {
            'nomeAdicional': adicional.get<String>('nome') ?? 'Adicional',
            'preco': formatarPreco(adicional.get<num>('preco') ?? 0),
          };
        }).toList().cast<Map<String, String>>();
        notifyListeners();

        // Inicializa o contador de adicionais
        adicionais.forEach((adicional) {
          adicionaisCounter[adicional['nomeAdicional']!] = 0;
        });
      };
    }

    void incrementar(String nomeAdicional) {
    adicionaisCounter[nomeAdicional] = (adicionaisCounter[nomeAdicional] ?? 0) + 1;
    notifyListeners();
  }
      void decrement(String nomeAdicional) {
    if (adicionaisCounter[nomeAdicional] != null && adicionaisCounter[nomeAdicional]! > 0) {
      adicionaisCounter[nomeAdicional] = adicionaisCounter[nomeAdicional]! - 1;
      notifyListeners();
      }
    }
}