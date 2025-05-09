import 'package:flutter/material.dart';

class LogoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint =
        Paint()
          ..color = const Color(0xFF2962FF)
          ..style = PaintingStyle.stroke
          ..strokeWidth = 8.0;

    // Drawing the chart box
    final RRect boxRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(4, 4, size.width - 8, size.height - 8),
      const Radius.circular(12.0),
    );
    canvas.drawRRect(boxRect, Paint()..color = Colors.white);

    // Drawing chart line
    final Path path = Path();
    path.moveTo(16, size.height * 0.65);
    path.lineTo(32, size.height * 0.65);
    path.lineTo(48, size.height * 0.5);
    path.lineTo(64, size.height * 0.7);
    path.lineTo(80, size.height * 0.4);
    path.lineTo(96, size.height * 0.3);
    path.lineTo(112, size.height * 0.45);

    canvas.drawPath(path, paint);

    // Drawing chart bars
    final Paint barPaint =
        Paint()
          ..color = const Color(0xFF2962FF)
          ..style = PaintingStyle.fill;

    // First dot
    canvas.drawCircle(Offset(16, size.height * 0.65), 4, barPaint);

    // Bars
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(44, size.height * 0.6, 8, size.height * 0.2),
        const Radius.circular(4),
      ),
      barPaint,
    );

    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(60, size.height * 0.55, 8, size.height * 0.25),
        const Radius.circular(4),
      ),
      barPaint,
    );

    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(76, size.height * 0.5, 8, size.height * 0.3),
        const Radius.circular(4),
      ),
      barPaint,
    );

    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(92, size.height * 0.45, 8, size.height * 0.35),
        const Radius.circular(4),
      ),
      barPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
