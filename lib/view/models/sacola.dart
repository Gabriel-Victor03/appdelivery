import 'dart:io';

class Sacola {
  String objectId;
  double subtotal;

  Sacola({
    required this.objectId,
    required this.subtotal,
  });

  Map<String, dynamic> toMap() {
    return {
      'objectId': objectId,
      'subtotal': subtotal,

    };
  }

  factory Sacola.fromMap(Map<String, dynamic> map) {
    return Sacola(
      objectId: map['objectId'], 
      subtotal: map['subtotal']);
    }
}