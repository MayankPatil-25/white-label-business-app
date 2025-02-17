import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:white_label_business_app/models/salon_service.dart';
import 'package:white_label_business_app/pages/services_tab/service_bloc/service_page_event.dart';
import 'package:white_label_business_app/pages/services_tab/service_bloc/service_page_state.dart';

class ServicePageBloc extends Bloc<ServicePageEvent, ServicePageState> {
  ServicePageBloc() : super(ServicePageState()) {
    on<ServiceTrasactionReceived>(onServiceTransactionReceived);
  }

  FutureOr<void> onServiceTransactionReceived(
      ServiceTrasactionReceived event, Emitter<ServicePageState> emit) async {
    var transactions = await loadServiceTransactions();
    emit(state.addNewChunk(transactions: transactions));
  }
}
