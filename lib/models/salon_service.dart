import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class ServiceTransaction {
  final int transactionId;
  final int customerId;
  final String customerName;
  final List<int> serviceIds;
  final List<String> serviceNames;
  final int workerId;
  final String workerName;
  final int price;

  String get serviceNamesFormatted => this.serviceNames.join(', ');
  String get priceFormatted => "₹$price";

  ServiceTransaction({
    required this.transactionId,
    required this.customerId,
    required this.customerName,
    required this.serviceIds,
    required this.serviceNames,
    required this.workerId,
    required this.workerName,
    required this.price,
  });



  factory ServiceTransaction.fromJson(Map<String, dynamic> json) {
    return ServiceTransaction(
      transactionId: json["transactionId"],
      customerId: json["customerId"],
      customerName: json["customerName"],
      serviceIds: List<int>.from(json["serviceIds"]),
      serviceNames: List<String>.from(json["serviceNames"]),
      workerId: json["workerId"],
      workerName: json["workerName"],
      price: json["price"],
    );
  }
}

 Future<List<ServiceTransaction>> loadServiceTransactions() async {
  // Load the JSON file from assets
  String jsonString = await rootBundle.loadString('assets/test_json_data/customer_data.json');

  // Decode JSON
  final Map<String, dynamic> decodedJson = json.decode(jsonString);
  final List<ServiceTransaction> customers = (decodedJson["serviceTransactions"] as List)
      .map((customer) => ServiceTransaction.fromJson(customer))
      .toList();

  return customers;
}

