import 'package:white_label_business_app/models/salon_service.dart';

class ServicePageState {

  int? totalAmount = 0;
  List<SalonService>? salonServices = List.empty(growable: true);

  String get totalAmountFormatted {
    var amountText = totalAmount ??= 0;
    return "₹$amountText";
  }

  ServicePageState({this.totalAmount,
    this.salonServices});

  ServicePageState init(List<SalonService> transactions) {
    salonServices = transactions;
    totalAmount = salonServices?.map((transaction) => transaction.price).reduce((a,b) => a+b) ?? 0;
    return this;
  }

  ServicePageState loadNewBatchOf({List<SalonService>? transactions}) {
    transactions ??= List.empty(growable: true);
    salonServices?.addAll(transactions);
    return this;
  }

  ServicePageState addNew(transaction) {
    salonServices?.insert(0, transaction);
    totalAmount = salonServices?.map((transaction) => transaction.price).reduce((a,b) => a+b) ?? 0;
    return ServicePageState(totalAmount: totalAmount, salonServices: this.salonServices);
  }
}