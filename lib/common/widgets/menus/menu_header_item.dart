import 'package:flutter/material.dart';

import '../../../core/configs/themes/app_colors.dart';

class MenuHeaderItem extends StatelessWidget {
  const MenuHeaderItem({super.key, required this.title, required this.isSelected, required this.onMenuSelected});

  final String title;
  final bool isSelected;
  final Function(String menuSelected) onMenuSelected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onMenuSelected(title),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                color: isSelected ? const Color(0xFF00529C) : AppColors.producedColor,
                fontSize: 14,
                fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
              ),
            ),
            if (isSelected)
              Container(margin: const EdgeInsets.only(top: 4), height: 2, width: 60, color: const Color(0xFF51C6DB)),
          ],
        ),
      ),
    );
  }
}
