import 'package:flutter/material.dart';
import '../controllers/addproduct_controller.dart';

class AddToCartButton extends StatelessWidget {
  final AddproductController controller;
  final String produtoId; // ID do produto
  final int quantidade; // Quantidade escolhida
  final double total; // Subtotal do produto

  const AddToCartButton({
    Key? key,
    required this.controller,
    required this.produtoId,
    required this.quantidade,
    required this.total,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: () async {
          await controller.adicionarNaSacola(produtoId, quantidade, total);
          Navigator.pop(context); // Fecha a página atual
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 130, 30, 60),
          padding: const EdgeInsets.symmetric(vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        icon: const Icon(Icons.shopping_bag, color: Colors.white),
        label: const Text(
          "Adicionar na sacola",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
