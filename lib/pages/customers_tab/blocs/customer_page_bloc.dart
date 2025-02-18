import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:white_label_business_app/data/static_storage.dart';
import 'package:white_label_business_app/pages/customers_tab/blocs/customer_page_event.dart';
import 'package:white_label_business_app/pages/customers_tab/blocs/customer_page_state.dart';

class CustomerPageBloc extends Bloc<CustomerPageEvent, CustomerPageState> {
  CustomerPageBloc() : super(CustomerPageState()) {
    on<LoadCustomerListEvent>(onLoadCustomerList);
    on<AddNewCustomerEvent>(onAddNewCustomer);
  }

  FutureOr<void> onAddNewCustomer(AddNewCustomerEvent event, Emitter<CustomerPageState> emit) {
    StaticStorage.customersData.add(event.customer);
    emit(state.addNew(event.customer));
  }

  FutureOr<void> onLoadCustomerList(LoadCustomerListEvent event, Emitter<CustomerPageState> emit) async {
    var isListEmpty = state.customers?.isEmpty ?? true;

    if (!isListEmpty) {
      StaticStorage.customersData.addAll(state.customers!);
    }

    emit(state.init(StaticStorage.customersData));

    // todo: use state.loadNewBatchOf() when we do pagination
  }
}
