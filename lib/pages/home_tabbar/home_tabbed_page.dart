import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:white_label_business_app/constants/color_constants.dart';
import 'package:white_label_business_app/data/static_storage.dart';
import 'package:white_label_business_app/pages/customers_tab/blocs/customer_page_bloc.dart';
import 'package:white_label_business_app/pages/customers_tab/customers_page.dart';
import 'package:white_label_business_app/pages/services_tab/blocs/service_page_bloc.dart';
import 'package:white_label_business_app/pages/services_tab/services_page.dart';
import 'package:white_label_business_app/pages/workers_tab/workers_page.dart';
import 'package:white_label_business_app/models/worker.dart';

class HomeTabbedPage extends StatefulWidget {
  const HomeTabbedPage({super.key});

  @override
  _HomeTabbedPageState createState() => _HomeTabbedPageState();
}

class _HomeTabbedPageState extends State<HomeTabbedPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<ServicePageBloc>(create: (_) => ServicePageBloc()),
          BlocProvider<CustomerPageBloc>(create: (_) => CustomerPageBloc())
        ],
        child: SafeArea(
            top: false,
            child: DefaultTabController(
              length: 3, // Number of tabs
              child: Scaffold(
                backgroundColor: MColors.pageBackgroundColor,
                bottomNavigationBar: Column(
                    mainAxisSize: MainAxisSize.min,
                    spacing: 0,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                          padding: EdgeInsets.zero,
                          child: Container(
                              height: 2,
                              width: double.infinity,
                              decoration: BoxDecoration(boxShadow: [
                                BoxShadow(
                                  color:
                                      MColors.secondaryTextColor.withAlpha(30),
                                  // Shadow color with opacity
                                  offset: Offset(0, 5),
                                  // Negative Y value to create a top shadow
                                  blurRadius: 1,
                                  // Adjust the blur of the shadow
                                  spreadRadius:
                                      1, // Adjust the spread of the shadow
                                ),
                              ]))),
                      TabBar(
                        controller: _tabController,
                        labelColor: MColors.primaryAppColor,
                        // Selected text/icon color
                        unselectedLabelColor: Colors.grey,
                        // Unselected color
                        indicatorColor: Colors.transparent,
                        tabs: [
                          Tab(
                              icon: Icon(Icons.work_outline_rounded),
                              text: "Service"),
                          Tab(icon: Icon(Icons.groups), text: "Customers"),
                          Tab(icon: Icon(Icons.hail), text: "Workers"),
                        ],
                      )
                    ]),
                body: TabBarView(
                  controller: _tabController,
                  children: [
                    SalonServicesPage(),
                    CustomersPage(),
                    WorkersPage(),
                  ],
                ),
              ),
            )
        )
    );
  }
}
