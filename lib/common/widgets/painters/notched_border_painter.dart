import 'package:flutter/material.dart';

class NotchedBorder extends ShapeBorder {
  final double borderRadius;
  final double notchWidth;
  final double notchHeight;
  final double notchPosition;

  const NotchedBorder({
    this.borderRadius = 8.0,
    this.notchWidth = 12.0,
    this.notchHeight = 8.0,
    this.notchPosition = 0.8,
  });

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.only(top: notchHeight);

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    final path = Path();
    final x0 = rect.left, x1 = rect.right;
    final y0 = rect.top + notchHeight, y1 = rect.bottom;
    final cx = rect.left + rect.width * notchPosition;

    // Điểm start: trên trái (sau notchHeight + borderRadius)
    path.moveTo(x0 + borderRadius, y0);

    // Góc trên trái
    path.arcToPoint(Offset(x0, y0 + borderRadius), radius: Radius.circular(borderRadius), clockwise: false);
    // cạnh trái xuống
    path.lineTo(x0, y1 - borderRadius);
    path.arcToPoint(Offset(x0 + borderRadius, y1), radius: Radius.circular(borderRadius), clockwise: false);
    // cạnh dưới
    path.lineTo(x1 - borderRadius, y1);
    path.arcToPoint(Offset(x1, y1 - borderRadius), radius: Radius.circular(borderRadius), clockwise: false);
    // cạnh phải lên
    path.lineTo(x1, y0 + borderRadius);
    path.arcToPoint(Offset(x1 - borderRadius, y0), radius: Radius.circular(borderRadius), clockwise: false);
    // đi đến chân phải của notch
    path.lineTo(cx + notchWidth / 2, y0);
    // vẽ notch
    path.lineTo(cx, rect.top);
    path.lineTo(cx - notchWidth / 2, y0);
    // quay về start
    path.lineTo(x0 + borderRadius, y0);

    path.close();
    return path;
  }

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    // Chỉ cần trả về outer path để Flutter biết vùng clip bên trong
    return getOuterPath(rect, textDirection: textDirection);
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    // Không cần vẽ gì thêm; PopupMenu sẽ fill color tự động
  }

  @override
  ShapeBorder scale(double t) => this;
}
