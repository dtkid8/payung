import 'package:flutter/material.dart';

class HomeBottomNavigationBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final borderPaint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    final borderRadius = BorderRadius.circular(20.0);

    final fillPath = Path();

    fillPath.moveTo(borderRadius.topLeft.x, 0);

    fillPath.arcToPoint(
      Offset(0, borderRadius.topLeft.y),
      radius: const Radius.circular(20.0),
      clockwise: false,
    );

    fillPath.lineTo(0, size.height - borderRadius.bottomLeft.y);

    fillPath.arcToPoint(
      Offset(borderRadius.bottomLeft.x, size.height),
      radius: const Radius.circular(20.0),
      clockwise: false,
    );

    fillPath.lineTo(size.width - borderRadius.bottomRight.x, size.height);

    fillPath.arcToPoint(
      Offset(size.width, size.height - borderRadius.bottomRight.y),
      radius: const Radius.circular(20.0),
      clockwise: false,
    );

    fillPath.lineTo(size.width, borderRadius.topRight.y);

    fillPath.arcToPoint(
      Offset(size.width - borderRadius.topRight.x, 0),
      radius: const Radius.circular(20.0),
      clockwise: false,
    );

    fillPath.lineTo(size.width / 2 + 30, 0);

    fillPath.quadraticBezierTo(
      size.width / 2, 
      -30, 
      size.width / 2 - 30, 0,
    );

    fillPath.lineTo(borderRadius.topLeft.x, 0);
    fillPath.close(); 

    canvas.drawPath(fillPath, Paint()..color = Colors.white);

    canvas.drawPath(fillPath, borderPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
