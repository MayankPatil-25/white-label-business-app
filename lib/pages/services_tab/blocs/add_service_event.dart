import 'package:white_label_business_app/models/customer.dart';
import 'package:white_label_business_app/models/salon_catelog.dart';
import 'package:white_label_business_app/models/worker.dart';

abstract class AddServiceEvent { }

class AddCustomerDetailEvent extends AddServiceEvent {
  final Customer? customer;
  AddCustomerDetailEvent(this.customer);
}

class AddSalonCatalogDetailEvent extends AddServiceEvent {
  final SalonCatalog? catalogItem;
  AddSalonCatalogDetailEvent(this.catalogItem);
}

class AddWorkerDetailEvent extends AddServiceEvent {
  final Worker? worker;
  AddWorkerDetailEvent(this.worker);
}

class AddPriceEvent extends AddServiceEvent {
  final int price;
  AddPriceEvent(this.price);
}

class AddSalonServiceSubmittedEvent extends AddServiceEvent { }