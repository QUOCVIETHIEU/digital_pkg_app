import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/configs/themes/app_colors.dart';
import '../../../core/constants/configs.dart';
import '../../../gen/assets.gen.dart';

class ITextField extends StatefulWidget {
  const ITextField({
    super.key,
    this.size = const Size(double.infinity, 48.0),
    this.radius = 8.0,
    this.iconNormal,
    this.iconActive,
    this.hintText = '',
    required this.defaultText,
    this.fontSize = 13.0,
    this.fontWeight = FontWeight.w400,
    this.textAlign = TextAlign.start,
    this.thickness = AppConfigs.borderWidth,
    this.outlineColor = AppColors.borderColor,
    this.focusBorder = AppColors.dodgerBlue,
    this.textInputColor = AppColors.textColor,
    this.showPrefixIcon = true,
    this.autocorrect = false,
    this.enable = true,
    this.readOnly = false,
    this.textInputType = TextInputType.text,
    required this.controller,
  });

  final Size size;
  final double radius;
  final String? iconNormal;
  final String? iconActive;
  final String hintText;
  final String defaultText;
  final double fontSize;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final double thickness;
  final Color outlineColor;
  final Color focusBorder;
  final Color textInputColor;
  final TextInputType textInputType;
  final bool showPrefixIcon;
  final bool autocorrect;
  final bool enable;
  final bool readOnly;
  final TextEditingController controller;

  @override
  State<ITextField> createState() => _ITextFieldState();
}

class _ITextFieldState extends State<ITextField> {
  bool isFocus = false;
  bool isClear = false;
  late TextEditingController _controller;
  @override
  void initState() {
    super.initState();
    _controller = widget.controller;
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: (hasFocus) {
        setState(() {
          isFocus = hasFocus;
          isClear = hasFocus && _controller.text.isNotEmpty;
        });
      },
      child: Container(
        width: widget.size.width,
        height: widget.size.height,
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        margin: const EdgeInsets.symmetric(horizontal: 2.0),
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: widget.thickness,
              color: isFocus ? widget.focusBorder : widget.outlineColor,
            ),
            borderRadius: BorderRadius.circular(widget.radius),
          ),
        ),
        child: TextFormField(
          obscureText: false,
          controller: _controller,
          keyboardType: widget.textInputType,
          autocorrect: widget.autocorrect,
          onTapOutside: (event) => FocusScope.of(context).unfocus(),
          enabled: widget.enable,
          readOnly: widget.readOnly,
          textAlign: widget.textAlign,
          style: TextStyle(
            fontSize: widget.fontSize,
            fontWeight: widget.fontWeight,
            color: widget.enable ? widget.textInputColor : AppColors.textLevel0,
          ),
          onChanged: (text) {
            setState(() => isClear = _controller.text.isNotEmpty);
          },
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 8.0),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
            border: const OutlineInputBorder(borderSide: BorderSide.none),
            suffixIconConstraints: const BoxConstraints(
              minWidth: AppConfigs.iconSize,
              minHeight: AppConfigs.iconSize,
            ),
            prefixIconConstraints: const BoxConstraints(
              minWidth: AppConfigs.iconSize,
              minHeight: AppConfigs.iconSize,
            ),
            prefixIcon: widget.showPrefixIcon
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: SvgPicture.asset(
                      isFocus
                          ? (widget.iconActive ??
                                Assets.icons.textfields.icoTextActive)
                          : (widget.iconNormal ??
                                Assets.icons.textfields.icoTextNormal),
                      width: AppConfigs.iconSize,
                      height: AppConfigs.iconSize,
                    ),
                  )
                : null,
            suffixIcon: isClear
                ? IconButton(
                    onPressed: () => setState(() {
                      _controller.text = '';
                      isClear = false;
                    }),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(
                      minWidth: 16.0,
                      minHeight: 16.0,
                    ),
                    icon: const Icon(
                      Icons.clear,
                      size: 16.0,
                      color: Colors.grey,
                    ),
                  )
                : null,
            hintText: widget.hintText,
            hintStyle: TextStyle(
              fontStyle: FontStyle.italic,
              fontSize: widget.fontSize,
              fontWeight: widget.fontWeight,
              color: AppColors.textHintColor,
            ),
          ),
        ),
      ),
    );
  }
}
