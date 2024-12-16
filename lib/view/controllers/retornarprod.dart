import 'package:get/get.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class Retornarprod extends GetxController {
  List<ParseObject> tasks = [];
  String? categoriaN;
  String? nome;
  String? desc;
  ParseFile? image;
  String? preco;
  //List <String, String> produto = [];
  String? error;
  ParseResponse? test;

  Future<List<Map<String, String>>> getProdutos() async {
    try {
      final QueryBuilder<ParseObject> query =
          QueryBuilder<ParseObject>(ParseObject('Produto'));
      var response = await query.query();

      if (response.success && response.results != null) {
        List<Map<String, String>> produtos = await Future.wait(
          response.results!.map((e) async {
            final product = e as ParseObject;
            final relation = product.getRelation('categoria_produto');
             final categoria = await relation.getQuery().first();
            final categoryName = categoria != null
             ? categoria.get<String>('nome') ?? 'Sem Categoria'
                : 'Sem Categoria';

            return {
              'categoriaN': categoryName,
              'nome': product.get<String>('nome') ?? 'Nome não disponível',
              'desc': product.get<String>('descricao') ??
                  'Descrição não disponível',
              'image': (product.get<ParseFile>('image_produto')?.url) ?? '',
              'preco': product.get<num>('preco')?.toStringAsFixed(2) ?? '0.00',
              'id': product.get<String>('objectId') ?? "sem id"
            };
          }).toList(),
        );

        return produtos;
      } else {
        print("Erro ao buscar categorias: ${response.error?.message}");
        return [];
      }
    } catch (e) {
      print("Erro: $e");
      return [];
    }
  }
}
