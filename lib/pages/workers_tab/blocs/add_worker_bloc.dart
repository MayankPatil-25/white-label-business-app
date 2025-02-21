import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:white_label_business_app/constants/texts_constants.dart';
import 'package:white_label_business_app/data/static_storage.dart';
import 'package:white_label_business_app/pages/workers_tab/blocs/add_worker_event.dart';
import 'package:white_label_business_app/pages/workers_tab/blocs/add_worker_state.dart';

class AddWorkerBloc extends Bloc<AddWorkerEvent, AddWorkerState> {
  AddWorkerBloc() : super(AddWorkerState()) {
    on<WorkerNameChangedEvent>(onWorkerNameChanged);
    on<WorkerMobileNumberChangeEvent>(onWorkerMobileNumber);
    on<WorkerAgeChangedEvent>(onWorkerAgeChanged);
    on<DateOfJoiningChangedEvent>(onDateOfJoiningChanged);
    on<AddWorkerFormSubmittedEvent>(onAddWorkerFormSubmitted);
  }

  FutureOr<void> onWorkerNameChanged(
      WorkerNameChangedEvent event, Emitter<AddWorkerState> emit) {
    emit(state.copyWith(workerName: event.workerName));
  }

  FutureOr<void> onWorkerMobileNumber(
      WorkerMobileNumberChangeEvent event, Emitter<AddWorkerState> emit) {
    emit(state.copyWith(mobileNumber: event.mobileNumber));
  }

  FutureOr<void> onDateOfJoiningChanged(
      DateOfJoiningChangedEvent event, Emitter<AddWorkerState> emit) {
    emit(state.copyWith(dateOfJoining: event.dateTime));
  }

  FutureOr<void> onWorkerAgeChanged(
      WorkerAgeChangedEvent event, Emitter<AddWorkerState> emit) {
    emit(state.copyWith(age: event.age));
  }

  FutureOr<void> onAddWorkerFormSubmitted(
      AddWorkerFormSubmittedEvent event, Emitter<AddWorkerState> emit) {
    if (state.workerName.isNotEmpty && state.mobileNumber > 0) {
      var successState = state.copyWith(isSuccess: true);
      successState.initWorker(100 + StaticStorage.workersData.length + 1);
      emit(successState);
    } else {
      emit(state.copyWith(
          errorMessage: MConstants.validationEnterAllDetailsTryAgain));
    }
  }
}
