import 'package:flutter/material.dart';

import '../../../core/configs/themes/app_colors.dart';
import '../../../gen/fonts.gen.dart';

/// Model class for context menu actions
class ContextMenuAction {
  final String label;
  final VoidCallback onPressed;
  final Widget? icon;
  const ContextMenuAction({
    required this.label,
    required this.onPressed,
    this.icon,
  });
}

/// Common context menu utility that can be reused across the application
class CommonContextMenu {
  static void show({
    required BuildContext context,
    required TapDownDetails details,
    List<ContextMenuAction> actions = const [],
    BorderRadiusGeometry buttonBorderRadius = const BorderRadius.all(
      Radius.circular(6.0),
    ),
    EdgeInsets? buttonPadding,
    Color? buttonTextColor,
    Color? buttonBackgroundColor,
    Color? buttonHoverBackgroundColor,
    Color? buttonHoverTextColor,
  }) {
    final ContextMenuController controller = ContextMenuController();
    OverlayEntry? overlayEntry;
    bool isContextMenuVisible = true;

    // Create overlay entry to catch taps outside
    overlayEntry = OverlayEntry(
      builder: (context) => Positioned.fill(
        child: GestureDetector(
          onTap: () {
            if (isContextMenuVisible) {
              isContextMenuVisible = false;
              overlayEntry?.remove();
              controller.remove();
            }
          },
          child: Container(color: Colors.transparent),
        ),
      ),
    );

    // Insert overlay
    Overlay.of(context, rootOverlay: true).insert(overlayEntry);

    controller.show(
      context: context,
      contextMenuBuilder: (BuildContext context) {
        final List<Widget> children = <Widget>[];

        void addButton(String label, VoidCallback onPressed, [Widget? icon]) {
          final ColorScheme colorScheme = Theme.of(context).colorScheme;
          final EdgeInsets effectivePadding =
              buttonPadding ??
              const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0);
          final Color baseBg = buttonBackgroundColor ?? Colors.transparent;
          final Color baseFg = buttonTextColor ?? colorScheme.onSurface;
          final Color hoverBg =
              buttonHoverBackgroundColor ?? colorScheme.primary;
          final Color hoverFg = buttonHoverTextColor ?? colorScheme.onPrimary;

          children.add(
            TextButton(
              style: ButtonStyle(
                padding: WidgetStatePropertyAll<EdgeInsets>(effectivePadding),
                minimumSize: const WidgetStatePropertyAll<Size>(Size(0, 0)),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                alignment: Alignment.centerLeft,
                shape: WidgetStatePropertyAll<OutlinedBorder>(
                  RoundedRectangleBorder(borderRadius: buttonBorderRadius),
                ),
                backgroundColor: WidgetStateProperty.resolveWith<Color?>((
                  Set<WidgetState> states,
                ) {
                  if (states.contains(WidgetState.pressed)) {
                    return hoverBg.withValues(alpha: 0.95);
                  }
                  if (states.contains(WidgetState.hovered)) {
                    return hoverBg;
                  }
                  return baseBg;
                }),
                foregroundColor: WidgetStateProperty.resolveWith<Color?>((
                  Set<WidgetState> states,
                ) {
                  if (states.contains(WidgetState.hovered) ||
                      states.contains(WidgetState.pressed)) {
                    return hoverFg;
                  }
                  return baseFg;
                }),
                overlayColor: const WidgetStatePropertyAll<Color>(
                  Colors.transparent,
                ),
              ),
              onPressed: () {
                isContextMenuVisible = false;
                overlayEntry?.remove();
                ContextMenuController.removeAny();
                onPressed();
              },
              child: Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  spacing: 3.0,
                  children: [
                    if (icon != null)
                      Row(
                        spacing: 3.0,
                        children: [
                          SizedBox(width: 14.0, height: 14.0, child: icon),
                          const SizedBox(
                            height: 12.0,
                            child: VerticalDivider(
                              width: 8.0,
                              thickness: .4,
                              endIndent: 0,
                              indent: 0,
                            ),
                          ),
                        ],
                      ),
                    Text(
                      label,
                      style: const TextStyle(
                        fontFamily: FontFamily.montserrat,
                        fontSize: 12.0,
                        color: AppColors.textColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }

        // Add custom actions from the list
        for (int i = 0; i < actions.length; i++) {
          final action = actions[i];
          addButton(action.label, action.onPressed, action.icon);

          // Add divider between actions (except after the last one)
          if (i < actions.length - 1) {
            children.add(
              const Divider(
                height: 4,
                thickness: .4,
                color: AppColors.borderColor,
              ),
            );
          }
        }

        return AdaptiveTextSelectionToolbar(
          anchors: TextSelectionToolbarAnchors(
            primaryAnchor: details.globalPosition,
          ),
          children: children,
        );
      },
    );
  }
}
