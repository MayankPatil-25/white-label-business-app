import 'package:white_label_business_app/models/worker.dart';
import 'package:white_label_business_app/models/salon_catalog.dart';
import 'package:white_label_business_app/models/worker.dart';

abstract class AddWorkerEvent { }

class WorkerNameChangedEvent extends AddWorkerEvent {
  final String workerName;
  WorkerNameChangedEvent(this.workerName);
}

class WorkerMobileNumberChangeEvent extends AddWorkerEvent {
  final int mobileNumber;
  WorkerMobileNumberChangeEvent(this.mobileNumber);
}

class WorkerAgeChangedEvent extends AddWorkerEvent {
  final int age;
  WorkerAgeChangedEvent(this.age);
}

class DateOfJoiningChangedEvent extends AddWorkerEvent {
  final DateTime dateTime;
  DateOfJoiningChangedEvent(this.dateTime);
}

class AddWorkerFormSubmittedEvent extends AddWorkerEvent { }