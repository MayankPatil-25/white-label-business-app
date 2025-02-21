import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:white_label_business_app/common/widgets/custom_widgets.dart';
import 'package:white_label_business_app/constants/texts_constants.dart';
import 'package:white_label_business_app/helpers/general_utils.dart';
import 'package:white_label_business_app/models/worker.dart';
import 'package:white_label_business_app/pages/common_views/base_scaffold.dart';
import 'package:white_label_business_app/pages/common_views/custom_list_item.dart';
import 'package:white_label_business_app/constants/color_constants.dart';
import 'package:white_label_business_app/pages/workers_tab/add_worker.dart';
import 'package:white_label_business_app/pages/workers_tab/blocs/worker_page_bloc.dart';
import 'package:white_label_business_app/pages/workers_tab/blocs/worker_page_event.dart';
import 'package:white_label_business_app/pages/workers_tab/blocs/worker_page_state.dart';

class WorkersPage extends StatefulWidget {

  @override
  State<WorkersPage> createState() => _WorkersPageState();
}

class _WorkersPageState extends State<WorkersPage> {
  late WorkerPageBloc _workerPageBloc;

  @override
  Widget build(BuildContext context) {
  _workerPageBloc = BlocProvider.of<WorkerPageBloc>(context);
  _workerPageBloc.add(LoadWorkerListEvent());

    return BaseScaffold(
        title: MConstants.titleWorkers,
        body: BlocConsumer<WorkerPageBloc, WorkerPageState>(
            bloc: _workerPageBloc,
            listener: (context, state) {
              // add lazy loading here I believe.
            },
            builder: (context, state) {
              return Column(children: [
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
                      Text(
                        state.workerCount.toString(),
                        style: MCustomWidgets.textStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87),
                      ),
                      Text(
                        MConstants.continueBtn,
                        style: MCustomWidgets.textStyle(fontSize: 12, fontWeight: FontWeight.normal, color: MColors.buttonTextColor),
                      )
                    ],
                  ),
                ),
                // List of Items (Wrapped in Expanded to prevent infinite height error)
                Expanded(
                  child: ListView.builder(
                    itemCount: state.workers?.length ?? 0,
                    itemBuilder: (context, index) {
                      return Padding(
                          padding: EdgeInsets.all(9),
                          child: CustomerCard(
                              customerName:
                              state.workers![index].name,
                              serviceName: state.workers![index].age.toString(),
                              workerName: state.workers![index].dateOfJoining.getFormattedDate(),
                              price: null));
                    },
                  ),
                ),
              ]);
            }),
        floatingActionButton: MCustomWidgets.getCustomFloatingButton(
            Icons.plus_one, () => onAddClicked(context))
    );
  }

  // void onAddClicked(BuildContext context) async {
  void onAddClicked(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddWorker(),
      ),
    );

    if (result != null && result is Worker) {
      // Dispatch an event to update the list
      _workerPageBloc.add(AddNewWorkerEvent(result));
    }
  }
}