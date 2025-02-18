import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:white_label_business_app/data/static_storage.dart';
import 'package:white_label_business_app/models/salon_service.dart';
import 'package:white_label_business_app/pages/services_tab/blocs/service_page_event.dart';
import 'package:white_label_business_app/pages/services_tab/blocs/service_page_state.dart';

class ServicePageBloc extends Bloc<ServicePageEvent, ServicePageState> {
  ServicePageBloc() : super(ServicePageState()) {
    on<LoadSalonServiceListEvent>(onLoadSalonServices);
    on<AddNewSalonServiceEvent>(onAddingNewService);
  }

  FutureOr<void> onAddingNewService(AddNewSalonServiceEvent event, Emitter<ServicePageState> emit) {
    StaticStorage.salonServices.add(event.transaction);
    emit(state.addNew(event.transaction));
  }

  FutureOr<void> onLoadSalonServices(LoadSalonServiceListEvent event, Emitter<ServicePageState> emit) async {
    var isListEmpty = state.salonServices?.isEmpty ?? true;

    if (!isListEmpty) {
      StaticStorage.salonServices.addAll(state.salonServices!);
    }

    emit(state.init(StaticStorage.salonServices));

    // todo: use state.loadNewBatchOf() when we do pagination
  }
}
