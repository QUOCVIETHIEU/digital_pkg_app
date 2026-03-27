import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/configs/themes/app_colors.dart';
import '../../../gen/fonts.gen.dart';
import '../../helpers/utils.dart';
import '../widgets.dart';

enum SelectableCellType { text, double, int, date, dateTime }

extension SelectableCellTypeExtension on SelectableCellType {
  bool get isDateTime =>
      this == SelectableCellType.dateTime || this == SelectableCellType.date;

  bool get showTimePicker => this == SelectableCellType.dateTime;

  bool get isNumber =>
      this == SelectableCellType.double || this == SelectableCellType.int;
}

class SelectableCell<T> extends StatefulWidget {
  const SelectableCell({
    super.key,
    required this.text,
    this.style,
    this.isCenter = false,
    this.maxLines = 1,
    this.overflow,
    this.onSubmit,
    this.validator,
    this.helpText,
    this.type = SelectableCellType.text,
    this.padding = const EdgeInsets.all(4.0),
    this.backgroundColor,
  });

  final String text;
  final TextStyle? style;
  final bool isCenter;
  final int maxLines;
  final TextOverflow? overflow;
  final ValueChanged<T>? onSubmit;
  final String? Function(String?)? validator;
  final String? helpText;
  final SelectableCellType type;
  final EdgeInsetsGeometry padding;
  final Color? backgroundColor;
  @override
  State<SelectableCell<T>> createState() => _SelectableCellState<T>();
}

class _SelectableCellState<T> extends State<SelectableCell<T>> {
  bool _isSelecting = false;
  bool _isEditing = false;
  final FocusNode _focusNode = FocusNode();

  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.text);

    _focusNode.addListener(() {
      if (!_focusNode.hasFocus && (_isSelecting || _isEditing)) {
        // Prevent closing editing state if a dialog or new route is opened
        if (ModalRoute.of(context)?.isCurrent == false) {
          return;
        }

        setState(() {
          _isSelecting = false;
          _isEditing = false;
        });
        // Reset the selection when losing focus
        _controller.selection = const TextSelection.collapsed(offset: 0);
      }
    });
  }

  @override
  void didUpdateWidget(SelectableCell<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.text != widget.text) {
      _controller.text = widget.text;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  Widget _buildContextMenu(
    BuildContext context,
    EditableTextState editableTextState,
  ) {
    final List<Widget> children = <Widget>[];

    // Copy text button
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    const EdgeInsets buttonPadding = EdgeInsets.symmetric(
      horizontal: 8.0,
      vertical: 12.0,
    );
    const BorderRadiusGeometry buttonBorderRadius = BorderRadius.all(
      Radius.circular(6.0),
    );
    const Color baseBg = Colors.transparent;
    final Color baseFg = colorScheme.onSurface;
    final Color hoverBg = colorScheme.primary;
    final Color hoverFg = colorScheme.onPrimary;

    children.add(
      TextButton(
        style: ButtonStyle(
          padding: const WidgetStatePropertyAll<EdgeInsets>(buttonPadding),
          minimumSize: const WidgetStatePropertyAll<Size>(Size(0, 0)),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          alignment: Alignment.centerLeft,
          shape: const WidgetStatePropertyAll<OutlinedBorder>(
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
          overlayColor: const WidgetStatePropertyAll<Color>(Colors.transparent),
        ),
        onPressed: () {
          // Copy the selected text or entire text if nothing is selected
          final String textToCopy;
          final TextSelection selection =
              editableTextState.textEditingValue.selection;
          if (selection.isValid && !selection.isCollapsed) {
            textToCopy = selection.textInside(
              editableTextState.textEditingValue.text,
            );
          } else {
            textToCopy = widget.text;
          }

          Clipboard.setData(ClipboardData(text: textToCopy));
          ContextMenuController.removeAny();
        },
        child: const Align(
          alignment: Alignment.centerLeft,
          child: Row(
            spacing: 3.0,
            children: [
              Icon(Icons.copy),
              Text(
                'Copy text',
                style: TextStyle(
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

    return AdaptiveTextSelectionToolbar(
      anchors: TextSelectionToolbarAnchors(
        primaryAnchor: editableTextState.contextMenuAnchors.primaryAnchor,
        secondaryAnchor: editableTextState.contextMenuAnchors.secondaryAnchor,
      ),
      children: children,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_isSelecting || _isEditing) {
      return TextField(
        controller: _controller,
        readOnly: !_isEditing,
        autofocus: true,
        showCursor: true,
        cursorHeight: 10.0,
        cursorWidth: 1.5,
        scrollPhysics: const ClampingScrollPhysics(),
        cursorColor: Theme.of(context).colorScheme.primary,
        enableInteractiveSelection: true,
        enableSuggestions: false,
        onSubmitted: (value) {
          if (_isEditing) {
            if (widget.validator != null) {
              final error = widget.validator!(value);
              if (error != null) {
                IDialog.showErrorMessage(
                  context: context,
                  message: error,
                  onAction: () {
                    _focusNode.requestFocus();
                  },
                );
                return;
              }
            }
            final validator = widget.validator;
            final validatorResult = validator?.call(value);
            if (validatorResult == null) {
              setState(() {
                _isEditing = false;
              });
              if (widget.type.isNumber) {
                dynamic valueD;
                if (widget.type == SelectableCellType.double) {
                  valueD = double.tryParse(value);
                } else if (widget.type == SelectableCellType.int) {
                  valueD = int.tryParse(value);
                }
                if (valueD != null) {
                  widget.onSubmit?.call(valueD as T);
                }
              } else {
                widget.onSubmit?.call(value as T);
              }
            }
          }
        },
        focusNode: _focusNode,
        style: widget.style,
        textAlign: widget.isCenter ? TextAlign.center : TextAlign.start,
        maxLines: widget.maxLines, // Thêm maxLines
        contextMenuBuilder: (context, editableTextState) {
          return _buildContextMenu(context, editableTextState);
        },
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.zero,
          border: InputBorder.none,
          hintText: '',
        ),
      );
    }

    return GestureDetector(
      onDoubleTap: widget.onSubmit != null
          ? () async {
              setState(() {
                _isEditing = true;
                if (_controller.text != widget.text) {
                  _controller.text = widget.text;
                }
              });
              _focusNode.requestFocus();
              if (widget.type.isDateTime) {
                final initialDate =
                    DateTimeUtils.parseDateTime(
                      widget.text,
                      DateTimeFormat.dateTimeFormats,
                    ) ??
                    DateTime.now();
                final DateTime? dateTime =
                    await DateTimeUtils.showDateTimePicker(
                      context,
                      initialDate: initialDate,
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100),
                      helpText: widget.helpText,
                      showTimePickerFlag: widget.type.showTimePicker,
                    );
                if (dateTime != null) {
                  widget.onSubmit?.call(dateTime as T);
                }
              }
            }
          : null,
      onLongPress: () {
        setState(() {
          if (_controller.text != widget.text) {
            _controller.text = widget.text;
          }
          _isSelecting = true;
        });

        _focusNode.requestFocus();
      },
      child: Container(
        width: double.infinity,
        height: double.infinity,

        color: widget.backgroundColor,
        alignment: widget.isCenter ? Alignment.center : Alignment.centerLeft,
        child: Padding(
          padding: widget.padding,
          child: Text(
            widget.text,
            style: widget.style,
            maxLines: widget.maxLines,
            overflow: widget.overflow ?? TextOverflow.ellipsis,
            softWrap: true,
          ),
        ),
      ),
    );
  }
}
