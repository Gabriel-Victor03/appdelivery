import 'package:appdelivery/view/controllers/addProduct_controller.dart';
import 'package:flutter/material.dart';

class AddToCartButton extends StatefulWidget {
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
  _AddToCartButtonState createState() => _AddToCartButtonState();
}

class _AddToCartButtonState extends State<AddToCartButton> {
  bool _isProcessing = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: _isProcessing ? null : () async {
          setState(() {
            _isProcessing = true; // Inicia o processamento
          });

          // Indicador de carregamento no botão
          await widget.controller.adicionarNaSacola(
            widget.produtoId,
            widget.quantidade,
            widget.total,
          );

          setState(() {
            _isProcessing = false; // Finaliza o processamento
          });

          Navigator.pop(context); // Fecha a página atual após adicionar
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 130, 30, 60),
          padding: const EdgeInsets.symmetric(vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        icon: _isProcessing
            ? const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                strokeWidth: 2,
              )
            : const Icon(Icons.shopping_bag, color: Colors.white),
        label: _isProcessing
            ? const Text(
                "Adicionando...",
                style: TextStyle(color: Colors.white),
              )
            : const Text(
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
