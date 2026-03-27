import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/configs/themes/app_colors.dart';
import '../../models/drawer_model.dart';

class IDrawerMenuItem extends StatelessWidget {
  const IDrawerMenuItem({
    super.key,
    required this.iconPath,
    required this.selected,
    required this.expandedDrawer,
    this.children = const [],
    this.padding = const EdgeInsets.all(2.0),
    this.constraintsMin = 24.0,
    this.size = 24.0,
    this.color = AppColors.iconDefault,
    this.tooltip = '',
    required this.onPressed,
  });

  final String iconPath;
  final bool selected;
  final bool expandedDrawer;
  final List<DrawerModel> children;
  final double size;
  final Color color;
  final String tooltip;
  final EdgeInsetsGeometry padding;
  final double constraintsMin;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      child: Padding(
        padding: padding,
        child: InkWell(
          onTap: onPressed,
          highlightColor: selected ? AppColors.iconDefault : Colors.transparent,
          splashColor: selected ? AppColors.iconDefault : Colors.transparent,
          child: Row(
            mainAxisAlignment: expandedDrawer
                ? MainAxisAlignment.start
                : MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: Colors.transparent,
                child: TweenAnimationBuilder<double>(
                  tween: Tween<double>(
                    begin: 28.0,
                    end: selected ? 30.0 : 28.0,
                  ),
                  duration: const Duration(milliseconds: 150),
                  curve: Curves.easeInOut,
                  builder: (context, size, child) {
                    return SvgPicture.asset(
                      'assets/icons/drawers/${iconPath}_${selected ? 'active' : 'normal'}.svg',
                      width: size,
                      height: size,
                    );
                  },
                ),
              ),
              Visibility(
                visible: expandedDrawer,
                child: Text(
                  tooltip,
                  style: TextStyle(
                    color: AppColors.textColor,
                    fontSize: selected ? 12.5 : 12.0,
                    fontWeight: selected ? FontWeight.w600 : FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
