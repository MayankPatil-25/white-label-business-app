import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:white_label_business_app/common/widgets/custom_widgets.dart';
import 'package:white_label_business_app/constants/texts_constants.dart';
import 'package:white_label_business_app/pages/common_views/base_scaffold.dart';
import 'package:white_label_business_app/pages/customers_tab/blocs/add_customer_bloc.dart';
import 'package:white_label_business_app/pages/customers_tab/blocs/add_customer_event.dart';
import 'package:white_label_business_app/pages/customers_tab/blocs/add_customer_state.dart';

class AddCustomer extends StatefulWidget {
  const AddCustomer({super.key});

  @override
  State<AddCustomer> createState() => _AddCustomerState();
}

class _AddCustomerState extends State<AddCustomer> {
  AddCustomerBloc? _addCustomerBloc;
  final TextEditingController _textEditingControllerName =
      TextEditingController();
  final TextEditingController _textEditingControllerNumber =
      TextEditingController();
  final TextEditingController _textEditingControllerAge =
      TextEditingController();
  final TextEditingController _textEditingControllerDate =
      TextEditingController();

  @override
  void initState() {
    super.initState();
    _addCustomerBloc = AddCustomerBloc();
  }

  @override
  void dispose() {
    super.dispose();
    _addCustomerBloc?.close();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
        title: MConstants.titleAddCustomer,
        body: SingleChildScrollView(
            child: BlocConsumer<AddCustomerBloc, AddCustomerState>(
                bloc: _addCustomerBloc,
                listener: (context, state) {
                  onAddCustomerResult(context, state);
                },
                builder: (context, state) {
                  return Container(
                      margin: EdgeInsets.only(top: 25),
                      padding: EdgeInsets.all(20),
                      child: Column(
                        spacing: 19,
                        children: [
                          MCustomWidgets.getCustomInputFieldWithBloc(
                              caption: MConstants.customerName,
                              hintText: '',
                              controller: _textEditingControllerName,
                              errorText: null,
                              onTextChanged: (value) => {
                                    _addCustomerBloc
                                        ?.add(CustomerNameChangedEvent(value))
                                  }),
                          MCustomWidgets.getCustomInputFieldWithBloc(
                              caption: MConstants.mobileNumber,
                              hintText: '',
                              controller: _textEditingControllerNumber,
                              errorText: null,
                              inputType: TextInputType.number,
                              onTextChanged: (value) => {
                                    _addCustomerBloc?.add(
                                        CustomerMobileNumberChangeEvent(
                                            int.parse(value)))
                                  }),
                          // Age
                          MCustomWidgets.getCustomInputFieldWithBloc(
                              caption: MConstants.age,
                              hintText: '',
                              controller: _textEditingControllerAge,
                              errorText: null,
                              inputType: TextInputType.number,
                              onTextChanged: (value) => {
                                    _addCustomerBloc?.add(
                                        CustomerAgeChangedEvent(
                                            int.parse(value)))
                                  }),
                          // Date of Joining
                          MCustomWidgets.getCustomInputFieldWithBloc(
                              caption: MConstants.dateOfJoining,
                              hintText: '',
                              controller: _textEditingControllerDate,
                              errorText: null,
                              inputType: TextInputType.datetime,
                              onTextChanged: (value) => {
                                    _addCustomerBloc?.add(
                                        DateOfJoiningChangedEvent(
                                            DateTime.parse(value)))
                                  }),
                          Container(
                              margin: EdgeInsets.only(top: 25),
                              child: MCustomWidgets.getCustomButton(
                                  MConstants.titleAddCustomer, () {
                                _addCustomerBloc
                                    ?.add(AddCustomerFormSubmittedEvent());
                              })
                          )
                        ])
                      );
                })
        )
    );
  }

  void onAddCustomerResult(BuildContext context, AddCustomerState state) {
    if (state.errorMessage != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(state.errorMessage!)),
      );
      return;
    }

    if (!state.isSuccess) {
      return;
    }

    if (state.customer != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Added Successfully.')),
      );

      // Add Customer button clicked
      Navigator.pop(context, state.customer);
    }
  }
}
