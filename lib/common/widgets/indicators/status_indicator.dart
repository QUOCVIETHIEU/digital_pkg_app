import 'package:flutter/material.dart';

class StatusIndicator<T> extends StatelessWidget {
  final List<T> values;
  final String Function(T) getName;
  final Color Function(T) getColor;
  final double dotSize;
  final double spacing;
  final double borderRadius;
  final TextStyle? textStyle;
  final MainAxisAlignment mainAxisAlignment;
  final String Function(T)? getDescription;
  final TextStyle? descriptionStyle;

  const StatusIndicator({
    super.key,
    required this.values,
    required this.getName,
    required this.getColor,
    this.dotSize = 10.0,
    this.spacing = 8.0,
    this.borderRadius = 2.0,
    this.textStyle,
    this.mainAxisAlignment = MainAxisAlignment.end,
    this.getDescription,
    this.descriptionStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
      child: Row(
        spacing: spacing,
        mainAxisAlignment: mainAxisAlignment,
        children: values.map((value) => _buildIndicator(value)).toList(),
      ),
    );
  }

  Widget _buildIndicator(T value) {
    return Row(
      children: [
        Container(
          width: dotSize,
          height: dotSize,
          margin: EdgeInsets.only(right: 4.0, left: spacing),
          decoration: BoxDecoration(
            color: getColor(value),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        Row(
          spacing: 4.0,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(getName(value), style: textStyle),
            if (getDescription != null) ...[
              Text(getDescription!(value), style: descriptionStyle),
            ],
          ],
        ),
      ],
    );
  }
}
