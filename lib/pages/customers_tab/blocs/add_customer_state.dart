import 'package:white_label_business_app/models/customer.dart';

class AddCustomerState {
  final String customerName;
  final int age;
  final int mobileNumber;
  DateTime? dateOfJoining = DateTime.now();

  final bool isSuccess;
  final String? errorMessage;

  Customer? customer;

  AddCustomerState(
      {this.customerName = '',
      this.age = 0,
      this.mobileNumber = 0,
      this.isSuccess = false,
      this.dateOfJoining,
      this.errorMessage});

  AddCustomerState copyWith(
      {String? customerName,
      int? age,
      int? mobileNumber,
      bool? isSuccess,
      DateTime? dateOfJoining,
      String? errorMessage})
  {
    return AddCustomerState(
        customerName: customerName ?? this.customerName,
        age: age ?? this.age,
        mobileNumber: mobileNumber ?? this.mobileNumber,
        dateOfJoining: dateOfJoining ?? this.dateOfJoining,
        isSuccess: isSuccess ?? false,
        errorMessage: errorMessage);
  }

  void initCustomer(int customerId) {
    customer = Customer(
        id: customerId,
        name: customerName,
        age: age,
        mobile: mobileNumber,
        dateOfJoining: DateTime.now());
  }
}
