import 'package:white_label_business_app/models/salon_service.dart';

class ServicePageState {

  List<ServiceTransaction>? serviceTransactions = List.empty(growable: true);

  ServicePageState({this.serviceTransactions});

  ServicePageState addNewChunk({transactions}) {
    return ServicePageState(serviceTransactions: transactions);
  }
}