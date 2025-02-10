import 'package:flutter/material.dart';
import 'package:white_label_business_app/common/widgets/custom_widgets.dart';
import 'package:white_label_business_app/constants/texts_constants.dart';
import 'package:white_label_business_app/home_tabbar/common_views/custom_list_item.dart';
import 'package:white_label_business_app/constants/color_constants.dart';
import 'package:white_label_business_app/home_tabbar/workers_tab/add_worker.dart';

class WorkersPage extends StatelessWidget {

  final List<String> items = List.generate(3, (index) => "Item $index");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MColors.primaryAppColor,
        title: Text(
          MConstants.titleWorkers,
          textAlign: TextAlign.center,
          style: MCustomWidgets.textStyle(
              fontSize: 40, color: MColors.buttonTextColor),
        ),
        automaticallyImplyLeading: false,
      ),
      backgroundColor: MColors.pageBackgroundColor,
      body: Column(
        children: [
          Container(margin: EdgeInsets.only(top: 2),
              color: MColors.primaryTextColor,
              height: 0,
              width: double.infinity),
          // Account Summary Container
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              color: MColors.secondaryTextColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 10,
                  spreadRadius: 2,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "3",
                  style: MCustomWidgets.textStyle(fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87),
                ),
                // Text(
                //   '(Happily served)',
                //   style: MCustomWidgets.textStyle(fontSize: 12, fontWeight: FontWeight.normal, color: MColors.buttonTextColor),
                // )
              ],
            ),
          ),

          // List of Items (Wrapped in Expanded to prevent infinite height error)
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Padding(padding: EdgeInsets.all(9),
                    child: CustomerCard(
                        customerName: "Babloo Pannasiya",
                        serviceName: "Since 2005",
                        workerName: "Age: 40", price: null));
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        foregroundColor: MColors.primaryAppColor,
        backgroundColor: MColors.primaryAppColor,
        onPressed: () => onAddClicked(context),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        child: Icon(Icons.plus_one, size: 30,
            color: MColors.buttonTextColor),
      ),
    );
  }

  void onAddClicked(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddWorker()));
  }
}