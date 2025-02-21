import 'package:white_label_business_app/models/customer.dart';
import 'package:white_label_business_app/models/salon_service.dart';

abstract class CustomerPageEvent { }

class LoadCustomerListEvent extends CustomerPageEvent {
  LoadCustomerListEvent();
}

class AddNewCustomerEvent extends CustomerPageEvent {
  final Customer customer;
  AddNewCustomerEvent(this.customer);
}



