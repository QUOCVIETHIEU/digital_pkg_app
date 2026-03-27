import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/configs/themes/app_colors.dart';
import '../../../core/typedefs/type_defs.dart';
import '../../../gen/assets.gen.dart';

class ITextFieldSearch extends StatefulWidget {
  const ITextFieldSearch({
    super.key,
    this.size = const Size(double.infinity, 40.0),
    this.radius = 8.0,
    this.onChanged,
    this.onFieldSubmitted,
    this.focusColor = Colors.blue,
    this.hintText = 'Search...',
    required this.value,
  });

  final Size size;
  final double radius;
  final Color focusColor;
  final OnSearchCallback? onChanged;
  final void Function(String)? onFieldSubmitted;
  final String hintText;
  final String value;

  @override
  State<ITextFieldSearch> createState() => _ITextFieldSearchState();
}

class _ITextFieldSearchState extends State<ITextFieldSearch> {
  late TextEditingController controller;

  static const iconSize = 16.0;
  bool isFocus = false;
  bool isClear = false;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: widget.value);
  }

  @override
  void didUpdateWidget(covariant ITextFieldSearch oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Only update controller if the value from parent is different from current text
    // This prevents resetting cursor position when typing
    if (widget.value != oldWidget.value && widget.value != controller.text) {
      controller.text = widget.value;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: (hasFocus) {
        setState(() {
          isFocus = hasFocus;
          isClear = hasFocus && controller.text.isNotEmpty;
        });
      },
      child: Container(
        width: widget.size.width,
        height: widget.size.height,
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 1.0,
              color: isFocus ? widget.focusColor : const Color(0xFFD3D3D3),
            ),
            borderRadius: BorderRadius.circular(widget.radius),
          ),
        ),
        child: TextFormField(
          obscureText: false,
          cursorWidth: 1.0,
          controller: controller,
          maxLines: 1,
          keyboardType: TextInputType.text,
          onTapOutside: (event) => FocusScope.of(context).unfocus(),
          onFieldSubmitted: widget.onFieldSubmitted,
          onChanged: widget.onChanged,
          decoration: InputDecoration(
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
            border: const OutlineInputBorder(borderSide: BorderSide.none),
            prefixIconConstraints: const BoxConstraints(
              minWidth: iconSize,
              minHeight: iconSize,
            ),
            prefixIcon: InkWell(
              onTap: () {
                widget.onChanged?.call(controller.text);
                widget.onFieldSubmitted?.call(controller.text);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 6.0,
                  vertical: 2.0,
                ),
                child: SvgPicture.asset(
                  Assets.icons.common.icoActionSearch,
                  colorFilter: ColorFilter.mode(
                    isFocus ? widget.focusColor : Colors.grey,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
            suffixIconConstraints: const BoxConstraints(
              minWidth: iconSize,
              minHeight: iconSize,
            ),
            suffixIcon: isClear
                ? IconButton(
                    onPressed: () => setState(() {
                      controller.clear();
                      if (widget.onChanged != null) {
                        widget.onChanged?.call('');
                      }
                      if (widget.onFieldSubmitted != null) {
                        widget.onFieldSubmitted?.call('');
                      }
                      isClear = false;
                    }),
                    splashRadius: 16.0,
                    constraints: const BoxConstraints(
                      minWidth: iconSize,
                      minHeight: iconSize,
                    ),
                    icon: const Icon(
                      Icons.clear,
                      size: 16.0,
                      color: Colors.grey,
                    ),
                  )
                : null,
            hintText: widget.hintText,
            hintStyle: const TextStyle(
              fontStyle: FontStyle.italic,
              color: AppColors.textHintColor,
              fontSize: 12.0,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
