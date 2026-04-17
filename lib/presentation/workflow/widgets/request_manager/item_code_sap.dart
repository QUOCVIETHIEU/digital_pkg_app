import 'package:flutter/material.dart';

import '../../../../common/widgets/widgets.dart';
import '../../../../core/configs/themes/app_colors.dart';
import '../../../../data/workflow/models/models.dart';
import 'header_work_flow_step.dart';

class ItemCodeSap extends StatefulWidget {
  const ItemCodeSap({super.key, this.matrixEdi});
  final MatrixEdi? matrixEdi;

  @override
  State<ItemCodeSap> createState() => _ItemCodeSapState();
}

class _ItemCodeSapState extends State<ItemCodeSap> {
  late TextEditingController _itemCodeController,
      _itemNameController,
      _supplierController,
      _resinController,
      _moldController,
      _sizeController,
      _typeController,
      _weightController;
  @override
  void initState() {
    super.initState();
    _itemCodeController = TextEditingController(
      text: widget.matrixEdi?.itemCode,
    );
    _itemNameController = TextEditingController(
      text: widget.matrixEdi?.itemName,
    );
    _supplierController = TextEditingController(
      text: widget.matrixEdi?.supplier,
    );
    _resinController = TextEditingController(text: widget.matrixEdi?.resin);
    _moldController = TextEditingController(text: widget.matrixEdi?.mold);
    _sizeController = TextEditingController(
      text: widget.matrixEdi?.size.toString(),
    );
    _typeController = TextEditingController(text: widget.matrixEdi?.type);
    _weightController = TextEditingController(
      text: widget.matrixEdi?.weight.toString(),
    );
  }

  @override
  void dispose() {
    _itemCodeController.dispose();
    _itemNameController.dispose();
    _supplierController.dispose();
    _resinController.dispose();
    _moldController.dispose();
    _sizeController.dispose();
    _typeController.dispose();
    _weightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.4,
      height: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          bottomLeft: Radius.circular(12),
        ),
      ),
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
    );
  }

  Widget _buildRequestInfo() {
    return Column(
      spacing: 16,
      children: [
        buildInfoField('Item Code', _itemCodeController),
        buildInfoField('Item Name', _itemNameController),
        buildInfoField('Supplier', _supplierController),
        buildInfoField('Resin', _resinController),
        buildInfoField('Mold', _moldController),
        buildInfoField('Size', _sizeController),
        buildInfoField('Type', _typeController),
        buildInfoField('Weight', _weightController),
      ],
    );
  }

  Widget _buildHeader(BuildContext context) {
    return HeaderWorkFlowStep(
      value: 'THÔNG TIN THÊM ITEMCODE MỚI TRÊN SAP',
      peopleCreate: 'Người tải: Nguyễn Văn A',
      datetimeCreate: DateTime.now(),
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
            fontSize: 12,
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
