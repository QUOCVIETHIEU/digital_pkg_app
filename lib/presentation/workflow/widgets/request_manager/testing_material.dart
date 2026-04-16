import 'package:digital_pkg_system/presentation/workflow/widgets/request_manager/timeline_line.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/widgets.dart';
import '../../../../core/configs/themes/app_theme.dart';
import '../../../../data/workflow/models/models.dart';
import '../../../../gen/assets.gen.dart';
import 'header_work_flow_step.dart';

class TestingMaterial extends StatefulWidget {
  const TestingMaterial({super.key, required this.itemTesting, this.onClose});
  final ItemTesting? itemTesting;
  final VoidCallback? onClose;

  @override
  State<TestingMaterial> createState() => _TestingMaterialState();
}

class _TestingMaterialState extends State<TestingMaterial> {
  late TextEditingController productController,
      netContentController,
      weightController,
      supplierController,
      cavController,
      typeColorController,
      resinCodeSupplierController,
      gasVolumeController,
      closureTypeController,
      closureWeightController,
      closureColorController,
      closureSupplierController,
      closureLineController,
      additiveController,
      noteController;
  @override
  void initState() {
    super.initState();
    productController = TextEditingController(
      text: widget.itemTesting?.product,
    );
    netContentController = TextEditingController(
      text: widget.itemTesting?.netContent.toString(),
    );
    supplierController = TextEditingController(
      text: widget.itemTesting?.supplier,
    );
    cavController = TextEditingController(
      text: widget.itemTesting?.cav.toString(),
    );
    typeColorController = TextEditingController(
      text: widget.itemTesting?.typeColor,
    );
    resinCodeSupplierController = TextEditingController(
      text: widget.itemTesting?.resinCodeSupplier,
    );
    gasVolumeController = TextEditingController(
      text: widget.itemTesting?.gasVolume,
    );
    closureTypeController = TextEditingController(
      text: widget.itemTesting?.closureType,
    );
    closureWeightController = TextEditingController(
      text: widget.itemTesting?.closureWeight.toString(),
    );
    closureColorController = TextEditingController(
      text: widget.itemTesting?.closureColor,
    );
    weightController = TextEditingController(
      text: widget.itemTesting?.weight.toString(),
    );
    supplierController = TextEditingController(
      text: widget.itemTesting?.supplier,
    );
    cavController = TextEditingController(
      text: widget.itemTesting?.cav.toString(),
    );
    typeColorController = TextEditingController(
      text: widget.itemTesting?.typeColor,
    );
    resinCodeSupplierController = TextEditingController(
      text: widget.itemTesting?.resinCodeSupplier,
    );
    gasVolumeController = TextEditingController(
      text: widget.itemTesting?.gasVolume,
    );
    closureTypeController = TextEditingController(
      text: widget.itemTesting?.closureType,
    );
    closureWeightController = TextEditingController(
      text: widget.itemTesting?.closureWeight.toString(),
    );
    closureColorController = TextEditingController(
      text: widget.itemTesting?.closureColor,
    );
    closureSupplierController = TextEditingController(
      text: widget.itemTesting?.closureSupplier,
    );
    closureLineController = TextEditingController(
      text: widget.itemTesting?.closureLine,
    );
    additiveController = TextEditingController(
      text: widget.itemTesting?.additive,
    );
    noteController = TextEditingController(text: widget.itemTesting?.note);
  }

  @override
  void dispose() {
    productController.dispose();
    netContentController.dispose();
    supplierController.dispose();
    cavController.dispose();
    typeColorController.dispose();
    resinCodeSupplierController.dispose();
    gasVolumeController.dispose();
    closureTypeController.dispose();
    closureWeightController.dispose();
    closureColorController.dispose();
    closureSupplierController.dispose();
    closureLineController.dispose();
    additiveController.dispose();
    noteController.dispose();
    weightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.4,
        height: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 30),
        color: Colors.white,
        child: Column(
          spacing: 20,
          children: [
            _buildHeader(context),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(vertical: 14),
                child: _buildRequestInfo(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return HeaderWorkFlowStep(
      value: 'YÊU CẦU TESTING NGUYÊN VẬT LIỆU',
      peopleCreate: 'Người tạo: ${widget.itemTesting?.peopleCreate ?? ''}',
      datetimeCreate: widget.itemTesting?.datetimeCreate,
      onClose: widget.onClose,
    );
  }

  Widget _buildRequestInfo() {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: 16,
        children: [
          Expanded(
            child: Column(
              spacing: 16,
              children: [
                _buildField('Product', productController),
                _buildField('Net content', netContentController),
                _buildDropdownField(
                  'Type of trial',
                  widget.itemTesting?.trial.first,
                  widget.itemTesting?.trial ?? [],
                  prefixIcon: Assets.icons.workflow.icoMatrix,
                  (value) {},
                ),
                _buildField('Weight', weightController),
                _buildField('Supplier', supplierController),
                _buildField('Mold', cavController),
                _buildField('Type and color of preform', typeColorController),
                _buildField('Resin code+supplier', resinCodeSupplierController),
              ],
            ),
          ),
          const TimelineLine(),
          Expanded(
            child: Column(
              spacing: 16,
              children: [
                _buildField('Gas volume', gasVolumeController),
                _buildField('Closure type', closureTypeController),
                _buildField('Closure weight', closureWeightController),
                _buildField('Closure color', closureColorController),
                _buildField('Closure supplier', closureSupplierController),
                _buildField('Closure line', closureLineController),
                _buildField('Additive', additiveController),
                _buildField('Ghi chú', noteController, maxLines: 3),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildField(
    String label,
    TextEditingController controller, {
    bool required = true,
    bool enabled = false,
    int maxLines = 1,
    Color? textColor,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      spacing: 4.0,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(label, style: AppTheme.styleLabelInput),
            if (required) ...[
              Text(' *', style: const TextStyle(color: Colors.red)),
            ],
          ],
        ),
        CustomTextFormField(
          style: TextStyle(color: textColor),
          enabled: enabled,
          controller: controller,
          maxLines: maxLines,
          decoration: const InputDecoration(isDense: true),
        ),
      ],
    );
  }

  Widget _buildDropdownField<T>(
    String label,
    T? value,
    List<T> options,
    void Function(T?) onChanged, {
    bool required = true,
    String? prefixIcon,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 4.0,
      children: [
        Row(
          children: [
            Text(label, style: AppTheme.styleLabelInput),
            if (required) ...[
              const Text(' *', style: TextStyle(color: Colors.red)),
            ],
          ],
        ),
        IDropdownSearch<T>(
          listItems: options,
          onItemSelected: onChanged,
          prefixIcon: prefixIcon,
          closedHeaderPadding: 6,
          initialItem: value,
        ),
      ],
    );
  }
}
