import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/models/models.dart';
import '../../../common/widgets/widgets.dart';
import '../../../core/configs/themes/app_colors.dart';
import '../../../core/constants/constants.dart';
import '../bloc/workflow_request/workflow_request_bloc.dart';
import '../widgets/workflow_request_list.dart';

class PageWorkflow extends StatelessWidget {
  const PageWorkflow({super.key});

  static DrawerModel get drawer => Drawers.drawers.firstWhere(
    (element) => element.route == AppRoute.workflow,
  );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WorkflowRequestBloc()..add(const WorkflowRequestLoadRequested('')),
      child: const _PageWorkflowContent(),
    );
  }
}

class _PageWorkflowContent extends StatelessWidget {
  const _PageWorkflowContent();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkflowRequestBloc, WorkflowRequestState>(
      builder: (context, state) {
        return Column(
          children: [
            IPageHeader(
              title: '01 - REQUEST MANAGER',
              image: const Icon(
                Icons.settings,
                size: 32.0,
                color: AppColors.blueColor5,
              ),
              searchLabel: 'Tìm kiếm yêu cầu:',
              searchHint: 'Nhập mã, tên, item code...',
              onSearchChanged: (value) {
                context.read<WorkflowRequestBloc>().add(
                  WorkflowRequestSearchRequested(value),
                );
              },
              actions: [
                IRectangleButton(
                  title: 'Primary',
                  leading: const Icon(
                    Icons.add,
                    size: 16.0,
                    color: AppColors.blueColor5,
                  ),
                  onPressed: () {},
                  width: 200.0,
                ),
                IRectangleButton(
                  title: 'Secondary',
                  leading: const Icon(
                    Icons.add,
                    size: 16.0,
                    color: AppColors.blueColor5,
                  ),
                  onPressed: () {},
                  width: 200.0,
                ),
              ],
            ),
            Expanded(
              child: WorkflowRequestList(
                materials: state.allMaterials,
                listViewConfig: state.listViewConfig,
                emptyMessage: 'No requests found',
                onConfigUpdated: (newConfig, isFixed) {
                  context.read<WorkflowRequestBloc>().add(
                    WorkflowRequestListViewConfigUpdated(
                      ListViewConfigName.request,
                      newConfig,
                      isFixed,
                    ),
                  );
                },
                onSort: (index) {
                  final isAscending = state.sortColumnIndex == index 
                      ? !state.sortAscending 
                      : true;
                  context.read<WorkflowRequestBloc>().add(
                    WorkflowRequestSortRequested(index, isAscending),
                  );
                },
                sortColumnIndex: state.sortColumnIndex,
                sortAscending: state.sortAscending,
                showSort: true,
              ),
            ),
          ],
        );
      },
    );
  }
}

