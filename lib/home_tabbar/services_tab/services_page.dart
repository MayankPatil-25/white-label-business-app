

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:white_label_business_app/common/widgets/custom_widgets.dart';
import 'package:white_label_business_app/home_tabbar/common_views/custom_list_item.dart';

import '../../constants/color_constants.dart';
import '../home_tabbed_page.dart';

class ServicesPage extends StatelessWidget {

  final List<String> items = List.generate(15, (index) => "Item $index");

  @override
  Widget build(BuildContext context) {

    return Scaffold( backgroundColor: MColors.pageBackgroundColor,
      body: SizedBox(
     child:  Column(
    children:  [Expanded(flex: 2, child:
    Container(margin: EdgeInsets.all(12),
        width: double.infinity,
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: MColors.primaryAppColor.withAlpha(100),
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
              Text('Today\'s Account', style: MCustomWidgets.textStyle(fontSize: 24, fontWeight: FontWeight.w600)),
              SizedBox(height: 4),
              Text("₹5000", style: MCustomWidgets.textStyle(fontSize: 32, fontWeight: FontWeight.bold)),
              SizedBox(height: 2)]
        )
      )
    ),

      Expanded(flex: 8, child:
      ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Padding(padding: EdgeInsets.all(9),
          child: CustomerCard(
            customerName: "Babloo Pannasiya",
            serviceName: "Service name",
            workerName: "Worker name",
            price: "₹200",
          ));
        }))
      ])
      )
    );
  }
}