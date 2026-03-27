import 'package:flutter/material.dart';

import '../../../core/configs/themes/app_colors.dart';

class DashedRect extends StatelessWidget {
  final Widget child;
  final double strokeWidth;
  final Color? color;
  final double gap;
  final double dashLength;
  final double radius;

  const DashedRect({
    super.key,
    required this.child,
    this.strokeWidth = 0.5,
    this.color,
    this.gap = 4,
    this.dashLength = 6,
    this.radius = 8,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: DashedRectPainter(
        strokeWidth: strokeWidth,
        color: color ?? AppColors.dashRectColor,
        gap: gap,
        dashLength: dashLength,
        radius: radius,
      ),
      child: child,
    );
  }
}

class DashedRectPainter extends CustomPainter {
  final double strokeWidth;
  final Color color;
  final double gap;
  final double dashLength;
  final double radius;

  DashedRectPainter({
    required this.strokeWidth,
    required this.color,
    required this.gap,
    required this.dashLength,
    required this.radius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = color
          ..strokeWidth = strokeWidth
          ..style = PaintingStyle.stroke;

    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    final rrect = RRect.fromRectAndRadius(rect, Radius.circular(radius));

    _drawDashedRRect(canvas, rrect, paint);
  }

  void _drawDashedRRect(Canvas canvas, RRect rrect, Paint paint) {
    final path = Path()..addRRect(rrect);
    final metrics = path.computeMetrics().first;
    double distance = 0.0;
    while (distance < metrics.length) {
      final next = distance + dashLength;
      canvas.drawPath(metrics.extractPath(distance, next), paint);
      distance = next + gap;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
