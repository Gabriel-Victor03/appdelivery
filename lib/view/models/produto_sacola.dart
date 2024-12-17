class ProdutoSacola {
  final int idSacola;
  final int idProduto;

  ProdutoSacola({required this.idSacola, required this.idProduto});

  Map<String, dynamic> toMap() {
    return {
      'id_sacola': idSacola,
      'id_produto': idProduto,
    };
  }

  factory ProdutoSacola.fromMap(Map<String, dynamic> map) {
    return ProdutoSacola(
      idSacola: map['id_sacola'],
      idProduto: map['id_produto'],
    );
  }
}
