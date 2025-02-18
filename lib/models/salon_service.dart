import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class SalonService {
  final int transactionId;
  final int customerId;
  final String customerName;
  final List<int> serviceIds;
  final List<String> serviceNames;
  final int workerId;
  final String workerName;
  final int price;

  String get serviceNamesFormatted => serviceNames.join(', ');
  String get priceFormatted => "₹$price";

  SalonService({
    required this.transactionId,
    required this.customerId,
    required this.customerName,
    required this.serviceIds,
    required this.serviceNames,
    required this.workerId,
    required this.workerName,
    required this.price,
  });

  factory SalonService.fromJson(Map<String, dynamic> json) {
    return SalonService(
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

 Future<List<SalonService>> loadSalonServices() async {
  // Load the JSON file from assets
  String jsonString = await rootBundle.loadString('assets/test_json_data/customer_data.json');

  // Decode JSON
  final Map<String, dynamic> decodedJson = json.decode(jsonString);
  final List<SalonService> salonServices = (decodedJson["serviceTransactions"] as List)
      .map((customer) => SalonService.fromJson(customer))
      .toList();

  return salonServices;
}

