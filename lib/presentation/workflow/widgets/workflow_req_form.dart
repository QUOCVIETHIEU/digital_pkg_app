import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../common/helpers/utils.dart';
import '../../../../data/workflow/models/workflow_request.dart';
import '../../../../gen/assets.gen.dart';
import '../../../common/widgets/widgets.dart';

class WorkflowReqForm extends StatefulWidget {
  final bool isEdit;
  final VoidCallback? onCancel;
  final void Function(WorkflowRequest)? onSubmit;
  final WorkflowRequest? request;

  const WorkflowReqForm({
    super.key,
    this.isEdit = false,
    this.onCancel,
    this.onSubmit,
    this.request,
  });

  @override
  State<WorkflowReqForm> createState() => _WorkflowReqFormState();
}

class _WorkflowReqFormState extends State<WorkflowReqForm> {
  final _formKey = GlobalKey<FormState>();
  late WorkflowRequest _request;
  late TextEditingController _requestIdController,
      _requestNameController,
      _noteController;
  String? _typeMatrix;
  String? _lineName;

  final List<String> _matrixOptions = ['Carton', 'Can', 'End', 'Tray'];
  final List<String> _lineOptions = ['Line T', 'Line A', 'Line B', 'Line C'];

  @override
  void initState() {
    super.initState();
    _request = widget.request ?? WorkflowRequest.empty();
    _requestIdController = TextEditingController(text: _request.requestId);
    _requestNameController = TextEditingController(text: _request.itemName);
    _noteController = TextEditingController(text: '');
    _typeMatrix = _request.category.isNotEmpty
        ? _request.category
        : _matrixOptions.first;
    _lineName = _request.plantNameRunTrials.isNotEmpty
        ? _request.plantNameRunTrials
        : _lineOptions.first;
  }

  @override
  void dispose() {
    _requestIdController.dispose();
    _requestNameController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  bool get isPrimary => _request.type == WorkflowRequestType.primary;

  Color get themeColor =>
      isPrimary ? const Color(0xFF005A9E) : const Color(0xFF008291);

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      small: _buildFormContainer(context, widthFactor: 0.98),
      normal: _buildFormContainer(context, widthFactor: 0.8),
      large: _buildFormContainer(context, widthFactor: 0.5),
      extraLarge: _buildFormContainer(context, widthFactor: 0.4),
    );
  }

  Widget _buildFormContainer(
    BuildContext context, {
    required double widthFactor,
  }) {
    return Container(
      width: MediaQuery.sizeOf(context).width * widthFactor,
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 12.0,
        children: [
          _buildHeader(context),
          const Divider(height: 1),

          Flexible(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildTextField(
                      'Mã yêu cầu:',
                      _requestIdController,
                      required: true,
                      enabled: false,
                    ),
                    _buildTextField(
                      'Tên yêu cầu:',
                      _requestNameController,
                      required: true,
                      validator: ValidationUtils.stringValidator,
                    ),
                    _buildDropdownField(
                      isPrimary ? 'Type of matrix:' : 'Type of trial:',
                      _typeMatrix,
                      _matrixOptions,
                      (val) => setState(() => _typeMatrix = val),
                      prefixIcon: Assets.icons.workflow.icoMatrix,
                      required: true,
                    ),
                    _buildDropdownField(
                      'Line name:',
                      _lineName,
                      _lineOptions,
                      (val) => setState(() => _lineName = val),
                      required: true,
                      prefixIcon: Assets.icons.workflow.icoLine,
                    ),
                    _buildNoteField('Ghi chú:', _noteController),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          _buildFooter(context),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(Assets.icons.common.icoAddDoc, height: 28, width: 28),
        const SizedBox(width: 12),
        Text(
          isPrimary ? 'PRIMARY REQUEST' : 'SECONDARY REQUEST',
          style: TextStyle(
            color: themeColor,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        const Spacer(),
        CustomIconButton(
          iconSize: 32.0,
          icon: SvgPicture.asset(Assets.icons.common.icoActionClose),
          onPressed: widget.onCancel ?? () => Navigator.of(context).pop(),
        ),
      ],
    );
  }

  Widget _buildTextField(
    String label,
    TextEditingController controller, {
    bool required = false,
    bool enabled = true,
    String? Function(String?)? validator,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 4.0,
        children: [
          Row(
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
              if (required) ...[
                const Text(' *', style: TextStyle(color: Colors.red)),
              ],
            ],
          ),
          CustomTextFormField(
            enabled: enabled,
            controller: controller,
            validator: validator,
          ),
        ],
      ),
    );
  }

  Widget _buildDropdownField<T>(
    String label,
    T? value,
    List<T> options,
    void Function(T?) onChanged, {
    bool required = false,
    String? prefixIcon,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 4.0,
        children: [
          Row(
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
              if (required) ...[
                const Text(' *', style: TextStyle(color: Colors.red)),
              ],
            ],
          ),
          IDropdownSearch<T>(
            listItems: options,
            onItemSelected: onChanged,
            prefixIcon: prefixIcon,
            initialItem: value,
          ),
        ],
      ),
    );
  }

  Widget _buildNoteField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 4.0,
        children: [
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
          ),
          TextFormField(
            controller: controller,
            minLines: 4,
            maxLines: 5,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              isDense: true,
              hintText: 'Nhập ghi chú...',
              hintStyle: const TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 13,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      spacing: 12.0,
      children: [
        TextButton(
          onPressed: widget.onCancel ?? () => Navigator.of(context).pop(),
          child: const Text('Hủy', style: TextStyle(color: Colors.black54)),
        ),
        ElevatedButton(
          onPressed: () {
            if (_formKey.currentState?.validate() ?? false) {
              widget.onSubmit?.call(
                _request.copyWith(
                  itemName: _requestNameController.text,
                  category: _typeMatrix,
                  plantNameRunTrials: _lineName,
                  // note: _noteController.text, // WorkflowRequest doesn't have note field, but we can add it or ignore
                ),
              );
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: themeColor,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          child: const Text(
            'Thêm yêu cầu',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
