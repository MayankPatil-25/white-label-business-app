import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class Worker {
  final int id;
  final String name;
  final int mobile;
  final DateTime dateOfJoining;
  final int age;

  Worker({
    required this.id,
    required this.name,
    required this.age,
    required this.mobile,
    required this.dateOfJoining
  });

  factory Worker.fromJson(Map<String, dynamic> json) {
    return Worker(
        id: json["id"],
        name: json["name"],
        age: json["age"],
        mobile: json["mobile"],
        dateOfJoining: json["dateOfJoining"]
    );
  }
}