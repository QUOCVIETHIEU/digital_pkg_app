import 'package:digital_pkg_system/presentation/workflow/widgets/request_manager/timeline_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../common/helpers/utils.dart';
import '../../../../common/widgets/widgets.dart';
import '../../../../core/configs/themes/app_theme.dart';
import '../../../../core/constants/constants.dart';
import '../../../../data/workflow/models/models.dart';
import '../../../../gen/assets.gen.dart';

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
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'YÊU CẦU TESTING NGUYÊN VẬT LIỆU',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 4),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${AppStrings.dotChar} Người tạo: ${widget.itemTesting?.peopleCreate}',
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    Text(
                      '${AppStrings.dotChar} Thời gian tạo: ${widget.itemTesting?.datetimeCreate != null ? DateTimeUtils.formatDateTime(widget.itemTesting?.datetimeCreate ?? DateTime.now(), DateTimeFormat.dateTimeWithPipeFormat) : '---'}',
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        InkWell(
          onTap: widget.onClose ?? () => context.popSafety(),
          child: SvgPicture.asset(
            Assets.icons.common.icoActionClose,
            width: 28,
            height: 28,
          ),
        ),
      ],
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
