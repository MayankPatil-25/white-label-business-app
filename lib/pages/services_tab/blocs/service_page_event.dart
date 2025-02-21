import 'package:white_label_business_app/models/salon_service.dart';

abstract class ServicePageEvent { }

class LoadSalonServiceListEvent extends ServicePageEvent {
  LoadSalonServiceListEvent();
}

class AddNewSalonServiceEvent extends ServicePageEvent {
  final SalonService transaction;
  AddNewSalonServiceEvent(this.transaction);
}



