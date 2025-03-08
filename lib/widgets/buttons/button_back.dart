import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  final VoidCallback onPressed;
  final double size;
  final Color color;

  CustomBackButton({
    Key? key,
    required this.onPressed,
    this.size = 30,
    this.color = const Color(0xFF00FFB4),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: CustomPaint(
        size: Size(size, size),
        painter: BackArrowPainter(color: color),
      ),
      onPressed: onPressed,
    );
  }
}

class BackArrowPainter extends CustomPainter {
  final Color color;

  BackArrowPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..strokeWidth = size.width * 0.22  
      ..strokeCap = StrokeCap.round  
      ..strokeJoin = StrokeJoin.round  
      ..style = PaintingStyle.stroke;

    Path path = Path()
      ..moveTo(size.width * 0.95, size.height * 0.10)  
      ..lineTo(size.width * 0.05, size.height * 0.50)  
      ..lineTo(size.width * 0.95, size.height * 0.90); 

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}



