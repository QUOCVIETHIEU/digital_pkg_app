import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/configs/themes/app_colors.dart';
import '../../../core/constants/configs.dart';
import '../../../gen/assets.gen.dart';

class ITextFieldPassword extends StatefulWidget {
  const ITextFieldPassword({
    super.key,
    this.size = const Size(double.infinity, 48.0),
    this.radius = 8.0,
    this.enable = true,
    required this.defaultText,
    this.hintText = 'Nhập mật khẩu...',
    this.onSubmitted,
    required this.controller,
    this.focusNode,
  });

  final Size size;
  final double radius;
  final String defaultText;
  final String hintText;
  final bool enable;
  final Function(String text)? onSubmitted;
  final TextEditingController controller;
  final FocusNode? focusNode;
  @override
  State<ITextFieldPassword> createState() => _ITextFieldPasswordState();
}

class _ITextFieldPasswordState extends State<ITextFieldPassword> {
  static const iconSize = 24.0;

  bool isFocus = false;
  bool isPasswordEye = false;
  bool isPasswordHide = true;
  bool enableShowPassword = false;

  @override
  void initState() {
    super.initState();
    enableShowPassword = widget.controller.text.isEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: (hasFocus) {
        setState(() {
          isFocus = hasFocus;
          isPasswordEye = hasFocus && widget.controller.text.isNotEmpty;
        });
      },
      skipTraversal: true,
      child: Container(
        width: widget.size.width,
        height: widget.size.height,
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: AppConfigs.borderWidth,
              color: isFocus ? AppColors.dodgerBlue : Colors.grey,
            ),
            borderRadius: BorderRadius.circular(widget.radius),
          ),
        ),
        child: TextFormField(
          focusNode: widget.focusNode,
          obscureText: isPasswordHide,
          controller: widget.controller,
          keyboardType: TextInputType.text,
          autocorrect: false,
          enabled: widget.enable,
          onTapOutside: (event) => FocusScope.of(context).unfocus(),
          onFieldSubmitted: widget.onSubmitted,
          onChanged: (text) {
            setState(() {
              if (widget.controller.text.isNotEmpty) {
                isPasswordEye = true;
              } else {
                isPasswordEye = false;
                enableShowPassword = true;
              }
            });
          },
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(8.0),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
            enabledBorder: const OutlineInputBorder(
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
                    ? Assets.icons.textfields.icoPasswordActive
                    : Assets.icons.textfields.icoPasswordNormal,
                width: iconSize,
                height: iconSize,
              ),
            ),
            suffixIcon: isPasswordEye && enableShowPassword
                ? IconButton(
                    onPressed: () =>
                        setState(() => isPasswordHide = !isPasswordHide),
                    constraints: const BoxConstraints(
                      minWidth: iconSize,
                      minHeight: iconSize,
                    ),
                    icon: SvgPicture.asset(
                      width: 16,
                      isPasswordHide
                          ? Assets.icons.textfields.icoEyeShow
                          : Assets.icons.textfields.icoEyeHide,
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
