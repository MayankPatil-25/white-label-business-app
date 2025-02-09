import 'package:flutter/material.dart';
import 'package:white_label_business_app/constants/color_constants.dart';

class CustomerCard extends StatelessWidget {
  final String customerName;
  final String serviceName;
  final String workerName;
  final String price;

  CustomerCard({
    required this.customerName,
    required this.serviceName,
    required this.workerName,
    required this.price,
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: MColors.listItemColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Customer: $customerName",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 4),
          Text(
            serviceName,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 2),
          Text(
            workerName,
            style: TextStyle(fontSize: 14, color: Colors.black54),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              price,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }
}