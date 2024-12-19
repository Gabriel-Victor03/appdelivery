import 'package:flutter/material.dart';

class AddOrderButton extends StatefulWidget {
  final TextEditingController nameController;
  final TextEditingController phoneController;
  final String deliveryType;
  final String paymentMethod;
  final double total;

  const AddOrderButton({
    Key? key,
    required this.nameController,
    required this.phoneController,
    required this.deliveryType,
    required this.paymentMethod,
    required this.total,
  }) : super(key: key);

  @override
  _AddOrderButtonState createState() => _AddOrderButtonState();
}

class _AddOrderButtonState extends State<AddOrderButton> {
  bool _isProcessing = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton.icon(
          onPressed: _isProcessing
              ? null
              : () async {
                  setState(() {
                    _isProcessing = true;
                  });

                  // Simulate a network call or processing
                  await Future.delayed(Duration(seconds: 2));

                  final customerInfo = {
                    'name': widget.nameController.text,
                    'phone': widget.phoneController.text,
                    'deliveryType': widget.deliveryType,
                    'paymentMethod': widget.paymentMethod,
                    'total': widget.total,
                  };

                  // Handle the customerInfo here
                  print(customerInfo);

                  setState(() {
                    _isProcessing = false;
                  });

                  // Optionally, navigate or show a confirmation message
                  // Navigator.pop(context);
                },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 53, 155, 56),
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          icon: _isProcessing
              ? const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  strokeWidth: 2,
                )
              : const Icon(Icons.check, color: Colors.white),
          label: Text(
            _isProcessing ? "Processando..." : "Finalizar Compra",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
