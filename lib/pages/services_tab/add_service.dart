import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:white_label_business_app/common/widgets/custom_widgets.dart';
import 'package:white_label_business_app/constants/texts_constants.dart';
import 'package:white_label_business_app/data/static_storage.dart';
import 'package:white_label_business_app/models/customer.dart';
import 'package:white_label_business_app/models/salon_catalog.dart';
import 'package:white_label_business_app/models/worker.dart';
import 'package:white_label_business_app/pages/common_views/base_scaffold.dart';
import 'package:white_label_business_app/pages/services_tab/blocs/add_service_bloc.dart';
import 'package:white_label_business_app/pages/services_tab/blocs/add_service_event.dart';
import 'package:white_label_business_app/pages/services_tab/blocs/add_service_state.dart';

class AddService extends StatefulWidget {
  const AddService({super.key});

  @override
  State<StatefulWidget> createState() => _AddServiceState();
}

class _AddServiceState extends State<AddService> {
  final TextEditingController _textEditingController = TextEditingController();
  AddServiceBloc? _addServiceBloc;

  static List<Worker> get workers => StaticStorage.workersData;

  static List<Customer> get customers => StaticStorage.customersData;

  static List<SalonCatalog> get serviceCatalog => StaticStorage.salonCatalog;

  Customer? _selectedCustomer;
  Worker? _selectedWorker;
  SalonCatalog? _selectedCatalog;

  @override
  void initState() {
    super.initState();
    _addServiceBloc = AddServiceBloc();
  }

  @override
  void dispose() {
    super.dispose();
    _addServiceBloc?.close();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
        title: MConstants.titleAddService,
        body: SingleChildScrollView(
            child: BlocConsumer<AddServiceBloc, AddServiceState>(
                bloc: _addServiceBloc,
                listener: (context, state) {
                  onAddServiceResult(context, state);
                },
                builder: (context, state) {
                  return Container(
                          margin: EdgeInsets.only(top: 25),
                          padding: EdgeInsets.all(20),
                          child: Column(spacing: 19, children: [
                            // Service Catalog Dropdown
                            MCustomWidgets.getCustomDropDown<Customer>(
                                caption: MConstants.customerName,
                                listOfItems: customers,
                                onChanged: onCustomerSelected,
                                selectedValue: _selectedCustomer,
                                menuItems: customers.map((item) {
                                  return DropdownMenuItem<Customer>(
                                    value: item,
                                    child: Text(item.name),
                                  );
                                }).toList()),
                            // Service Catalog Dropdown
                            MCustomWidgets.getCustomDropDown<SalonCatalog>(
                                caption: MConstants.service,
                                listOfItems: serviceCatalog,
                                onChanged: onServiceCatalogItemSelected,
                                selectedValue: _selectedCatalog,
                                menuItems: serviceCatalog.map((item) {
                                  return DropdownMenuItem<SalonCatalog>(
                                    value: item,
                                    child: Text(item.name),
                                  );
                                }).toList()),
                            // Worker Dropdown
                            MCustomWidgets.getCustomDropDown<Worker>(
                                caption: MConstants.worker,
                                listOfItems: workers,
                                onChanged: onWorkerSelected,
                                selectedValue: _selectedWorker,
                                menuItems: workers.map((item) {
                                  return DropdownMenuItem<Worker>(
                                    value: item,
                                    child: Text(item.name),
                                  );
                                }).toList()),
                            // Amount
                            MCustomWidgets.getCustomInputFieldWithBloc(
                                caption: MConstants.amount,
                                hintText: '',
                                controller: _textEditingController,
                                errorText: null,
                                inputType: TextInputType.number,
                                onTextChanged: (value) => {
                                      _addServiceBloc
                                          ?.add(AddPriceEvent(int.parse(value)))
                                    }),
                            Container(
                                margin: EdgeInsets.only(top: 25),
                                child: MCustomWidgets.getCustomButton(
                                    MConstants.titleAddService, () {
                                  // invoking submit - bloc
                                  _addServiceBloc
                                      ?.add(AddSalonServiceSubmittedEvent());
                                })
                            )
                          ])
                  );
                })
        )
    );
  }

  void onAddServiceResult(BuildContext context, AddServiceState state) {
    if (state.errorMessage != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(state.errorMessage!)),
      );
      return;
    }

    if (!state.isSuccess) {
      return;
    }

    if (state.salonService != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Added Successfully.')),
      );

      // Add Service button clicked
      Navigator.pop(context, state.salonService);
    }
  }

  void onWorkerSelected(Worker? worker) {
    _selectedWorker = worker;
    _addServiceBloc?.add(AddWorkerDetailEvent(worker));
  }

  void onServiceCatalogItemSelected(SalonCatalog? catalogItem) {
    _selectedCatalog = catalogItem;
    _addServiceBloc?.add(AddSalonCatalogDetailEvent(catalogItem));
  }

  void onCustomerSelected(Customer? customer) {
    _selectedCustomer = customer;
    _addServiceBloc?.add(AddCustomerDetailEvent(customer));
  }
}
