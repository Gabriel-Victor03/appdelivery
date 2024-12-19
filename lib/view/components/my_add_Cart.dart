import 'package:appdelivery/view/controllers/sacola_controller.dart';
import 'package:flutter/material.dart';
import 'package:appdelivery/view/controllers/addProduct_controller.dart';

class AddToCartButton extends StatefulWidget {
  final SacolaController controller;
  final String produtoId;
  final int quantidade;
  final double total;

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
        onPressed: _isProcessing
            ? null
            : () async {
                setState(() {
                  _isProcessing = true;
                });

                await widget.controller.adicionarNaSacola(
                  widget.produtoId,
                  widget.quantidade,
                  widget.total,
                );

                setState(() {
                  _isProcessing = false;
                });

                Navigator.pop(context);
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
        label: Text(
          _isProcessing ? "Adicionando..." : "Adicionar na sacola",
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}