import 'package:white_label_business_app/models/customer.dart';
import 'package:white_label_business_app/models/salon_catelog.dart';
import 'package:white_label_business_app/models/worker.dart';

abstract class AddServiceEvent { }

class AddCustomerDetail extends AddServiceEvent {
  final Customer? customer;
  AddCustomerDetail(this.customer);
}

class AddSalonCatalogDetail extends AddServiceEvent {
  final SalonCatalog? catalogItem;
  AddSalonCatalogDetail(this.catalogItem);
}

class AddWorkerDetail extends AddServiceEvent {
  final Worker? worker;
  AddWorkerDetail(this.worker);
}

class AddPrice extends AddServiceEvent {
  final int price;
  AddPrice(this.price);
}

class AddSalonServiceSubmittedEvent extends AddServiceEvent { }