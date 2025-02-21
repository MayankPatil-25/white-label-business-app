import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:white_label_business_app/common/widgets/custom_widgets.dart';
import 'package:white_label_business_app/constants/texts_constants.dart';
import 'package:white_label_business_app/pages/common_views/base_scaffold.dart';
import 'package:white_label_business_app/pages/workers_tab/blocs/add_worker_bloc.dart';
import 'package:white_label_business_app/pages/workers_tab/blocs/add_worker_event.dart';
import 'package:white_label_business_app/pages/workers_tab/blocs/add_worker_state.dart';

class AddWorker extends StatefulWidget {
  const AddWorker({super.key});

  @override
  State<AddWorker> createState() => _AddWorkerState();
}

class _AddWorkerState extends State<AddWorker> {
  AddWorkerBloc? _addWorkerBloc;
  final TextEditingController _textEditingControllerName =
  TextEditingController();
  final TextEditingController _textEditingControllerNumber =
  TextEditingController();
  final TextEditingController _textEditingControllerAge =
  TextEditingController();
  final TextEditingController _textEditingControllerDate =
  TextEditingController();

  @override
  void initState() {
    super.initState();
    _addWorkerBloc = AddWorkerBloc();
  }

  @override
  void dispose() {
    super.dispose();
    _addWorkerBloc?.close();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
        title: MConstants.titleAddWorker,
        body: SingleChildScrollView(
            child: BlocConsumer<AddWorkerBloc, AddWorkerState>(
                bloc: _addWorkerBloc,
                listener: (context, state) {
                  onAddWorkerResult(context, state);
                },
                builder: (context, state) {
                  return Container(
                      margin: EdgeInsets.only(top: 25),
                      padding: EdgeInsets.all(20),
                      child: Column(
                          spacing: 19,
                          children: [
                            MCustomWidgets.getCustomInputFieldWithBloc(
                                caption: MConstants.workerName,
                                hintText: '',
                                controller: _textEditingControllerName,
                                errorText: null,
                                onTextChanged: (value) => {
                                  _addWorkerBloc
                                      ?.add(WorkerNameChangedEvent(value))
                                }),
                            MCustomWidgets.getCustomInputFieldWithBloc(
                                caption: MConstants.mobileNumber,
                                hintText: '',
                                controller: _textEditingControllerNumber,
                                errorText: null,
                                inputType: TextInputType.number,
                                onTextChanged: (value) => {
                                  _addWorkerBloc?.add(
                                      WorkerMobileNumberChangeEvent(
                                          int.parse(value)))
                                }),
                            // Age
                            MCustomWidgets.getCustomInputFieldWithBloc(
                                caption: MConstants.age,
                                hintText: '',
                                controller: _textEditingControllerAge,
                                errorText: null,
                                inputType: TextInputType.number,
                                onTextChanged: (value) => {
                                  _addWorkerBloc?.add(
                                      WorkerAgeChangedEvent(
                                          int.parse(value)))
                                }),
                            // Date of Joining
                            MCustomWidgets.getCustomInputFieldWithBloc(
                                caption: MConstants.dateOfJoining,
                                hintText: '',
                                controller: _textEditingControllerDate,
                                errorText: null,
                                inputType: TextInputType.datetime,
                                onTextChanged: (value) => {
                                  _addWorkerBloc?.add(
                                      DateOfJoiningChangedEvent(
                                          DateTime.parse(value)))
                                }),
                            Container(
                                margin: EdgeInsets.only(top: 25),
                                child: MCustomWidgets.getCustomButton(
                                    MConstants.titleAddWorker, () {
                                  _addWorkerBloc
                                      ?.add(AddWorkerFormSubmittedEvent());
                                })
                            )
                          ])
                  );
                })
        )
    );
  }

  void onAddWorkerResult(BuildContext context, AddWorkerState state) {
    if (state.errorMessage != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(state.errorMessage!)),
      );
      return;
    }

    if (!state.isSuccess) {
      return;
    }

    if (state.worker != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Added Successfully.')),
      );

      // Add Worker button clicked
      Navigator.pop(context, state.worker);
    }
  }
}