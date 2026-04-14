import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/helpers/utils.dart';
import '../../../common/widgets/widgets.dart';
import '../../../core/constants/constants.dart';
import '../../bloc.dart';
import '../widgets/request_manager/header_request.dart';
import '../widgets/request_manager/request_manager_list.dart';

class PageRequestManager extends StatelessWidget {
  const PageRequestManager({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedMaterial = context
        .read<WorkflowRequestBloc>()
        .state
        .selectedMaterial;
    return BlocProvider(
      create: (context) =>
          RequestManagerBloc()..add(RequestManagerLoadRequested()),
      child: BlocConsumer<RequestManagerBloc, RequestManagerState>(
        listener: (context, state) {
          if (state.status == Status.loading) {
            IDialog.showDialogLoading(context: context);
          } else if (state.status == Status.loaded) {
            context.popSafety();
          } else if (state.status == Status.error) {
            context.popSafety();
            IDialog.showErrorException(context: context, error: state.error!);
          }
        },
        builder: (context, state) {
          return Column(
            children: [
              HeaderRequest(selectedMaterial: selectedMaterial!),
              Expanded(
                child: RequestManagerList(
                  workflowTimelineItems: state.workflowTimelineItems,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
