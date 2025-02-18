import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:white_label_business_app/common/widgets/custom_widgets.dart';
import 'package:white_label_business_app/constants/texts_constants.dart';
import 'package:white_label_business_app/pages/common_views/base_scaffold.dart';
import 'package:white_label_business_app/pages/common_views/custom_list_item.dart';
import 'package:white_label_business_app/constants/color_constants.dart';
import 'package:white_label_business_app/pages/customers_tab/add_customer.dart';
import 'package:white_label_business_app/pages/customers_tab/blocs/customer_page_bloc.dart';
import 'package:white_label_business_app/pages/customers_tab/blocs/customer_page_event.dart';
import 'package:white_label_business_app/pages/customers_tab/blocs/customer_page_state.dart';
import 'package:white_label_business_app/pages/services_tab/blocs/service_page_bloc.dart';
import 'package:white_label_business_app/pages/services_tab/blocs/service_page_event.dart';
import 'package:white_label_business_app/pages/services_tab/blocs/service_page_state.dart';

class CustomersPage extends StatefulWidget {
  @override
  State<CustomersPage> createState() => _CustomersPageState();
}

class _CustomersPageState extends State<CustomersPage> {
  late CustomerPageBloc _customerPageBloc;

  @override
  Widget build(BuildContext context) {
    _customerPageBloc = BlocProvider.of<CustomerPageBloc>(context);
    _customerPageBloc.add(LoadCustomerListEvent());

    return BaseScaffold(
        title: MConstants.titleCustomers,
        body: BlocConsumer<CustomerPageBloc, CustomerPageState>(
            bloc: _customerPageBloc,
            listener: (context, state) {
              // add lazy loading here I believe.
            },
            builder: (context, state) {
              return Column(children: [
                Container(
                    margin: EdgeInsets.only(top: 2),
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
                        state.customerCount.toString(),
                        style: MCustomWidgets.textStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87),
                      ),
                      Text(
                        '(and counting . . .)',
                        style: MCustomWidgets.textStyle(fontSize: 12, fontWeight: FontWeight.normal, color: MColors.buttonTextColor),
                      )
                    ],
                  ),
                ),
                // List of Items (Wrapped in Expanded to prevent infinite height error)
                Expanded(
                  child: ListView.builder(
                    itemCount: state.customers?.length ?? 0,
                    itemBuilder: (context, index) {
                      return Padding(
                          padding: EdgeInsets.all(9),
                          child: CustomerCard(
                              customerName:
                                  state.customers![index].name,
                              serviceName: state.customers![index].age.toString(),
                              workerName: state.customers![index].dateOfJoining.toString(),
                              price: null));
                    },
                  ),
                ),
              ]);
            }),
        floatingActionButton: MCustomWidgets.getCustomFloatingButton(
            Icons.person_add_alt_1_sharp, () => onAddClicked(context))
    );
  }

  void onAddClicked(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => AddCustomer()));
  }
}
