import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../common/widgets/widgets.dart';
import '../../../../core/configs/themes/app_colors.dart';
import '../../../../data/workflow/models/models.dart';
import '../../../../gen/assets.gen.dart';
import 'matrix_material_item.dart';

class MatrixInfo extends StatefulWidget {
  const MatrixInfo({super.key, required this.matrixEdi});
  final MatrixEdi matrixEdi;

  @override
  State<MatrixInfo> createState() => _MatrixInfoState();
}

class _MatrixInfoState extends State<MatrixInfo> {
  late TextEditingController _lineController,
      _sizeController,
      _typeController,
      _weightController,
      _supplierController,
      _resinController,
      _itemCodeController,
      _moldController;
  @override
  void initState() {
    super.initState();
    _lineController = TextEditingController(text: widget.matrixEdi.line);
    _sizeController = TextEditingController(
      text: widget.matrixEdi.size.toString(),
    );
    _typeController = TextEditingController(text: widget.matrixEdi.type);
    _weightController = TextEditingController(
      text: widget.matrixEdi.weight.toString(),
    );
    _supplierController = TextEditingController(
      text: widget.matrixEdi.supplier,
    );
    _resinController = TextEditingController(text: widget.matrixEdi.resin);
    _itemCodeController = TextEditingController(
      text: widget.matrixEdi.itemCode,
    );
    _moldController = TextEditingController(text: widget.matrixEdi.mold);
  }

  @override
  void dispose() {
    _lineController.dispose();
    _sizeController.dispose();
    _typeController.dispose();
    _weightController.dispose();
    _supplierController.dispose();
    _resinController.dispose();
    _itemCodeController.dispose();
    _moldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 30),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
        border: Border.all(
          color: AppColors.workFlowBorderColorFile,
          width: 0.7,
        ),
      ),
      child: Column(
        spacing: 60,
        children: [
          buildMaterialItem(widget.matrixEdi),
          Expanded(
            flex: 1,
            child: buildMaterialPanel(
              sectionTitle: 'CLOSURE',
              items: widget.matrixEdi.items,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildMaterialItem(MatrixEdi matrixEdi) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 18,
      children: [
        buildItemPreview(matrixEdi),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 18,
            children: [
              Expanded(
                child: Column(
                  spacing: 12,
                  children: [
                    buildInfoField('Line', _lineController),
                    buildInfoField('Size', _sizeController),
                    buildInfoField('Type', _typeController),
                    buildInfoField('Weight', _weightController),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  spacing: 12,
                  children: [
                    buildInfoField('Supplier', _supplierController),
                    buildInfoField('Resin', _resinController),
                    buildInfoField('Item Code', _itemCodeController),
                    buildInfoField('Mold', _moldController),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildMaterialPanel({
    required String sectionTitle,
    required List<MatrixEdiItem> items,
  }) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.workFlowBorderColorFile),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 30,
        children: [
          Text(
            sectionTitle,
            style: const TextStyle(
              fontSize: 38,
              fontWeight: FontWeight.w700,
              color: AppColors.workFlowTextStepName,
            ),
          ),
          Wrap(
            spacing: 18,
            runSpacing: 12,
            children: items
                .map((item) => MatrixMaterialItem(matrixEdiItem: item))
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget buildItemPreview(MatrixEdi matrixEdi) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      decoration: BoxDecoration(
        color: AppColors.workFlowMatrixItemIcon,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: AppColors.workFlowMatrixItemIconShadow,
            offset: Offset(8, 6),
            blurRadius: 8,
            spreadRadius: 0,
          ),
          BoxShadow(
            color: AppColors.workFlowMatrixItemIconShadow2,
            offset: Offset(-5, 4),
            blurRadius: 25,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        spacing: 30,
        children: [
          Assets.icons.common.icoCommonPet.image(height: 200),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 10,
            children: [
              buildPetIcon(
                Assets.icons.drawers.icoDrawerSize,
                '${matrixEdi.size.toString()} ${matrixEdi.unit}',
              ),
              buildPetIcon(
                Assets.icons.drawers.icoDrawerWeight,
                '${matrixEdi.weight.toString()} ${matrixEdi.unitWeight}',
              ),
              buildPetIcon(
                Assets.icons.drawers.icoDrawerMixingSap,
                matrixEdi.mold,
              ),
              Text(
                matrixEdi.itemName,
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                  color: AppColors.workFlowTextStepName,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildPetIcon(String iconPath, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 10,
      children: [
        SizedBox(width: 20, height: 20, child: SvgPicture.asset(iconPath)),
        Text(
          value,
          style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }

  Widget buildInfoField(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 2,
      children: [
        Text(
          '$label:',
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: AppColors.workFlowTextDescription,
          ),
        ),
        CustomTextFormField(
          style: const TextStyle(
            color: AppColors.workFlowTextDescription,
            fontWeight: FontWeight.w600,
          ),
          enabled: false,
          controller: controller,
          maxLines: 1,

          disabledTextColor: AppColors.workFlowTextDescription,
          decoration: const InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.symmetric(horizontal: 6, vertical: 10),
          ),
        ),
      ],
    );
  }
}
