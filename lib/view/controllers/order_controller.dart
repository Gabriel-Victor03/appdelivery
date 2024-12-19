import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class OrderController with ChangeNotifier {
  String? orderId;
  List<Map<String, dynamic>> _orders = [];
  List<Map<String, dynamic>> get orders => _orders;

  Future<void> createOrder({
    required String name,
    required String phone,
    required String deliveryTypeId,
    required String sacolaId,
    required String paymentMethod,
    required double total,
    required List<Map<String, dynamic>> products,
  }) async {
    try {
      final order = ParseObject('Order')
        ..set('name', name)
        ..set('phone', phone)
        ..set('paymentMethod', paymentMethod)
        ..set('total', total)
        ..set('products', products)
        ..set('status', 'pending')
        ..set('date', DateTime.now().toIso8601String());

      // Relacionar com Tipo_Entrega
      final tipoEntrega = ParseObject('Tipo_Entrega')..objectId = deliveryTypeId;
      order.set('tipoEntrega', tipoEntrega);

      // Relacionar com Sacola
      final sacola = ParseObject('Sacola')..objectId = sacolaId;
      order.set('sacola', sacola);

      final response = await order.save();

      if (response.success && order.objectId != null) {
        orderId = order.objectId!;
        print("Novo pedido criado com ID: $orderId");
      } else {
        print("Erro ao criar pedido: ${response.error?.message}");
      }
    } catch (e) {
      print("Erro ao criar pedido: $e");
    }
  }

  Future<void> fetchOrders() async {
    try {
      final queryOrder = QueryBuilder<ParseObject>(ParseObject('Order'));

      final responseOrder = await queryOrder.query();

      if (responseOrder.success && responseOrder.results != null) {
        _orders.clear();
        for (var item in responseOrder.results!) {
          final order = item as ParseObject;
          final name = order.get<String>('name');
          final phone = order.get<String>('phone');
          final total = order.get<num>('total')?.toDouble() ?? 0.0;
          final status = order.get<String>('status');

          _orders.add({
            'id': order.objectId,
            'name': name,
            'phone': phone,
            'total': total,
            'status': status,
          });

          print("Pedido: $name, Telefone: $phone, Total: $total, Status: $status");
        }
        notifyListeners();
      } else {
        print("Erro ao buscar pedidos: ${responseOrder.error?.message}");
      }
    } catch (e) {
      print("Erro ao buscar pedidos: $e");
    }
  }
}
