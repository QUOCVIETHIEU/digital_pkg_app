import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../data/workflow/models/workflow_request.dart';
import '../../../common/models/models.dart';
import '../../../common/widgets/widgets.dart';
import '../../../core/configs/themes/app_colors.dart';
import '../../../core/constants/constants.dart';
import '../../../gen/assets.gen.dart';
import '../bloc/workflow_request/workflow_request_bloc.dart';
import '../widgets/workflow_req_form.dart';
import '../widgets/workflow_request_list.dart';

class PageWorkflow extends StatelessWidget {
  const PageWorkflow({super.key});

  static DrawerModel get drawer => Drawers.drawers.firstWhere(
    (element) => element.route == AppRoute.workflow,
  );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          WorkflowRequestBloc()..add(const WorkflowRequestLoadRequested('')),
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
              image: SvgPicture.asset(Assets.icons.workflow.icoRequestManager),
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
                  onPressed: () =>
                      _showAddRequestForm(context, WorkflowRequestType.primary),
                  width: 200.0,
                ),
                IRectangleButton(
                  title: 'Secondary',
                  leading: const Icon(
                    Icons.add,
                    size: 16.0,
                    color: AppColors.blueColor6,
                  ),
                  onPressed: () => _showAddRequestForm(
                    context,
                    WorkflowRequestType.secondary,
                  ),
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
                onSort: (columnIndex, ascending) {
                  if (state.sortColumnIndex != columnIndex) {
                    context.read<WorkflowRequestBloc>().add(
                      WorkflowRequestSortRequested(columnIndex, true),
                    );
                  } else if (state.sortAscending) {
                    context.read<WorkflowRequestBloc>().add(
                      WorkflowRequestSortRequested(columnIndex, false),
                    );
                  } else {
                    context.read<WorkflowRequestBloc>().add(
                      WorkflowRequestSortRequested(0, true),
                    );
                  }
                },
                sortColumnIndex: state.sortColumnIndex,
                sortAscending: state.sortAscending,
                showSort: true,
                onSelect: (material) {
                  context.read<WorkflowRequestBloc>().add(
                    WorkflowRequestSelectedChanged(material),
                  );
                },
                colorHeader: AppColors.workflowHeaderColor,
                selectedMaterial: state.selectedMaterial,
              ),
            ),
          ],
        );
      },
    );
  }

  void _showAddRequestForm(BuildContext context, WorkflowRequestType type) {
    IDialog.showCommonAnimationDialog(
      context: context,
      content: WorkflowReqForm(
        request: WorkflowRequest.empty().copyWith(
          type: type,
          requestId: 'RQT20261203-015', // Mock ID as in image
          itemCodeTesting: '7Up Free Fiber', // Mock as in image
        ),
        onSubmit: (newRequest) {
          context.pop();
          context.read<WorkflowRequestBloc>().add(
            AddWorkflowRequest(newRequest),
          );
        },
      ),
    );
  }
}
