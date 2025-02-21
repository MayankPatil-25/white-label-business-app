import 'package:flutter/material.dart';
import 'package:white_label_business_app/common/widgets/custom_widgets.dart';
import 'package:white_label_business_app/constants/color_constants.dart';

class CustomerCard extends StatelessWidget {
  final String customerName;
  final String serviceName;
  final String workerName;
  final String? price;

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
        borderRadius: BorderRadius.circular(7),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Row(children:[Expanded(child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            customerName,
            style: MCustomWidgets.textStyle(fontSize: 18, fontWeight: FontWeight.normal, color: MColors.primaryTextColor),
          ),
          SizedBox(height: 4),
          Text(
            serviceName,
              style: MCustomWidgets.textStyle(fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: MColors.secondaryTextColor)
          ),
          SizedBox(height: 2),
          Text(
              workerName,
              style: MCustomWidgets.textStyle(fontSize: 12,
                  fontWeight: FontWeight.normal,
                  color: MColors.secondaryTextColor,
                  fontStyle: FontStyle.italic)
          )
        ])
      ),
        Align(
          alignment: Alignment.centerRight,
          child: price == null ? Icon(Icons.arrow_forward_ios_rounded,
              size: 16,
              color: MColors.primaryAppColor) : Text(
            price!,
            style: MCustomWidgets.textStyle(fontSize: 18,
                fontWeight: FontWeight.bold,
                color: MColors.primaryAppColor)
          ),
        )
      ])
    );
  }
}