import 'package:white_label_business_app/models/worker.dart';

class WorkerPageState {
  int get workerCount => workers?.length ?? 0;
  List<Worker>? workers = List.empty(growable: true);

  WorkerPageState({this.workers});

  WorkerPageState init(List<Worker> workers) {
    this.workers = workers;
    return this;
  }

  WorkerPageState loadNewBatchOf({List<Worker>? workers}) {
    workers ??= List.empty(growable: true);
    this.workers?.addAll(workers);
    return this;
  }

  WorkerPageState addNew(newWorker) {
    workers?.insert(0, newWorker);
    return WorkerPageState(workers: workers);
  }
}
