import 'package:white_label_business_app/models/worker.dart';

class AddWorkerState {
  final String workerName;
  final int age;
  final int mobileNumber;
  DateTime? dateOfJoining = DateTime.now();

  final bool isSuccess;
  final String? errorMessage;

  Worker? worker;

  AddWorkerState(
      {this.workerName = '',
      this.age = 0,
      this.mobileNumber = 0,
      this.isSuccess = false,
      this.dateOfJoining,
      this.errorMessage});

  AddWorkerState copyWith(
      {String? workerName,
      int? age,
      int? mobileNumber,
      bool? isSuccess,
      DateTime? dateOfJoining,
      String? errorMessage})
  {
    return AddWorkerState(
        workerName: workerName ?? this.workerName,
        age: age ?? this.age,
        mobileNumber: mobileNumber ?? this.mobileNumber,
        dateOfJoining: dateOfJoining ?? this.dateOfJoining,
        isSuccess: isSuccess ?? false,
        errorMessage: errorMessage);
  }

  void initWorker(int workerId) {
    worker = Worker(
        id: workerId,
        name: workerName,
        age: age,
        mobile: mobileNumber,
        dateOfJoining: DateTime.now());
  }
}
