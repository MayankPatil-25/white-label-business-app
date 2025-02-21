import 'package:white_label_business_app/models/worker.dart';

abstract class WorkerPageEvent { }

class LoadWorkerListEvent extends WorkerPageEvent {
  LoadWorkerListEvent();
}

class AddNewWorkerEvent extends WorkerPageEvent {
  final Worker worker;
  AddNewWorkerEvent(this.worker);
}



