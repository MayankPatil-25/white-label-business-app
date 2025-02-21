import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:white_label_business_app/constants/texts_constants.dart';
import 'package:white_label_business_app/data/static_storage.dart';
import 'package:white_label_business_app/pages/customers_tab/blocs/add_customer_event.dart';
import 'package:white_label_business_app/pages/customers_tab/blocs/add_customer_state.dart';
import 'package:white_label_business_app/pages/services_tab/blocs/add_service_event.dart';
import 'package:white_label_business_app/pages/services_tab/blocs/add_service_state.dart';

class AddCustomerBloc extends Bloc<AddCustomerEvent, AddCustomerState> {
  AddCustomerBloc() : super(AddCustomerState()) {
    on<CustomerNameChangedEvent>(onCustomerNameChanged);
    on<CustomerMobileNumberChangeEvent>(onCustomerMobileNumber);
    on<CustomerAgeChangedEvent>(onCustomerAgeChanged);
    on<DateOfJoiningChangedEvent>(onDateOfJoiningChanged);
    on<AddCustomerFormSubmittedEvent>(onAddCustomerFormSubmitted);
  }

  FutureOr<void> onCustomerNameChanged(
      CustomerNameChangedEvent event, Emitter<AddCustomerState> emit) {
    emit(state.copyWith(customerName: event.customerName));
  }

  FutureOr<void> onCustomerMobileNumber(
      CustomerMobileNumberChangeEvent event, Emitter<AddCustomerState> emit) {
    emit(state.copyWith(mobileNumber: event.mobileNumber));
  }

  FutureOr<void> onDateOfJoiningChanged(
      DateOfJoiningChangedEvent event, Emitter<AddCustomerState> emit) {
    emit(state.copyWith(dateOfJoining: event.dateTime));
  }

  FutureOr<void> onCustomerAgeChanged(
      CustomerAgeChangedEvent event, Emitter<AddCustomerState> emit) {
    emit(state.copyWith(age: event.age));
  }

  FutureOr<void> onAddCustomerFormSubmitted(
      AddCustomerFormSubmittedEvent event, Emitter<AddCustomerState> emit) {
    if (state.customerName.isNotEmpty && state.mobileNumber > 0) {
      var successState = state.copyWith(isSuccess: true);
      successState.initCustomer(100 + StaticStorage.customersData.length + 1);
      emit(successState);
    } else {
      emit(state.copyWith(
          errorMessage: MConstants.validationEnterAllDetailsTryAgain));
    }
  }
}
