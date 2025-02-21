import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class Customer {
  final int id;
  final String name;
  final int mobile;
  final DateTime dateOfJoining;
  final int age;
  // todo: we have to add following items:
  // lastVisitDateTime
  // pending amount if possible

  Customer({
    required this.id,
    required this.name,
    required this.age,
    required this.mobile,
    required this.dateOfJoining
  });

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      id: json["id"],
      name: json["name"],
      age: json["age"],
      mobile: json["mobile"],
      dateOfJoining: json["dateOfJoining"]
    );
  }
}

