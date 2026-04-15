import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/configs/themes/app_colors.dart';
import '../../../../data/workflow/models/models.dart';
import '../../../../gen/assets.gen.dart';
import 'work_flow_step_item.dart';

class WorkFlowStepList extends StatefulWidget {
  const WorkFlowStepList({super.key, required this.workflowSteps});
  final List<WorkflowStep> workflowSteps;

  @override
  State<WorkFlowStepList> createState() => _WorkFlowStepListState();
}

class _WorkFlowStepListState extends State<WorkFlowStepList>
    with SingleTickerProviderStateMixin {
  bool _isExpanded = true;
  late final AnimationController _animationController;
  late final Animation<double> _arrowAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 220),
      vsync: this,
    );
    _arrowAnimation = Tween<double>(
      begin: 0,
      end: 0.25,
    ).animate(_animationController);
    _animationController.value = 1;
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleExpansion() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
    if (_isExpanded) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    final contentAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );

    return Padding(
      padding: const EdgeInsets.only(bottom: 26),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: AppColors.workFlowBorderColorUpComing,
            width: 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 6,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'WORKFLOW STEPS',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: AppColors.workFlowTextStepList,
                    fontSize: 14,
                  ),
                ),
                InkWell(
                  onTap: _toggleExpansion,
                  child: RotationTransition(
                    turns: _arrowAnimation,
                    child: SvgPicture.asset(
                      Assets.icons.actions.icoActionRight,
                    ),
                  ),
                ),
              ],
            ),
            ClipRect(
              child: FadeTransition(
                opacity: contentAnimation,
                child: SizeTransition(
                  sizeFactor: contentAnimation,
                  axisAlignment: -1,
                  child: Column(
                    spacing: 6,
                    children: widget.workflowSteps
                        .map(
                          (workflowStep) => WorkFlowStepItem(
                            workflowStep: workflowStep,
                            isLast: workflowStep == widget.workflowSteps.last,
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
