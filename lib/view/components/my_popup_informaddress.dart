import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyPopupInformAddress extends StatefulWidget {
  const MyPopupInformAddress({super.key});

  @override
  State<MyPopupInformAddress> createState() => _MyPopupInformAddress();
}

class _MyPopupInformAddress extends State<MyPopupInformAddress> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(
          child: Column(children: [
        const Text("Endereço de Entrega"),
        Divider(
          indent: 15.0,
          endIndent: 15.0,
          color: Colors.black,
        ),
      ])),
      titleTextStyle: TextStyle(
          fontFamily: 'Arial',
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black),

      //

      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            decoration: InputDecoration(
              labelText: 'Rua',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 10),
          TextField(
            decoration: InputDecoration(
              labelText: 'Número',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 10),
          TextField(
            decoration: InputDecoration(
              labelText: 'Bairro',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 10),
          TextField(
            decoration: InputDecoration(
              labelText: 'Cidade',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 10),
          TextField(
            decoration: InputDecoration(
              labelText: 'Complemento (opcional)',
              border: OutlineInputBorder(),
            ),
          ),
        ],
      ),
      actions: [
        // TextButton(
        //   onPressed: () => Navigator.of(context).pop(),
        //   child: const Text("Cancelar"),
        // ),
        ElevatedButton(
          onPressed: () {
            // Lógica para salvar o endereço
            Navigator.of(context).pop();
          },
          child: const Text("Salvar"),
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.green, // Cor do texto branca
            textStyle: const TextStyle(
              fontFamily: 'Arial', // Fonte Arial
              fontWeight: FontWeight.bold, // Negrito
            ),
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
      ],
    );
  }
}
