import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:white_label_business_app/data/static_storage.dart';
import 'package:white_label_business_app/pages/workers_tab/blocs/worker_page_event.dart';
import 'package:white_label_business_app/pages/workers_tab/blocs/worker_page_state.dart';

class WorkerPageBloc extends Bloc<WorkerPageEvent, WorkerPageState> {
  WorkerPageBloc() : super(WorkerPageState()) {
    on<LoadWorkerListEvent>(onLoadWorkerList);
    on<AddNewWorkerEvent>(onAddNewWorker);
  }

  FutureOr<void> onAddNewWorker(AddNewWorkerEvent event, Emitter<WorkerPageState> emit) {
    emit(state.addNew(event.worker));
  }

  FutureOr<void> onLoadWorkerList(LoadWorkerListEvent event, Emitter<WorkerPageState> emit) async {
    var isListEmpty = state.workers?.isEmpty ?? true;

    if (!isListEmpty) {
      StaticStorage.workersData.addAll(state.workers!);
    }

    emit(state.init(StaticStorage.workersData));

    // todo: use state.loadNewBatchOf() when we do pagination

  }
}
