import 'package:flutter/material.dart';

class CurvePainterLogin extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    print("width :${size.width} ,height :${size.height}");
    var paint = Paint();
    paint.color = Colors.blueAccent;
    paint.style = PaintingStyle.fill;
    var rect = Offset.zero & size;
    paint.shader = LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [Colors.deepPurple, Colors.deepPurple],
    ).createShader(rect);
    var path = Path();
    path.lineTo(0, size.height - 50);

    var controlPoint = Offset(size.width / 4, size.height);
    var endPoint = Offset(size.width / 2, size.height);
    path.quadraticBezierTo(
      controlPoint.dx,
      controlPoint.dy,
      endPoint.dx,
      endPoint.dy,
    );

    controlPoint = Offset(size.width * 3 / 4, size.height);
    endPoint = Offset(size.width, size.height - 50);
    path.quadraticBezierTo(
      controlPoint.dx,
      controlPoint.dy,
      endPoint.dx,
      endPoint.dy,
    );

    path.lineTo(size.width, 0);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
