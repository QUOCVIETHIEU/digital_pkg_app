import 'dart:math';

import 'package:flutter/material.dart';

import '../../../../core/configs/themes/app_colors.dart';
import '../../../core/constants/constants.dart';

class AnimatedDonutPercentIndicator extends StatelessWidget {
  final double percent; // 0.0 - 1.0
  final double size;
  final double strokeWidth;
  final Color color;
  final Color backgroundColor;
  final Duration duration;
  final DonutStatus status;
  final bool showStatus;
  const AnimatedDonutPercentIndicator({
    super.key,
    required this.percent,
    this.size = 50,
    this.strokeWidth = 5,
    this.color = AppColors.colorAnimatedDonut,
    this.backgroundColor = AppColors.backgroundAnimatedDonut,
    this.duration = const Duration(milliseconds: 800),
    this.status = DonutStatus.info,
    this.showStatus = false,
  });

  String get statusLabel {
    switch (status) {
      case DonutStatus.info:
        return 'INFO';
      case DonutStatus.waiting:
        return 'WAITING';
      case DonutStatus.starting:
        return 'STARTING';
      case DonutStatus.inProgress:
        return 'IN PROGRESS';
      case DonutStatus.finish:
        return 'FINISH';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: TweenAnimationBuilder<double>(
        tween: Tween<double>(begin: 0, end: percent),
        duration: duration,
        builder: (context, value, child) {
          return CustomPaint(
            painter: _DonutPainter(
              percent: value,
              strokeWidth: strokeWidth,
              color: color,
              backgroundColor: backgroundColor,
            ),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('${(value * 100).round()}%'),
                  if (showStatus) Text(statusLabel),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _DonutPainter extends CustomPainter {
  final double percent;
  final double strokeWidth;
  final Color color;
  final Color backgroundColor;

  _DonutPainter({
    required this.percent,
    required this.strokeWidth,
    required this.color,
    required this.backgroundColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - strokeWidth) / 2;

    // Draw background circle
    final bgPaint = Paint()
      ..color = backgroundColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(center, radius, bgPaint);

    // Draw foreground arc
    final fgPaint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.butt;

    final startAngle = -90 * pi / 180; // Start at top
    final sweepAngle = 2 * pi * percent;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepAngle,
      false,
      fgPaint,
    );
  }

  @override
  bool shouldRepaint(covariant _DonutPainter oldDelegate) {
    return oldDelegate.percent != percent ||
        oldDelegate.color != color ||
        oldDelegate.backgroundColor != backgroundColor ||
        oldDelegate.strokeWidth != strokeWidth;
  }
}
