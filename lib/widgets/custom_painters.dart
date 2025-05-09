import 'package:flutter/material.dart';

class UsersIconPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint =
        Paint()
          ..color = const Color(0xFF2962FF)
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2.5;

    final Offset head1 = Offset(size.width * 0.55, size.height * 0.35);
    final Offset head2 = Offset(size.width * 0.35, size.height * 0.25);
    final double radius = size.width * 0.18;

    canvas.drawCircle(head1, radius, paint); // usuário da frente
    canvas.drawCircle(head2, radius, paint); // usuário de trás

    final Rect body1 = Rect.fromLTWH(
      size.width * 0.37,
      size.height * 0.55,
      size.width * 0.35,
      size.height * 0.25,
    );
    final Rect body2 = Rect.fromLTWH(
      size.width * 0.17,
      size.height * 0.45,
      size.width * 0.35,
      size.height * 0.25,
    );

    canvas.drawRRect(RRect.fromRectAndRadius(body2, Radius.circular(6)), paint);
    canvas.drawRRect(RRect.fromRectAndRadius(body1, Radius.circular(6)), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class CheckboxIconPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint =
        Paint()
          ..color = const Color(0xFF2962FF)
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2;

    // Square
    canvas.drawRect(
      Rect.fromLTWH(
        size.width / 4,
        size.height / 4,
        size.width / 2,
        size.height / 2,
      ),
      paint,
    );

    // Checkmark
    final checkPath =
        Path()
          ..moveTo(size.width / 3, size.height / 2)
          ..lineTo(size.width / 2, 2 * size.height / 3)
          ..lineTo(3 * size.width / 4, size.height / 3);
    canvas.drawPath(checkPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class EditIconPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint =
        Paint()
          ..color = const Color(0xFF2962FF)
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2;

    // Pencil body
    canvas.drawRect(
      Rect.fromLTWH(
        size.width / 3,
        size.height / 4,
        size.width / 3,
        size.height / 2,
      ),
      paint,
    );

    // Pencil tip
    final tipPath =
        Path()
          ..moveTo(2 * size.width / 3, size.height / 4)
          ..lineTo(size.width, size.height / 2)
          ..lineTo(2 * size.width / 3, 3 * size.height / 4);
    canvas.drawPath(tipPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class ChartIconPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint =
        Paint()
          ..color = const Color(0xFF2962FF)
          ..style = PaintingStyle.fill;

    // Bars with different heights
    final barWidth = size.width / 6;
    canvas.drawRect(
      Rect.fromLTWH(barWidth, 3 * size.height / 4, barWidth, size.height / 4),
      paint,
    );
    canvas.drawRect(
      Rect.fromLTWH(3 * barWidth, size.height / 2, barWidth, size.height / 2),
      paint,
    );
    canvas.drawRect(
      Rect.fromLTWH(
        5 * barWidth,
        size.height / 4,
        barWidth,
        3 * size.height / 4,
      ),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class BellIconPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint =
        Paint()
          ..color = const Color(0xFF2962FF)
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2;

    // Bell body
    final bellPath =
        Path()
          ..moveTo(size.width / 2, size.height / 6)
          ..quadraticBezierTo(
            size.width / 8,
            size.height / 3,
            size.width / 4,
            3 * size.height / 4,
          )
          ..lineTo(3 * size.width / 4, 3 * size.height / 4)
          ..quadraticBezierTo(
            7 * size.width / 8,
            size.height / 3,
            size.width / 2,
            size.height / 6,
          );
    canvas.drawPath(bellPath, paint);

    // Clapper
    canvas.drawLine(
      Offset(size.width / 2, 3 * size.height / 4),
      Offset(size.width / 2, 5 * size.height / 6),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class LogoutIconPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint =
        Paint()
          ..color = const Color(0xFF2962FF)
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2.5;

    // Porta
    final double doorWidth = size.width * 0.4;
    final Rect door = Rect.fromLTWH(
      size.width * 0.1,
      size.height * 0.2,
      doorWidth,
      size.height * 0.6,
    );
    canvas.drawRect(door, paint);

    // Seta
    final Path arrow =
        Path()
          ..moveTo(size.width * 0.6, size.height * 0.35)
          ..lineTo(size.width * 0.9, size.height * 0.5)
          ..lineTo(size.width * 0.6, size.height * 0.65);

    canvas.drawPath(arrow, paint);

    // Linha da seta
    canvas.drawLine(
      Offset(size.width * 0.6, size.height * 0.5),
      Offset(size.width * 0.3, size.height * 0.5),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class KPIIconPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint =
        Paint()
          ..color = const Color(0xFF2962FF)
          ..style = PaintingStyle.fill;

    // Desenhar barras
    final double barWidth = size.width / 10;
    canvas.drawRect(
      Rect.fromLTWH(2 * barWidth, size.height / 2, barWidth, size.height / 2),
      paint,
    );
    canvas.drawRect(
      Rect.fromLTWH(
        4 * barWidth,
        size.height / 3,
        barWidth,
        2 * size.height / 3,
      ),
      paint,
    );
    canvas.drawRect(
      Rect.fromLTWH(
        6 * barWidth,
        size.height / 4,
        barWidth,
        3 * size.height / 4,
      ),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class TargetIconPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint =
        Paint()
          ..color = const Color(0xFF2962FF)
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2.5;

    // Desenhar círculos concêntricos
    final double radiusStep = size.width / 6;
    for (int i = 1; i <= 3; i++) {
      canvas.drawCircle(
        Offset(size.width / 2, size.height / 2),
        i * radiusStep,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
