import 'package:white_label_business_app/models/salon_service.dart';

class AddServiceState {
  final int customerId;
  final String customerName;
  final List<int>? serviceIds;
  final List<String>? serviceNames;
  final int workerId;
  final String workerName;
  final int price;
  final bool isSuccess;

  final String? errorMessage;

  SalonService? salonService;

  AddServiceState(
      {this.customerId = 0,
      this.customerName = '',
      this.workerId = 0,
      this.workerName = "",
      this.price = 0,
      this.isSuccess = false,
      this.serviceIds,
      this.serviceNames,
      this.errorMessage});

  AddServiceState copyWith(
      {int? customerId,
      String? customerName,
      List<int>? serviceIds,
      List<String>? serviceNames,
      int? workerId,
      String? workerName,
      int? price,
      bool? isSuccess,
      String? errorMessage}) {

    return AddServiceState(
        customerId: customerId ?? this.customerId,
        customerName: customerName ?? this.customerName,
        serviceIds: serviceIds ?? this.serviceIds,
        serviceNames: serviceNames ?? this.serviceNames,
        workerId: workerId ?? this.workerId,
        workerName: workerName ?? this.workerName,
        price: price ?? this.price,
        isSuccess: isSuccess ?? false,
        errorMessage: errorMessage);
  }

  void initSalonService(int transactionId) {
   salonService = SalonService(
        transactionId: transactionId,
        customerId: customerId,
        customerName: customerName,
        serviceIds: serviceIds ?? [],
        serviceNames: serviceNames ?? [],
        workerId: workerId,
        workerName: workerName,
        price: price);
  }
}
