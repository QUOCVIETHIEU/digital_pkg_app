import 'package:flutter/material.dart';

import '../../../common/helpers/utils.dart';
import '../../../core/configs/themes/app_colors.dart';
import '../../../core/constants/constants.dart';
import '../../../gen/fonts.gen.dart';

class DlgSelectPlant extends StatefulWidget {
  const DlgSelectPlant({
    super.key,
    required this.currentPlant,
    required this.plants,
    required this.goPlant,
  });

  final int currentPlant;
  final List<int> plants;
  final void Function(int? plant) goPlant;

  @override
  State<DlgSelectPlant> createState() => _DlgSelectPlantState();
}

class _DlgSelectPlantState extends State<DlgSelectPlant> {
  late int selectPlant;

  Widget _buildPlantChip(int plant) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: FilterChip(
        avatar: selectPlant != plant
            ? const Icon(
                Icons.home_work_rounded,
                size: 16,
                color: AppColors.textColor,
              )
            : const SizedBox(),
        label: Text(
          Plant.getPlantCode(plant) ?? 'None',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14,
            color: selectPlant == plant ? Colors.white : AppColors.textColor,
          ),
        ),
        //const Text('PRODUCTION', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12, color: Color(0xFF0A4D7A))),
        selected: selectPlant == plant,
        selectedColor: const Color(0xFF2586CA),
        surfaceTintColor: const Color(0x80C3FFFD),
        elevation: 2,
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 0.55, color: AppColors.borderColor),
          borderRadius: BorderRadius.circular(100),
        ),
        onSelected: (s) => setState(() {
          selectPlant = plant;
        }),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    selectPlant = widget.currentPlant;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.sizeOf(context).width / 2,
        maxHeight: MediaQuery.sizeOf(context).height / 1.5,
      ),
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // 01. Title
            const Row(
              children: [
                Icon(Icons.home, size: 24.0, color: AppColors.textColor),
                SizedBox(width: 10),
                Text(
                  'CHỌN NHÀ MÁY',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontFamily: FontFamily.montserrat,
                    fontSize: 18,
                    color: AppColors.textColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),

            // 02. Content
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: widget.plants
                      .map((plant) => _buildPlantChip(plant))
                      .toList(),
                ),
              ),
            ),
            Text(
              Plant.getPlantName(selectPlant) ?? 'None',
              textAlign: TextAlign.start,
              style: const TextStyle(
                fontFamily: FontFamily.montserrat,
                fontSize: 15,
                color: AppColors.textColor,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              Plant.getAddress(selectPlant) ?? 'None',
              textAlign: TextAlign.center,
              overflow: TextOverflow.clip,
              style: const TextStyle(
                fontFamily: FontFamily.montserrat,
                fontSize: 12,
                color: AppColors.textColor,
                fontWeight: FontWeight.w400,
              ),
            ),

            // 03. Button
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 20.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () => context.popSafety(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepOrange,
                    ),
                    child: const Text(
                      'CANCEL',
                      style: TextStyle(
                        fontFamily: FontFamily.montserrat,
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  ElevatedButton(
                    onPressed: () {
                      context.popSafety();
                      widget.goPlant(selectPlant);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.mosquittoColor,
                    ),
                    child: const Text(
                      'GO PLANT',
                      style: TextStyle(
                        fontFamily: FontFamily.montserrat,
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
