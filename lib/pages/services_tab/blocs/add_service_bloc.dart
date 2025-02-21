import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:white_label_business_app/pages/services_tab/blocs/add_service_event.dart';
import 'package:white_label_business_app/pages/services_tab/blocs/add_service_state.dart';

class AddServiceBloc extends Bloc<AddServiceEvent, AddServiceState> {
  AddServiceBloc() : super(AddServiceState()) {
    on<AddWorkerDetailEvent>(onUpdateWorkerDetail);
    on<AddCustomerDetailEvent>(onUpdateCustomerDetail);
    on<AddSalonCatalogDetailEvent>(onUpdateSalonCatalogDetail);
    on<AddPriceEvent>(onUpdatePrice);
    on<AddSalonServiceSubmittedEvent>(onSubmitSalonServiceForm);
  }

  FutureOr<void> onUpdateWorkerDetail(
      AddWorkerDetailEvent event, Emitter<AddServiceState> emit) {
    if (event.worker != null) {
      emit(state.copyWith(
          workerId: event.worker!.id, workerName: event.worker!.name));
    }
  }

  FutureOr<void> onUpdateSalonCatalogDetail(
      AddSalonCatalogDetailEvent event, Emitter<AddServiceState> emit) {
    if (event.catalogItem != null) {
      emit(state.copyWith(serviceIds: [event.catalogItem!.id],
          serviceNames: [event.catalogItem!.name]));
    }
  }

  FutureOr<void> onUpdateCustomerDetail(
      AddCustomerDetailEvent event, Emitter<AddServiceState> emit) {
    if (event.customer != null) {
      emit(state.copyWith(customerId: event.customer!.id, customerName: event.customer!.name));
    }
  }

  FutureOr<void> onUpdatePrice(AddPriceEvent event, Emitter<AddServiceState> emit) {
    emit(state.copyWith(price: event.price));
  }

  FutureOr<void> onSubmitSalonServiceForm(
      AddSalonServiceSubmittedEvent event, Emitter<AddServiceState> emit) {
    if (state.customerName.isNotEmpty &&
        state.workerName.isNotEmpty &&
        (state.serviceNames?.length ?? 0) > 0) {
      var successState = state.copyWith(isSuccess: true);
      successState.initSalonService(1007);
      emit(successState);
    } else {
      emit(state.copyWith(
          errorMessage: 'Please enter all the details and try again.'));
    }
  }
}
