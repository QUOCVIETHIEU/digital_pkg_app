import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/configs/themes/app_colors.dart';
import '../../../core/constants/configs.dart';
import '../../../gen/assets.gen.dart';

class ITextFieldUsername extends StatefulWidget {
  const ITextFieldUsername({
    super.key,
    this.size = const Size(double.infinity, 48.0),
    this.radius = 8.0,
    required this.defaultText,
    this.hintText = 'Nhập mã nhân viên...',
    this.enable = true,
    this.readOnly = false,
    this.onSubmitted,
    required this.controller,
    this.focusNode,
  });

  final Size size;
  final double radius;
  final String defaultText;
  final String hintText;
  final bool enable;
  final bool readOnly;
  final Function(String text)? onSubmitted;
  final TextEditingController controller;
  final FocusNode? focusNode;

  @override
  State<ITextFieldUsername> createState() => _ITextFieldUsernameState();
}

class _ITextFieldUsernameState extends State<ITextFieldUsername> {
  static const iconSize = 24.0;
  bool isFocus = false;
  bool isClear = false;

  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: (hasFocus) {
        setState(() {
          isFocus = hasFocus;
          isClear = hasFocus && widget.controller.text.isNotEmpty;
        });
      },
      skipTraversal: true,
      child: Container(
        width: widget.size.width,
        height: widget.size.height,
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: AppConfigs.borderWidth,
              color: isFocus ? AppColors.dodgerBlue : Colors.grey,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        child: TextFormField(
          focusNode: widget.focusNode,
          obscureText: false,
          controller: widget.controller,
          keyboardType: TextInputType.text,
          autocorrect: false,
          enabled: widget.enable,
          readOnly: widget.readOnly,
          onTapOutside: (event) => FocusScope.of(context).unfocus(),
          onChanged: (text) {
            setState(() {
              isClear = widget.controller.text.isNotEmpty;
            });
          },
          onFieldSubmitted: widget.onSubmitted,
          decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.all(8.0),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
            border: const OutlineInputBorder(borderSide: BorderSide.none),
            suffixIconConstraints: const BoxConstraints(
              minWidth: iconSize,
              minHeight: iconSize,
            ),
            prefixIconConstraints: const BoxConstraints(
              minWidth: iconSize,
              minHeight: iconSize,
            ),
            prefixIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: SvgPicture.asset(
                isFocus
                    ? Assets.icons.textfields.icoUsernameActive
                    : Assets.icons.textfields.icoUsernameNormal,
                width: iconSize,
                height: iconSize,
              ),
            ),
            suffixIcon: isClear && !widget.readOnly
                ? IconButton(
                    onPressed: () => setState(() {
                      widget.controller.text = '';
                      isClear = false;
                    }),
                    constraints: const BoxConstraints(
                      minWidth: iconSize,
                      minHeight: iconSize,
                    ),
                    icon: const Icon(
                      Icons.clear,
                      size: 16.0,
                      color: Colors.grey,
                    ),
                    mouseCursor: SystemMouseCursors.click,
                    focusNode: FocusNode(skipTraversal: true),
                  )
                : null,
            hintText: widget.hintText,
          ),
        ),
      ),
    );
  }
}
