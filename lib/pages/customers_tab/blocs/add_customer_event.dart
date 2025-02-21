import 'package:white_label_business_app/models/customer.dart';
import 'package:white_label_business_app/models/salon_catalog.dart';
import 'package:white_label_business_app/models/worker.dart';

abstract class AddCustomerEvent { }

class CustomerNameChangedEvent extends AddCustomerEvent {
  final String customerName;
  CustomerNameChangedEvent(this.customerName);
}

class CustomerMobileNumberChangeEvent extends AddCustomerEvent {
  final int mobileNumber;
  CustomerMobileNumberChangeEvent(this.mobileNumber);
}

class CustomerAgeChangedEvent extends AddCustomerEvent {
  final int age;
  CustomerAgeChangedEvent(this.age);
}

class DateOfJoiningChangedEvent extends AddCustomerEvent {
  final DateTime dateTime;
  DateOfJoiningChangedEvent(this.dateTime);
}

class AddCustomerFormSubmittedEvent extends AddCustomerEvent { }