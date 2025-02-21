import 'package:white_label_business_app/models/customer.dart';
import 'package:white_label_business_app/models/salon_service.dart';

class CustomerPageState {
  int get customerCount => customers?.length ?? 0;
  List<Customer>? customers = List.empty(growable: true);

  CustomerPageState({this.customers});

  CustomerPageState init(List<Customer> customers) {
    this.customers = customers;
    return this;
  }

  CustomerPageState loadNewBatchOf({List<Customer>? customers}) {
    customers ??= List.empty(growable: true);
    this.customers?.addAll(customers);
    return this;
  }

  CustomerPageState addNew(newCustomer) {
    customers?.insert(0, newCustomer);
    return CustomerPageState(customers: customers);
  }
}
