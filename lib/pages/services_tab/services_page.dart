import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:white_label_business_app/common/widgets/custom_widgets.dart';
import 'package:white_label_business_app/constants/texts_constants.dart';
import 'package:white_label_business_app/models/salon_service.dart';
import 'package:white_label_business_app/pages/common_views/base_scaffold.dart';
import 'package:white_label_business_app/pages/common_views/custom_list_item.dart';
import 'package:white_label_business_app/constants/color_constants.dart';
import 'package:white_label_business_app/pages/services_tab/add_service.dart';
import 'package:white_label_business_app/pages/services_tab/blocs/service_page_bloc.dart';
import 'package:white_label_business_app/pages/services_tab/blocs/service_page_event.dart';
import 'package:white_label_business_app/pages/services_tab/blocs/service_page_state.dart';

class SalonServicesPage extends StatefulWidget {
  const SalonServicesPage({super.key});

  @override
  State<SalonServicesPage> createState() => _SalonServicesPageState();
}

class _SalonServicesPageState extends State<SalonServicesPage> {
  late ServicePageBloc _servicePageBloc;

  @override
  Widget build(BuildContext context) {
    _servicePageBloc = BlocProvider.of<ServicePageBloc>(context);
    _servicePageBloc.add(LoadSalonServiceListEvent());

    return BaseScaffold(
            title: MConstants.titleServices,
            body: BlocConsumer<ServicePageBloc, ServicePageState>(
              bloc: _servicePageBloc,
                listener: (context, state) {
                  // add lazy loading here I believe.

            }, builder: (context, state) {
              return Column(
                children: [
                  Container(
                      margin: EdgeInsets.only(top: 2),
                      color: MColors.primaryTextColor,
                      height: 0,
                      width: double.infinity),
                  // Account Summary Container
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      color: MColors.secondaryTextColor,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 10,
                          spreadRadius: 2,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(state.totalAmountFormatted,
                          style: MCustomWidgets.textStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87),
                        ),
                        Text(
                          MConstants.incomeToday,
                          style: MCustomWidgets.textStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              color: MColors.buttonTextColor),
                        )
                      ],
                    ),
                  ),
                  // List of Items (Wrapped in Expanded to prevent infinite height error)
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.salonServices?.length ?? 0,
                      itemBuilder: (context, index) {
                        return Padding(
                            padding: EdgeInsets.all(9),
                            child: CustomerCard(
                              customerName: state.salonServices![index].customerName,
                              serviceName: state.salonServices![index].serviceNamesFormatted,
                              workerName: state.salonServices![index].workerName,
                              price: state.salonServices![index].priceFormatted,
                            ));
                      },
                    ),
                  ),
                ],
              );
            }),
            floatingActionButton: MCustomWidgets.getCustomFloatingButton(
                Icons.content_cut_rounded, () => onAddClicked(context))
        );
  }

  // void onAddClicked(BuildContext context) async {
  void onAddClicked(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddService(),
      ),
    );

    if (result != null && result is SalonService) {
      // Dispatch an event to update the list
       _servicePageBloc.add(AddNewSalonServiceEvent(result));
    }
  }
}
